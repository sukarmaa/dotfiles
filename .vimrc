" UseFull Commands {{{
" '<,'>w !xclip -selection clipboard " System Copyz
" }}}

" options {{{ "
set title
set ttyfast " Improves smoothness of redrawing
set lazyredraw
set t_Co=256 " using 256 colors
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set mouse=a
set number
set relativenumber
set encoding=utf8
set fileformats=unix,mac,dos " Use Unix as the standard file type
set formatoptions+=m " Also break at a multi-byte character above 255
set formatoptions+=B " When joining lines, don't insert a space between two multi-byte characters
set formatoptions+=j " Where it makes sense, remove a comment leader when joining lines
set formatoptions+=n " When formatting text, recognize numbered lists

" remove contrinuos commenting
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o

set autoindent " Auto indent
set smartindent " Smart indent

filetype on
filetype plugin on
filetype plugin indent on

set shiftwidth=4
set tabstop=4
set smarttab
set expandtab " Use spaces instead of tabs
set wrap " Wrap lines
set foldlevel=100 " unfold all by default
syntax enable " Enable syntax highlighting
" set cursorline " Highlight current line
set mousehide " the mouse pointer is hidden when characters are typed
set ruler " Always show current position

set completeopt=menu,preview,longest
set pumheight=10

set autoread " Set to auto read when a file is changed from the outside

set autowrite " Automatically write a file when leaving a modified buffer
set updatetime=200
set history=1000 " command line history

set undofile
set undolevels=1000
set magic " For regular expressions turn magic on
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set incsearch " Makes search act like search in modern browsers

set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" set nrformats=alpha,octal,hex " Define how to use the CTRL-A and CTRL-X commands for adding to and subtracting from a number respectively

set termguicolors
set background=dark

" }}} options end "

" Plugins {{{ "
call plug#begin()
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'rakr/vim-one'
    Plug 'sainnhe/everforest'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf.vim'
    Plug 'nanotee/zoxide.vim'
    Plug 'tpope/vim-unimpaired'
call plug#end()
"}}} Plugins ends "

" keymaps {{{ "
let mapleader = " "
imap jk <Esc>

" Disable highlight when <Backspace> is pressed
nnoremap <silent> <ESC> :nohlsearch<CR>
nnoremap <silent> <leader>qq :q<CR>
nnoremap <silent> <leader>ww :w<CR>

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>ff :Files<CR>

nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
" }}} end keymaps "

function! MultiDirFiles()
  " List of directories to search
  let l:dirs = ['~/.config/nvim_extra/', '~/.config/nvim_lazyvim/']
  " Build find command
  " let l:cmd = 'find ' . join(l:dirs, ' ') . ' -type f'
  let l:cmd = 'fd --type f --hidden --follow --exclude .git . ' . join(l:dirs, ' ')
  " Run fzf with the command output
  call fzf#run({
        \ 'source': l:cmd,
        \ 'sink': 'e',
        \ 'options': '--ansi --prompt="Files> "' })
endfunction

" Create a command to call it
command! MDF call MultiDirFiles()

silent! colorscheme everforest

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
