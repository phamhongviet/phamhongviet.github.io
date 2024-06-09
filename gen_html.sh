#!/bin/bash

find . -name '*.md' | while read md_f; do
echo "- ${md_f}"
html_f=${md_f/.md/.html}
f_name=$(basename "$md_f")
title=${f_name/.md/}

# header
cat > "$html_f" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<title>${title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<style>
html {
  margin: 0 auto;
  max-width: 900px;
}
body {
  font-family: "Noto Serif", Georgia, "Times New Roman", serif;
}
</style>
</head>
<body>
EOF

# body
pandoc -f markdown -t html "$md_f" >> "$html_f"

# footer
cat >> "$html_f" <<EOF
</body>
</html>
EOF

done
