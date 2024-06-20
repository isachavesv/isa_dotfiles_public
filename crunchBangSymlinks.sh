# Linux setup (should merge at some point with makesymlinks.sh; see more documentation there).

##########

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="terminator/config  openbox/menu.xml openbox/rc.xml openbox/autostart tint2/tint2rc"    # list of files/folders to symlink in homedir. conkyrc is special case

##########

echo "Making local user terminator and tint2 directories for lubuntu install"
mkdir -p ~/.config/terminator/config
mkdir -p ~/.config/tint2/tint2rc

echo "Moving any existing dotfiles from ~ to $olddir"

# Special cases
mv ~/.conkyrc $olddir
ln -s $dir/conkyrc ~/.conkyrc

# Config Files
for file in $files; do
	mv ~/.config/$file $olddir
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.config/$file
done

