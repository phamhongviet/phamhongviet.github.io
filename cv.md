# PHAM HONG VIET

Email:  phamhongviet52@gmail.com    

## Introduction

I am a seasoned DevOps Engineer and Infrastructure Architect based in Ho Chi Minh City, with over 9 years of experience in building and scaling enterprise-grade web applications. At GuardRails and Timo Digital Banking, I've led critical infrastructure modernization initiatives that significantly enhanced system reliability, security, and performance. My expertise encompasses the complete DevOps lifecycle, from infrastructure automation with Ansible and Terraform to container orchestration with Kubernetes and cloud architecture on AWS and Azure. I excel in optimizing cloud costs, implementing robust monitoring solutions, and establishing secure CI/CD pipelines. As a team leader, I've successfully built and mentored DevOps teams while driving the adoption of Infrastructure as Code practices and security first methodologies. I am particularly passionate about solving complex scalability challenges and implementing DevSecOps practices that enable organizations to deliver value rapidly and securely.


## Highlighted Skills

- Leverage agentic AI coding assistants to enhance development productivity (Cursor, VSCodium + RooCode).
- Analyze system and application performance and behavior to help making decisions.
- Automate infrastructure tasks at large scale using wide variety of tools and programming languages including Ansible, Terraform, Bash, Python, Jenkins, Kubernetes, etc.
- Manage Linux servers. Deep understanding of GNU/Linux. Have been using ArchLinux at home and work as my daily driver since 2010.
- Develop system daemons, tools and web services using Golang, Python and C. (see Side Projects below)
- Manage MariaDB servers, optimizing queries by analyzing application usages, data types, index usages.
- Install and maintain Kubernetes clusters with RKE (Rancher), Kubespray.
- Provision EKS and AKS clusters and other cloud resources on AWS and Azure with Terraform.
- Deploy services on Kubernetes with Helm charts.
- Manage servers resource capacity, recommend purchase plan based on actual usage and help building cloud cost model and budgeting.


## Career History

### GuardRails, DevSecOps platform (02/2022 - Present)

Start as the first DevOps Engineer at GuardRails.

- Improve many aspects of GuardRails infrastructure security following SOC 2 standards.
- Improve application development with CircleCI.
- Monitor the cloud application with NewRelic (collect metrics data and logs from a number of sources, create relevant dashboards and alert policies).
- Significantly improve the on-premise application packaging with KOTS (including preflight tests, support bundle generation, and the application definition)
- Load test the on-premise application and create a resource capacity estimation calculator as a reference for customers
- Control cloud computing cost
  - Reduced Aurora database costs by 50% through query optimization and performance tuning
  - Achieved 80% reduction in EC2 costs by implementing autoscaling, right-sizing instances, and leveraging spot instances

### Timo digital banking (05/2017 - 02/2022)

DevOps Team Leader at Timo.    
I started as a one-man-team DevOps Engineer to help modernizing Timo systems, services, processes; help other teams in IT department work smoothly with each other; and later build up my DevOps/SysOps team.

- Significantly improving Timo's performance, availability, reliability, scalability and security
	- Transformed Timo from running blind to having comprehensive monitoring by implementing:
		- Full-stack observability with Grafana, ElasticSearch, Logstash, Kibana (ELK) and InfluxDB
		- Deep database insights including InnoDB buffer pool usage, query performance, replication lag
		- Infrastructure metrics covering CPU, memory, disk I/O, and network utilization
		- Application-level monitoring
	- Optimizing application and infrastructure performance through monitoring insights:
		- Reduced a critical user-facing API endpoint from 1s to 25ms by identifying and fixing inefficient database queries
		- Optimized daily reconciliation job from 12 hours to 4 minutes through query optimization and bash scripting
	- Hammering the application with locust.io and providing deeper visibility for its performance
	- Making change with confidence by practicing infrastructure as code with Ansible, Terraform
	- Enhancing security with internal Public Key Infrastructure (PKI)
	- Analyzing MariaDB slow queries to help developers write better SQL queries, design better table schemas, and use more suitable index
	- Automate repeative boring tasks with Bash, Python and Jenkins, help reducing work load for other teams
- Migrating Timo systems from VMWare on premise infrastructure to AWS
	- Using AWS lift and shift strategy to minimize risks
	- Minimize downtime with well thought out plans and high coordination across multiple teams
	- Continuously improving Timo systems on AWS following Well Architected Framework
- Help IT team and Product team work efficiently with each other and create products or features with suitable technologies, great user experience and low operational cost.

### Zinio, magazine publishing platform (04/2014 - 03/2017)

Linux System Administrator at Zinio/Audience Media Ltd.    
I started as the only System Admin in Audience Media (acquired by Zinio), then build up my System team as the company grow.

- Deploying highly available News website for Zinio's client
	- 55 millions page views per month
	- Using AWS EC2, CloudFront, ELB, Httpd, Varnish, Redis, Percona and Ansible
	- Optimizing cache usage to ensure the balance of performance and correctness
- Deploying massive web services for Zinio's magazine publishing platform
	- Highly available, autoscale-able, self-healing, manageless
	- Almost fully automated and monitored system
	- Micro services infrastructure applications
	- Using Scalr, AWS EC2, ELB, Docker, Consul, New Relic
- Developing and deploying high performance image manipulation service
 	- Written in Golang 1.4 with TDD, automated test, packaging and deployment
	- Cache using Varnish and Redis
	- Used in Zinio's magazine publishing platform
- Developing tool for creating web development environment for Zinio's development teams
	- Using Bash script and Docker (before docker-compose and docker-machine exist)
	- Almost identical to production environment
	- Automatic creating, configuring and recreating
- Deploying multiple Wordpress sites with required theme and plugins for Zinio's clients
	- Automated using Python script, git and Ansible
	- Updating plugins and themes for multiple Wordpress sites in multiple web servers


## Side Projects

- Help fighting fraud at Timo with Python script by reading from database and detecting certain patterns
- Build a PoC Python auto scaling service for a cloud provider who use CloudStack
- TLS/SSL certificates generation tool for internal PKI
    - [certtool-pki](https://github.com/phamhongviet/certtool-pki)
- Dynamic Ansible inventory with MySQL backend (Python)
    - [ansible-inventory-mysql](https://github.com/phamhongviet/ansible-inventory-mysql)
- DNS service and template engine with Hashicorp's Serf, decentralized cluster management (Golang)
    - [serf-dns](https://github.com/phamhongviet/serf-dns)
    - [serf-template](https://github.com/phamhongviet/serf-template)
- Extract links and their positions from PDF files using xpdf (C++), used in Zinio's magazines
- A small daemon to watch a folder for file write events and push job to message queue (C, inotify, hiredis), used in Zinio's PDF ingestion


## Education

- Bachelor of Sciences of IT at Ho Chi Minh University of Sciences
- Outstanding Diploma of Network Engineering at NIIT, Hoa Sen University

### Books read:

- Kubernetes In Action
- Infrastructure as Code
- Time Management for System Administrators
- Good to Great
- The Phoenix Project
- Web Operations
- Site Reliability Engineer
- Effective Monitoring and Alerting
- Clean Code
- The Clean Coder
- The Art of UNIX Programming
- The Art of Capacity Planning: Scaling Web Resources
- 12factor.net

### Books partially read:

- The Adventures of an IT Leader
- The Pragmatic Programmer
- SOA Patterns
- Scalability Rules
- Distributed Systems: Principles and Paradigms
- Advanced API Security
- Working with Legacy Systems
- Working Effectively with Legacy Code
- The Design of Everyday Things
- Patterns of Enterprise Application Architecture


## Reference

- Mr. Stefan Streichsbier (GuardRails, CTO)
- Mr. Andrew Duck (Zinio, CTO | GuardRails, CEO)
- Mr. Alan Barker (Timo, CTO)
