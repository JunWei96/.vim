execute pathogen#infect()
call pathogen#helptags()

" nerdcommenter
filetype plugin on

" setting color scheme for vim
filetype on
syntax on
colorscheme Tomorrow-Night

" setting font to Menlo Regular 18pts
set guifont=Menlo\ Regular:h18
set lines=35 columns=120
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
set wrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set pastetoggle=<F3>
" Show matching parenthesis
set showmatch

" Removing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Improving search, to highlight found words
set hlsearch

" Ability to cancel search with Escape
nnoremap <silent> <Enter> :nohlsearch<bar>:echo<CR>

" Re-open previously opened file
nnoremap <Leader><Leader> :e#<CR>

" Command-T plug-in
" Ignore some files when using Command-T
set wildignore+=*.log,*.sql,*.cache
" To reindex the file for Command-T
noremap <Leader>r :CommandTFlush<CR>

" Lightline plug-in
set laststatus=2
let g:lightline = {
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'gitbranch' ] ]
  \ },
  \'component': {
  \  'gitbranch': '%{fugitive#statusline()}'
  \},
  \}

" Nerdtree pug-in
" Setting NERDTree window width
let g:NERDTreeWinSize=20
" Open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
" Open NERDTree automatically when wims starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Display hidden files
let NERDTreeShowHidden=1
" Do not display some useless files
let NERDTreeIgnore=['\.DS_Store','\-$','\.swp']
" Map a Ctrl+n to toggle NERDTree
map <leader>nt :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Setting different color for different file type
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" Switching between tabs
map <leader>l :tabn<CR>
map <leader>h :tabp<CR>
map <leader>n :tabnew<CR>

" Git gutter plug-in
let g:gitgutter_sign_column_always=1
