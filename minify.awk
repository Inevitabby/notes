# Minify CSS
/<style/,/<\/style/ {
	gsub(/\/\*.*\*\//, ""); # Remove comments
	gsub(/[ \t]+/, " "); # Remove multiple spaces and tabs
	printf "%s", $0; # Print without newline
	next;
}
# Minify JavaScript
/<script/,/<\/script/ {
	if (/<script/) {
		inScript = 1;
		printf "%s", $0; # Print without newline
		next;
	} else if (/<\/script/) {
	inScript = 0;
	printf "%s", $0; # Print without newline
	next;
}
if (inScript) {
	gsub(/\/\/.*$/, ""); # Remove single-line comments
	gsub(/\/\*.*\*\//, ""); # Remove multi-line comments
	gsub(/[ \t]+/, " "); # Remove multiple spaces and tabs
	printf "%s", $0; # Print without newline
}
next;
}
# Minify HTML
{
	gsub(/<!--.*-->/, ""); # Remove HTML comments
	gsub(/[ \t]+/, " "); # Remove multiple spaces and tabs
	printf "%s", $0 " "; # Print without newline, but include an extra space to avoid breaking LaTeX
	next;
} 1
