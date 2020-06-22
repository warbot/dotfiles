# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew cask install iterm2
# # https://ohmyz.sh/#install
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# # https://github.com/romkatv/powerlevel10k#oh-my-zsh
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# # Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

brew cask install numi # better calc
brew cask install docker
brew cask install rectangle # resize window
brew cask install gimp

brew install git
brew install zsh
brew install tldr # short man
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install the_silver_searcher # ag
brew install unison # file sync
brew install wget
