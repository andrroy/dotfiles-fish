source 'utils.sh'

generate_config() {
    echo "
[user]
    name = $1
    email = $2

[alias]
    c = commit
    cm = commit -m
    cam = commit -am
    s = status --short --branch
    ch = checkout
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --

# Push easily. http://stackoverflow.com/a/23918418/89484
[push]
    default = current
[core]
    editor = vim
" >> ~/.gitconfig
}

install_git_config() {
    print_info "Installing gitconfig"
    print_question "Please enter your full name: "
    read -r full_name </dev/tty

    print_question "Enter your email: "
    read -r email </dev/tty

    generate_config $full_name $email 
    print_success "Gitconfig successfully installed"
}
