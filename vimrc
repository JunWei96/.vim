execute pathogen#infect()

" setting color scheme for vim
filetype on
syntax on
colorscheme Tomorrow-Night

" setting font to Menlo Regular 18pts
set guifont=Menlo\ Regular:h18
set lines=35 columns=102
set colorcolumn=90
" add line numbering
set number

let mapleader=" "
" Reload vim Config without having to restart editor
map <leader>s :source ~/.vimrc<CR>

" Keeping more info in memory
set hidden
set history=100

" Logic when indenting
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Show matching parenthesis
set showmatch

" Removing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Improving search, to highlight found words
set hlsearch

" Ability to cancel search with Escape
nnoremap <silent> <Esc> :nohlsearch<bar>:echo<CR>

" Re-open previously opened file
nnoremap <Leader><Leader> :e#<CR>


