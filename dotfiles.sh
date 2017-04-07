install_dotfiles() {
    CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

    dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )           # dotfiles directory
    olddir=~/dotfiles_old                                           # old dotfiles backup directory
    # files="zshrc vimrc screenrc scripts aliases dir_colors"         # list of files/folders to symlink in homedir    
    files="hyper.js vimrc screenrc gitconfig dir_colors config"         # list of files/folders to symlink in homedir    
    # TODO: Move files to sub dir /dotfiles
    # TODO: Add actual files to vcs

    # create dotfiles_old in homedir
    echo "\033[0;33m Creating $olddir for backup of any existing dotfiles in ~ \033[0m"
    mkdir -p $olddir
    echo "${green}Done!${NC}"
    # change to the dotfiles directory
    echo "\033[0;33m Changing to the $dir directory \033[0m"
    cd $dir
    echo "${green}Done!${NC}"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
    for file in $files; do
        echo "\033[0;33m Moving any existing dotfiles from ~ to $olddir \033[0m"
        mv ~/.$file ~/dotfiles_old/
        echo "\033[0;33m Creating symlink to $file in home directory. \033[0m"
        ln -s $dir/$file ~/.$file
    done

    # Check for private aliases, add if exists
    if [ -f $dir/private_aliases ]; then
        ln -sf $dir/private_aliases ~/.private_aliases
    fi
}