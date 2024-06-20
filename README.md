Scripts I wrote/copy pasted/adapted to install my stack/dotfiles on any machine. Expects sudo access various places.

Plug and play for mac. Needs some adapting for Debian and Ubuntu derivatives. Ran it as is on (sadly defunct, much mourned) crunchbag and in Lubuntu distros.
Installs my favorite vim plugins, gets my zsh and vim setup running (moves existing ones to back up folder, dotfiles_old), Latexmk forcontinuous compilation via command line.

WARNING:
My vimrc is is obviously superior, perfect, the accretion of perfect wisdom gained and lost, like Roman self-healing cement. It may also ruin your wrists and muscle memory.

Gets vim-Latex aka latexsuite working with very nice autocomplete--practically an antique, since the plugin is no longer updated.

Basic flow:
    run setupSCript first (add permissions via chmod)
    run makeSymlinks
If in linux, careful, create terminator file and tint2 file before running the following (this is now in crunchBang script)
    run crunchBangLinks (for linux specific things)
For Lubuntu:
    Recall lubuntu-rc.xml controls everything (your rc.xml will not be read)
