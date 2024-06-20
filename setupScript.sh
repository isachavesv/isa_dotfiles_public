################## git must be installed, dotfiles cloned first
sudo apt-get update
sudo apt-get install vim vim-nox tint2 terminator clipit dmenu zsh conky openbox evince htop texlive-full latexmk python3-numpy python3-scipy ipython3 python3-matplotlib xzdec xclip
# xclip for copying from command line
# without flag, 1.5 GB. With, 16 MB ...
# Non-conda install, update this
sudo apt-get install python3-sympy --no-install-recommends
#get rid of latex documentation clutter
sudo apt-get remove texlive-fonts-recommended-doc texlive-latex-base-doc texlive-latex-recommended-doc texlive-pictures-doc texlive-pstricks-doc
# these lines are a bit experimental
######## tex setup
ln -s ~/dotfiles/texmf ~/texmf
texhash ~/texmf
chsh -s `which zsh`
