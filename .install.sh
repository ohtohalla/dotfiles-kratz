#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Rosetta 2
echo "Installing Rosetta 2..."
softwareupdate --install-rosetta

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap ferdium/ferdium
brew tap koekeishiya/formulae

# Brew Formulae
brew install neovim
brew install wget
brew install neofetch
brew install wireguard-go
brew install mactex
brew install starship
brew install zsh-syntax-highlighting
brew install mas
brew install nnn
brew install aerc
brew install docker
brew install ferdium
brew install yabai
brew install skhd


# Brew Casks
echo "Installing Brew Casks..."
brew install --cask zoom
brew install --cask vlc
brew install --cask tidal
brew install --cask kitty
brew install --cask r
brew install --cask rstudio
brew install --cask font-iosevka-nerd-font
brew install --cask amethyst
brew install --cask rectangle
brew install --cask firefox-developer-edition
brew install --cask vscodium
brew install --cask qgis
brew install --cask librewolf
brew install --cask zotero

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 497799835 #xCode
mas install 803453959 #Slack
mas install 1511601750 #1Password 8
mas install 1137397744 #Bitwarden
mas install 874139669 #Signal



# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.spaces spans-displays -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write com.apple.screencapture location -string "$HOME/Pictures"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
killall Dock

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copying and checking out configuration files
rm ~/.zshrc
rm -rf ~/.dots
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
echo ".dots" >> .gitignore
git clone --bare git@github.com:ohtohalla/macos_dots.git $HOME/.dots/
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
source $HOME/.zshrc

# Python Packages
echo "Installing Python Packages..."
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
source $HOME/miniconda/bin/activate
$HOME/miniconda

conda install -c apple tensorflow-deps
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
conda install matplotlib
conda install jupyterlab
conda install seaborn
conda install nltk
pip install debugpy
pip install sklearn

# Install Vim Plug and Neovim packages

echo "nvim" >> .gitignore

mkdir -p ~/.config/nvim
git clone https://github.com/ohtohalla/nvim-lsp-config/ ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
nvim '+PlugInstall | qa'
nvim '+PlugUpdate | qa'

brew services start yabai
brew services start sketchybar
brew services start skhd
       

echo "Setup complete!\nRun 'nvim +PlugUpdate' and restart...\n After restart install DataLore and DataGrip."


