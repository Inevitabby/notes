{
    if ($0 ~ /{/) {
        in_rule++;
    }
    if ($0 ~ /}/) {
        in_rule--;
    } 
    if (in_rule == 0) {
        print $0 # Print with newline
    } else {
        printf "%s", $0 # Print without newline
    }
}
