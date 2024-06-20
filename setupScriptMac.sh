
echo "go to github and add your key (in the clipboard)"
################## git must be installed, dotfiles cloned first. Before running, get keys set up
#
### ssh setup
# Uncomment this line, put in your github credential
# ssh-keygen -t rsa -b 4096 -C <your github email here>
#### will ask for passphrase prompt etc
# Uncomment the corresponding lines to copy key
# xclip -sel clip < ~/.ssh/id_rsa.pub [in linux]
# cat ~/.ssh/id_rsa.pub | pbcopy in mac[in mac]
cd ~/
brew install vim
brew install --cask mactex
brew install zsh
######## tex setup
ln -s ~/dotfiles/texmf ~/texmf
texhash ~/texmf
chsh -s `which zsh`
