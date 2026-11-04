#!/bin/sh
# Tests the built site in public/
# Requires: lychee, xmllint
cd "$(dirname "$0")/.." || exit 1

for cmd in lychee xmllint; do
	command -v "$cmd" >/dev/null || { echo "Missing dependency: $cmd" >&2; exit 1; }
done
[ -d public ] || { echo "No public/ directory; run ./daemon.sh -o first" >&2; exit 1; }

status=0

printf "Checking homepage exists \n"
test -s public/index.html || { echo "public/index.html is missing or empty"; status=1; }

printf "Checking no pages are empty \n"
! find public -name '*.html' -empty | grep . || { echo "^ Empty pages (Pandoc probably failed on them)"; status=1; }

printf "Checking sitemap is valid XML \n"
xmllint --noout public/sitemap.xml || status=1

printf "Checking links \n"
lychee --offline --no-progress --index-files index.html --root-dir "$PWD/public" 'public/**/*.html' || status=1

[ "$status" -eq 0 ] && printf "\033[1;32mAll tests passed\033[0m\n" || printf "\033[1;31mTests failed\033[0m\n"
exit "$status"

