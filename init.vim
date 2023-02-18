:set number " set line number
:set relativenumber " set line number relative to the currest line (easy to use vim commands) 
:set autoindent " use similar 4 spaces in the next line 
:set tabstop=4 " tab means 4 spaces (used for coding) 
:set shiftwidth=4 " set width of tab to 4 spaces
:set smarttab " used for whitespacing 
:set softtabstop=4 " stops tab after 4 spaces 
:set mouse=a " use your mouse in nvim 
:set wrap " wrap the file around the terminal 
:syntax on " syntax coloring 
:set cursorline " highlight the current cursor line 
:set clipboard=unnamedplus " yank to external keyboard 
:inoremap <C-Backspace> <C-W> "supposed to work but didnt. just remove this if you want


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

" Run sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" That is for plugin compatibility 


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

set encoding=UTF-8


call plug#end()



nnoremap <C-f> :NERDTreeFocus<CR> " focuses nerdtree 
nnoremap <C-n> :NERDTree<CR> " unfocus nerdtree 
nnoremap <C-b> :NERDTreeToggle<CR> " toggle nerdtree on and off 


nmap <F8> :TagbarToggle<CR> " F8 enables elements bar 

:set completeopt-=preview " For No Previews

:colorscheme jellybeans



let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Enable deoplete
let g:deoplete#enable_at_startup = 1
