#!/usr/bin/env bash

BLOG_DIR="docs/blog"
INDEX_FILE="$BLOG_DIR/index.md"

cat > "$INDEX_FILE" <<EOF
# Blog

EOF

find "$BLOG_DIR" -maxdepth 1 -name "*.md" \
  ! -name "index.md" \
  | sort -r \
  | while read -r file; do

    filename=$(basename "$file")

    title="${filename%.md}"
    title=$(echo "$title" | sed 's/-/ /g')

    echo "- [$title]($filename)" >> "$INDEX_FILE"

done
