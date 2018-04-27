" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" async linting
Plug 'w0rp/ale'
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
" https://github.com/ekalinin/Dockerfile.vim
Plug 'ekalinin/Dockerfile.vim'
" haproxy syntax
Plug 'zimbatm/haproxy.vim'
" terraform stuff 
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-vaultproject'
" vim easymotion for moving around
Plug 'easymotion/vim-easymotion'
" https://github.com/tpope/vim-markdown
Plug 'tpope/vim-markdown'
" git support
Plug 'tpope/vim-fugitive'
" puppet stuff
Plug 'rodjek/vim-puppet'
" clojure support
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'venantius/vim-eastwood'
Plug 'clojure-vim/vim-cider'
Plug 'luochen1990/rainbow'
" ctags
Plug 'majutsushi/tagbar'
" tpope goodness
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
" easily comment stuff in/out
Plug 'tpope/vim-commentary'
" nerdtree stuff
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" ablity to toggle indent guides
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ruby and rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
Plug 'iCyMind/NeoSolarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'martinda/Jenkinsfile-vim-syntax'
" language server protocol support
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'yuttie/comfortable-motion.vim'
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
" set leader
:let mapleader = ","
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
" system clipboard
set clipboard=unnamed
try
  colorscheme NeoSolarized
catch
endtry
set background=dark
"if has("gui_running")
"  colorscheme solarized
"endif
set encoding=utf8
set mouse=a
let g:airline_powerline_fonts = 1
" always show status bar
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" auto fmt terraform files on save
let g:terraform_fmt_on_save=1
" lsp configs
if executable('solargraph')
" gem install solargraph
  au User lsp_setup call lsp#register_server({
  \ 'name': 'solargraph',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph socket']}, 
  \ 'whitelist': ['ruby'],
  \ })
endif
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
    autocmd FileType groovy setlocal tabstop=2
    autocmd FileType groovy setlocal softtabstop=2
    autocmd FileType groovy setlocal shiftwidth=2
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
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
