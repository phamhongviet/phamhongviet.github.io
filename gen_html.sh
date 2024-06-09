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
<style>
html {
  margin: 0 auto;
  max-width: 900px;
}
body {
  font-family: Georgia, "Times New Roman", serif;
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
