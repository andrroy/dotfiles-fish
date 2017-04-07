print_error() {
    print_in_red "  [✖] $1 $2\n"
}

print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_in_purple() {
    printf "\e[0;35m$1\e[0m"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_in_yellow() {
    printf "\e[0;33m$1\e[0m"
}

print_heading() {
    print_in_purple "\n $1\n\n"
}

print_info() {
    print_in_purple "  [ℹ] $1\n"
}

print_question() {
    print_in_yellow "  [?] $1 [y/n]"
}

print_success() {
    print_in_green "  [✔] $1\n"
}

ask_question() {
    print_question "$1"
    read -r response </dev/tty
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else 
        return 1
    fi
}