"Isa's .vimrc. Currently messy, but with lots of comments. Eventually I will
"put it up on the web. I've tried to be very conscientious about citing
"sources
"I believe most settings adaptations come from
"http://nvie.com/posts/how-i-boosted-my-vim/, ie. the tab configuration stuff.
"Isa: Moolenaar's original header
" Bram Moolenaar's example setup.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Vundle and Pluging management
filetype off 		"Isa: Required for vundle, indent filetype etc turned on later in file.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/dotfiles/vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'

"Recall that, with vundle and github repositories, you can just give the name
"(i.e., everything that goes after the .com/ in github site"

"Other bundles
"Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'vim-latex/vim-latex.git'
Plugin 'ervandew/supertab.git'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'vim-scripts/vimwiki'
"Plugin 'https://github.com/Rip-Rip/clang_complete.git'
Plugin 'scrooloose/syntastic.git'
"Plugin 'SirVer/ultisnips.git'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'sjl/gundo.vim.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'oblitum/rainbow.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin "garbas/vim-snipmate"

" Optional:
"Plugin "honza/vim-snippets"
"Settings for clang_complete to work

"let g:clang_use_library=1
"let g:clang_library_path = "/usr/lib/"
"let g:clang_complete_hl_errors=1
"let g:clang_auto_select=1
"let g:clang_complete_auto=1
"let g:clang_snippets_engine="ultisnips"

"Trying to get syntastic to work. note couldn't find this option inside the
"actual syntax_checker files
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_auto_refresh_includes = 1
" Colorschemes - my favorite is probably Solarized, but there are a couple of
" options to try in there.
Plugin 'altercation/vim-colors-solarized'
Plugin 'ColorSchemeMenuMaker'
Plugin 'desert-warm-256'
Plugin 'tpope/vim-vividchalk'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'tomasr/molokai.git'

call vundle#end()
filetype plugin indent on
syntax on
syntax enable
"Unclear on the difference, but the latter makes wikilinks work...
"set foldmethod=syntax

"wiki split setup
noremap <leader>ww :vsp<cr><Plug>VimwikiIndex
"Rainbow parens should be enabled by default
let g:rainbow_active = 1

"Nice actually solarized colors when in terminal (gui takes care of itself)
if !has("gui_running")
	let g:solarized_termcolors=256
	set t_Co=256
endif

"Set default colorscheme to Solarized, dark, not see-through
colorscheme solarized
let g:solarized_termtrans = 0
set background=light

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" Isa: keep 500 lines of command line history
set undolevels=500 	" Isa: Lots of undo levels
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" Isa: numbering lines
set relativenumber "Isa: makes jumping easier, number relative to cursor
set shiftwidth=4 	" Isa: Parameters for indentation
set tabstop=4 		
set smartcase 		" Isa: ignores case in search if everything is lower case, matches otherwise
set smarttab 		" Isa: Tabs at the beginning of a line are set according to shiftwidth, not tabstop
set autowrite 		"Isa: Makes sure the buffer is written every time you move away from it/ hide it/e something else.

set spell spelllang=en_us
set linebreak "Isa: makes sure linebreak doesn't split words

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")

"Isa: original script has `syntax on` "Later on I do 'syntax enable' instead.
"syntax on overrides plugin syntax with vim default!
set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Isa's Fixes, Global mappings, Latex_Vim additions- Mostly inspired by Steve
"Losh's book

"BUNDLES""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""           
"From the help file for clandg_complete plug in - leads to instant completion
" if there is only one option

set completeopt=menu,longest

"MAPPINGS
"Set global leader

let mapleader = ","

"Turn off last highlighting -from tip on Vim.org

nnoremap <silent> <C-H> :silent noh<CR>

"Losh commands for quick editing and real-time updating of vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Semicolon usually repeats F,f,tT actions. With clever-vim bundle (see BUNDLES 
"section) I don't need it, so much better to have it enter command mode
"(relievs stress on left pinkie)
"Also, map same thing (;) with t to terminal commands
nnoremap ; :
nnoremap ;t :!
nnoremap ,b :buffer 
" Quick bracketing in visual mode-
vnoremap <leader>c <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>p <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>s <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>

"Parens autcompletion (under construction)

"Some Ergonomic Fixes - Steve  Losh 
"Let H and L be "strong" h (beginning of line) and "strong" l (end of line).
"more comfortable than 
nnoremap H 0
nnoremap L $

		"Isa: Addition to Losh tips: Also, it's very useful to have consistent behavior across modes, so include
"the same mappings in visual mode
vnoremap H 0
vnoremap L $

"Indentation with tab in normal and visual modes

nnoremap <s-tab> >>
"nnoremap <s-tab> <<
vnoremap <s-tab> >  
"vnoremap <s-tab> <  

"Escape insert mode from home row
inoremap fd <esc>

"Finger training (potentially problematic?)
"No arrows in normal mode
nnoremap  <up>  <nop>
nnoremap  <left>  <nop>
nnoremap  <right>  <nop>
nnoremap  <down>  <nop>

"No escaping off home row!
inoremap <esc> <nop>

"Fix annoying line scrolling by file line rather than display line when :set wrap is activated

nnoremap j gj
nnoremap k gk

vnoremap j gj
vnoremap k gk
"Clunky fix of delete issue on bluetooth keyboard, wil also be good for normal
"mode training (under construction)
"Get used to deleting in normal mode only!

"inoremap <BS> <nop>
"inoremap <leader><BS> <BS>

" This is a clunky fix to the remote terminal arrow key issue (<left> in
" insert mode prints OA etc.
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

"Yankring mapping simplified for non-GUI (will display yank ring in buffer
nnoremap <silent> <C-Y><C-R> :YRShow<CR>

"Vimwiki Setup
let g:vimwiki_list = [{'path': '~/projectsIsa/wiki/', 'path_html': '~/projectsIsa/public_html/', 'diary_rel_path': ''}]


" Latex Vim Changes
nnoremap <leader>et :split ~/.vim/ftplugin/tex/tex.vim<cr>
nnoremap <leader>st :source ~/.vim/ftplugin/tex/tex.vim<cr>

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" Latex-suite required options already set above: filetype plugin + indent
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

