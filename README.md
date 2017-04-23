# dotfiles-fish
Dotfiles for OS X using Hyper and Fish.

Includes
 - Sensible osx defaults (these are optional)
 - Hyper + hpm package manager. Packages: hyper-snazzy, hyperlinks, hypercwd
 - Fish + oh my fish. Packages: z, pure (in addition to re-search)
 - Homebrew and Brew Casks (Only manditory cask is Hyper)
 - Node and `npm`. Packages: hpm-cli, n, ncu

![result](http://i.imgur.com/rFw1RRP.jpg)

## Getting started
1. Clone repo: `git clone https://github.com/andrroy/dotfiles-fish.git`
2. Install: `cat install.sh | sh`

## Details
 - [Casks](#casks)
 - [The actual dotfiles](actual-dotfiles)
 - [Adding your own packages](installing-your-own-packages)

### Casks
As mentioned above, the only manditory cask is Hyper. In addition you may also install:
 - [Alfred](https://www.alfredapp.com/)
 - [1password](https://1password.com/)
 - [dropbox](https://www.dropbox.com/)
 - [atom](https://atom.io/)
 - [bartender](https://www.macbartender.com/)
 - [moom](https://manytricks.com/moom/)
 - [jetbrains-toolbox](https://www.jetbrains.com/toolbox/)
 - [slack](https://slack.com/)
 - [spotify](https://www.spotify.com/)
 - [transmission](https://transmissionbt.com/)
 - [google-chrome](https://www.google.com/chrome/)
 - [firefox](https://www.mozilla.org/en-US/firefox/new/)
 - [insomnia](https://insomnia.rest/)
 - [postman](https://www.getpostman.com/)
 - [flux](https://justgetflux.com/)
 - [touchswitcher](https://hazeover.com/touchswitcher.html)
 - [itsycal](https://www.mowglii.com/itsycal/)


### Actual dotfiles
The dotfiles collection includes the following:
 - `.hyper.js` - Hyper configuration file
 - `.vimrc` - Simple vimrc file, nothing fancy
 - `.screenrc` - Simple screenrc config
 - `.gitconfig` - Some aliases, in addtion to the users name and email
 - `.dir_colors` - Dir colors when using `ls`
 - `.config` - Directory that keeps the fish config

### Installing your own packages
- Install new Hyper packages with `hpm`
- Install new fish packages with `omf`

Repo inspired inspired by [Morten Vaale Noddeland](https://github.com/mortenvn/new-dotfiles)
