# How I give my agent room for mistakes

*Because it will make mistakes anyway.*

## SSH Restricted Shell

2026-11-21

---

I was given access to a customer's Kubernetes cluster to manage a namespace. I have to SSH to a bastion box. On the box, I can use `kubectl` to connect to the cluster. I was given namespace admin permission. I asked for an extra user with read-only permissions and was denied.

I use an AI agent to help me with certain tasks, mostly troubleshooting when things don't work. Who wouldn't these days, right? But I don't want my agent to have a full shell on the bastion box, and certainly not namespace admin access through `kubectl`.

I can tell my agent in `AGENTS.md` to change nothing and make no mistakes. But sometimes, how I understand my prompt isn't how my agent understands it. I can type “help me fix this issue” when what I mean is “write a `patch.yaml` and let me review it and apply it myself.” My agent might instead take that to mean “fix this issue” and run `kubectl patch` without my review.

My agent will misunderstand me and do something hazardous on prod. It has happened before quite a lot of times. And it will happen again.

---

So I wrote a restricted shell (well, my agent wrote it), which my agent is forced to use when it connects to the box with its own SSH key.

I initially wanted to write the shell in Python. But the bastion box is so slim that Python isn't installed. I'm in luck: the box has Perl. So I wrote `rok.pl` (read-only kubectl). And no, I don't know Perl.

My `~/.ssh/authorized_keys` on the bastion looks like this (key data shown as placeholders):

```text
ssh-ed25519 <my-public-key> me
restrict,command="/home/myuser/bin/rok.pl" ssh-ed25519 <agent-public-key> agent
```

One line contains my normal SSH public key, which grants full shell access. The other contains my agent's public key. For that key, `command=` forces SSH to run `rok.pl`.
My agent runs in a docker container. It can’t access my private key, my SSH agent socket, or my ControlMaster socket. More on that later.

---

What `rok.pl` does is very simple: it checks the requested command, which SSH passes in `SSH_ORIGINAL_COMMAND`, against a pattern. If the command matches the pattern, it's executed. Otherwise, an error code is returned, telling the agent what it cannot do. It's basically an allowlist for my agent's `kubectl` commands.

```perl
my @ALLOWED_COMMAND_PREFIXES = (
    [qw(date)],
    [qw(uptime)],
    [qw(kubectl get)],
    [qw(kubectl describe)],
    [qw(kubectl logs)],
    [qw(kubectl explain)],
);
```

In my `AGENTS.md`, I tell my agent to run `ssh bastion kubectl` to access the cluster, with a few examples.

There are limitations. For example, `rok.pl` doesn't allow pipes or multiple commands. But I can live with that. My agent does the hard work anyway. Piping can be done locally, usually with `grep`. SSH connections can be reused with `ControlMaster`, so it doesn't matter much whether I run one command or several.

---

My agent can still do `kubectl get secret`. It's still a valid read-only operation. A restricted shell that allows `kubectl get`, `describe`, and `logs` doesn't prevent my agent from reading sensitive data. Not perfect, but still much better than a full shell. My agent's reading secrets isn't the end of the world. Most of the time, it's smart enough to redact the secret on its own.

*Edit: I gave my agent a tunnel to the database and a read-only database account. But because it can still run `kubectl get secret`, it could find credentials that let it write to the database.*

Over time, I added more and more commands to `rok.pl`. Some of them use `kubectl exec` to run commands like `ls`, `cat`, `tail`, and `head`. Some of them are scripts to fix edge cases while the devs find a better solution. I can hardly call it Read-Only-Kubectl anymore. But the name stays. I will refuse to answer what `rok` stands for if anyone asks.

```perl
my @ALLOWED_COMMAND_PREFIXES = (
    [qw(date)],
    [qw(uptime)],
    [qw(kubectl get)],
    [qw(kubectl describe)],
    [qw(kubectl logs)],
    [qw(kubectl explain)],
    [qw(kubectl exec * -- ls)],
    [qw(kubectl exec * -- grep)],
    [qw(kubectl exec * -- find)],
    [qw(kubectl exec * -- head)],
    [qw(kubectl exec * -- tail)],
    [qw(kubectl exec * -- cat)],
    [qw(kubectl exec * -- df)],
    [qw(kubectl exec * -- du)],
    [qw(tmux new -d ./terminate-zombie-task.sh)],
    [qw(./terminate-zombie-task.sh)],
);
```

*Edit: While writing this blog post, I realized that allowing `find` is dangerous. With unchecked arguments, my agent can use `find` to delete files, or execute anything inside the pod. Oops. Even `grep`, `cat`, `head`, and `tail` can be dangerous. For example, `cat /proc/1/environ` can expose the same database credentials my service uses.*

Take `terminate-zombie-task.sh`. It uses `kubectl exec` to run Python in every pod of `statefulset/my-app` and passes the Python script over stdin. The Python code checks a condition in the database and terminates only the processes that match. Although the script runs with much higher privileges than I give my agent directly, it's been reviewed and well tested. My agent can run the script on my behalf.

A restricted shell is an old pattern. A remote Git server that accepts SSH connections also uses this pattern to let users run Git commands without giving them shell access.

With this, I sleep better when mistakes don't create incidents.

