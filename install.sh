source 'utils.sh'
source 'brew.sh'
source 'dotfiles.sh'

BREW_PACKAGES="fish coreutils node nmap pyenv python3 z yarn wget vim"
ESSENTIAL_BREW_CASKS="hyper"
OTHER_BREW_CASKS=""

NPM_PACKAGES="hpm-cli"
OMF_PACKAGES="z pure"
HPM_PACKAGES="hyper-snazzy hyperlinks hypercwd"

echo "###################################"
echo "###   Dotfiles installation   #####"
echo "###################################"

echo ""

# Get sudo from user
print_info "You might need to input your sudo password"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#############################################
print_heading "\nOSX Stuff"

print_info "Setting up Command Line Tools (this might take a few minutes)"

if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
   print_info "Command line tools already installed"
else
   touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    PROD=$(softwareupdate -l |
      grep "\*.*Command Line" |
      head -n 1 | awk -F"*" '{print $2}' |
      sed -e 's/^ *//' |
      tr -d '\n')
    softwareupdate -i "$PROD" --verbose;
fi


print_success "Xcode successfully installed"

# # Show hidden files
if ask_question "Show hidden files?"; then
    defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder
    print_success "Hidden files is now displayed in Finder"
fi  

# # Finder column view
if ask_question "Use column view in all Finder windows by default?"; then
  defaults write com.apple.finder FXPreferredViewStyle Clmv
  print_success "Column view is now default"
fi  

# TODO: Remove all apps in dock
# TODO: Reverse search
# TODO: Only install if OS = Darwin

# # Teeny tiny dock
if ask_question "Make dock tiny?"; then
    # https://www.quora.com/How-can-I-completely-hide-or-remove-the-Dock-in-Mac-OS-X-Yosemite
    defaults write com.apple.dock tilesize -int 10
    killall Dock
    print_success "Dock is now teeny tiny"
fi  

#############################################
# print_info "\nDotfiles"
# install_dotfiles

#############################################
# print_info "\nHomebrew"
# # Install Brew
# install_brew
# install_brew_packages $BREW_PACKAGES
# install_essential_brew_casks $ESSENTIAL_BREW_CASKS

# if ask_question "Do you want to install the following casks: $OTHER_BREW_CASKS?"; then
#     install_brew_casks $OTHER_BREW_CASKS
# fi  


###############################################
# print_info "\nFish and Oh my fish"

# print_info "Setting fish as default shell"
# echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# chsh -s /usr/local/bin/fish
# print_success "Fish successfully set as default shell"

# print_info "Installing oh my fish"
# curl -L https://get.oh-my.fish | fish
# print_success "Oh my fish successfully installed"

# print_info "Installing oh my fish packages"
# omf install $OMF_PACKAGES
# print_success "OMF packages successfully installed"


##################################################
# print_info "\n Adding Hyper packages"
# hpm install $HPM_PACKAGES

##################################################
# npm install -g n $NPM_PACKAGES



print_success "Install completed successfully! "
