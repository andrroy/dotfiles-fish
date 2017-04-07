source 'utils.sh'

install_essential_brew_casks() {
    print_info "Installing Cask"
    brew tap caskroom/cask
    print_success "Cask installed"
    print_info "Installing essential casks"
    brew cask install "$1"
    print_success "Essential casks successfully installed"
}

install_brew_casks() {
    print_info "Installing packages"
    brew cask install "$1"
    print_success "All casks successfully installed"
}

install_brew_packages() {
    print_info "Installing packages"
    brew install "$1"
    print_success "All packages successfully installed"
}

install_brew() {
    print_info "Checking if Homebrew is installed"
    if ! which brew > /dev/null; then
        print_info "Not installed, installing.."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        print_info "Running brew doctor.."
        brew doctor
        print_success "Homebrew successfully installed!"
    else
        print_info "Homebrew already installed!"
    fi
}