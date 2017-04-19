source 'utils.sh'
source 'brew.sh'
source 'dotfiles.sh'
source 're_search.sh'

BREW_PACKAGES="fish coreutils node nmap pyenv python3 z yarn wget vim"
ESSENTIAL_BREW_CASKS="hyper"
OTHER_BREW_CASKS="1password dropbox atom bartender moom jetbrains-toolbox slack spotify transmission google-chrome firefox insomnia postman flux touchswitcher itsycal"

NPM_PACKAGES="hpm-cli n ncu"
OMF_PACKAGES="z pure"
HPM_PACKAGES="hyper-snazzy hyperlinks hypercwd"

echo "###################################"
echo "###   Dotfiles installation   #####"
echo "###################################"

echo ""

# Ensure that script is run on OSX
if ! [ "$(uname)" == "Darwin" ]; then
    print_error "This script only supports osx"
    exit 2
fi

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
if ask_question "Show hidden files in Finder?"; then
    defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder
    print_success "Hidden files are now visible"
fi

# # Show hidden files
if ask_question "Enable key repeat?"; then
    defaults write -g ApplePressAndHoldEnabled -bool false
    print_success "Key repeat enabled"
fi

# # Teeny tiny dock
if ask_question "Make dock tiny?"; then
    # https://www.quora.com/How-can-I-completely-hide-or-remove-the-Dock-in-Mac-OS-X-Yosemite
    defaults write com.apple.dock tilesize -int 10
    killall Dock
    print_success "Dock is now teeny tiny"
fi  


#############################################
print_heading "\nDotfiles"
install_dotfiles


#############################################
print_heading "\nHomebrew"
# Install Brew
install_brew
install_brew_packages $BREW_PACKAGES
install_essential_brew_casks $ESSENTIAL_BREW_CASKS

if ask_question "Do you want to install the following casks: $OTHER_BREW_CASKS?"; then
    install_brew_casks $OTHER_BREW_CASKS
fi  


##################################################
print_heading "\nNPM packages"
npm install -g $NPM_PACKAGES


###############################################
print_heading "\nFish and Oh my fish"

print_info "Setting fish as default shell"
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
print_success "Fish successfully set as default shell"

print_info "Installing oh my fish"
curl -L https://get.oh-my.fish | fish
print_success "Oh my fish successfully installed"

print_info "Installing oh my fish packages"
/usr/local/bin/fish -i -c "omf install $OMF_PACKAGES"
print_success "OMF packages successfully installed"

print_info "Installing re search to fish"
install_re_search
print_success "Re search successfully installed"


##################################################
print_heading "\n Hyper packages"
print_info "Installing hyper packages"
hpm install $HPM_PACKAGES
print_success "All hyper packages successfully installed"


print_success "Install completed successfully! "
