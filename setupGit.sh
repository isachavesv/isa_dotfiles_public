# Generates key
# Substitute your own email here
ssh-keygen -t rsa -b 4096 -C <your email here> 
# Will prompt for passphrase"
eval "(ssh-agent -s)" 
# initiates keyring
ssh-add ~/.ssh/id_rsa
#### Now add key to github, uncomment corresponding lines.
# TODO: Make it detect OS, run automatically
## For linux
#sudo apt-get install xclip
#xclip -sel clip < ~/.ssh/id_rsa.pub
# For Mac
# cat ~/.ssh/id_rsa.pub | pbcopy in mac[in mac]
echo "Now paste your clipboard onto add key in github's web GUI"
