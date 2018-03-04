" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
" https://github.com/ekalinin/Dockerfile.vim
Plug 'ekalinin/Dockerfile.vim'
" https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-vaultproject'
" https://github.com/tpope/vim-markdown
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
" https://github.com/rodjek/vim-puppet
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'clojure-vim/vim-cider'
Plug 'majutsushi/tagbar'
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
Plug 'elzr/vim-json'
Plug 'luochen1990/rainbow'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
call plug#end()
set nocompatible
if $COLORTERM == 'gnome-terminal'
   set t_Co=256
endif
" show line numbering
set number
" Set to auto read when is changed outside vim
set autoread
" number of visual spaces per tab
set tabstop=2
" use smar tabs http://vim.wikia.com/wiki/Indent_with_tabs,_align_with_spaces
set smarttab
" number of spaces when editing
set softtabstop=2
" spaces are better then tabs ;)
set expandtab
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
" highlight matching brackets
set showmatch
" highlight search matches, use :nohlsearch to turn off
set hlsearch
" search as characters entered
set incsearch
" ignore case when searching
set ignorecase
" autowrap lines http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set whichwrap+=<,>,h,l,[,]
" turn on wild menu completions
set wildmenu
" normal backspace
" show matching brackets
set showmatch
set backspace=indent,eol,start
syntax on
" load file type specific indent files
filetype plugin on
let g:rainbow_active = 1
" set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
syntax enable
" stop hiding quotes in json
let g:vim_json_syntax_conceal = 0
try
  colorscheme solarized
catch
endtry
set background=dark
if has("gui_running")
   set guioptions-=T
   set guioptions-=e
   set t_Co=256
   set guitablabel=%M\ %t
endif
set encoding=utf8
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set mouse=a
let g:airline_powerline_fonts = 1
" always show status bar
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
set fillchars+=stl:\ ,stlnc:\
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
