#!/bin/bash

find . -name '*.md' | while read md_f; do
echo "- ${md_f}"
html_f=${md_f/.md/.html}

# header
cat > "$html_f" <<EOF
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
