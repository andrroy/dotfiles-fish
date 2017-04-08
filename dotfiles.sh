source 'utils.sh'

install_dotfiles() {
    dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )/dotfiles" && pwd )       # dotfiles directory
    olddir=~/dotfiles_old                                                # old dotfiles backup directory
    files="hyper.js vimrc screenrc gitconfig dir_colors config"          # list of files/folders to symlink in homedir    

    # create dotfiles_old in homedir
    print_info "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    print_success "Done!"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
    print_info "Moving any existing dotfiles from ~ to $olddir"
    for file in $files; do
        mv ~/.$file ~/dotfiles_old/
        print_info "Creating symlink to $file"
        ln -s $dir/$file ~/.$file
    done
    print_success "Dotfiles successfully created"
}