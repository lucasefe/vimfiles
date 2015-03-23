set background=dark
colorscheme desert256

let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'avakhov/vim-yaml'
Plugin 'chriskempson/base16-vim'
Plugin 'danchoi/ri.vim'
Plugin 'duggiefresh/vim-easydir'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/syntastic'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-haml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
call vundle#end() 

" Basic defaults
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set autoindent
set expandtab         " No tabs, but spaces when tabbing
set hlsearch
set noautochdir
set nobackup
set nocompatible      " We're running Vim, not Vi!
set noswapfile
set nowritebackup
set number
set shiftwidth=2
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set wrap

if $TMUX == ''
  set clipboard+=unnamed
endif

" Support for 256 on VIM
set t_Co=256

nnoremap  <S-h> :tabprev<CR>
nnoremap  <S-l> :tabnext<CR>

" SPLIT PANES
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
let g:ctrlp_open_new_file = 't'
let g:ctrlp_max_height = 20

"autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
"autocmd Filetype gitcommit setlocal spell textwidth=92
augroup reload_vimrc " {
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" No spaces at the end of the line, please. 
autocmd BufWritePre *.rb :%s/\s\+$//e

" no EX mode, ever
nnoremap Q <nop>

" Invisible chars
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=>\zs<CR>
  vmap <Leader>a> :Tabularize /=>\zs<CR>
endif

" Gist copy to MAC clipboard
if exists(":Gist")
  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
endif

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

