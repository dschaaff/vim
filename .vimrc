" in case I'm not running neovim
"
set nocompatible
" normal backspace
set backspace=indent,eol,start

" no need filetype to load plugins
filetype off

" plugins
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/AnsiEsc.vim'
" ale linter
Plug 'w0rp/ale', { 'tag': 'v2.2.0' }
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" support lots of languages
Plug 'sheerun/vim-polyglot'
" git marks in gutter
Plug 'airblade/vim-gitgutter'
Plug 'ekalinin/Dockerfile.vim'
" haproxy syntax highlighting
Plug 'zimbatm/haproxy.vim'
" Hashicorp stuff
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-vaultproject'
" vim easymotion for moving around
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-markdown'
" Git support
Plug 'tpope/vim-fugitive'
" puppet stuff
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'davewongillies/vim-eyaml'
" clojure support
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'clojure-vim/vim-cider', { 'for': 'clojure' }
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
" ctags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" tpope goodness
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
" easily comment stuff in/out
Plug 'tpope/vim-commentary'
" nerdtree stuff
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" ablity to toggle indent guides
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ruby and rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'romainl/flattened'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
" Search Stuff
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'stephpy/vim-yaml'
" smooth scrolling
Plug 'yuttie/comfortable-motion.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'tag': '4.1', 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" file icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
"disable polygot for golang
if exists('g:loaded_polyglot')
    let g:polyglot_disabled = ['go']
endif
" Patched font for file icons
set guifont=Hack_NF:h12
" show line numbering
set number
" Set to auto read when is changed outside vim
set autoread
" number of visual spaces per tab
set tabstop=2
" use smart tabs http://vim.wikia.com/wiki/Indent_with_tabs,_align_with_spaces
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
" show matching brackets
set showmatch
" syntax highlighting
syntax on
" load file type specific indent files
filetype plugin on
" stop hiding quotes in json
let g:vim_json_syntax_conceal = 0
" set Vim-specific sequences for RGB colors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
try
  colorscheme NeoSolarized
catch
endtry
set background=dark
set encoding=utf8
set mouse=a
" always show status bar
set laststatus=2
" set leader
:let mapleader = ","

""""""""""""""""""""""""""""
" plugin specific settings "
""""""""""""""""""""""""""""
let g:terraform_align=1
" airline status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
" enable deoplete completions
let g:deoplete#omni_patterns = {}
call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})
let g:deoplete#enable_at_startup = 1
" terraform config
let g:terraform_fmt_on_save=1
" NerdTREE settings
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""
"       ale settings       "
""""""""""""""""""""""""""""
let g:ale_puppet_languageserver_executable = $HOME . "/development/puppet/puppet-editor-services/puppet-languageserver"
let g:ale_fix_on_save = 1
""""""""""""""""""""""""""""
"        mappings          "
""""""""""""""""""""""""""""
map <leader>ntt :NERDTreeToggle<CR>
map <leader>nts :NERDTreeFind<CR>

""""""""""""""""""""""""""""
"     autocmd stuff        "
""""""""""""""""""""""""""""

" load nerdtree at startup if no file or path specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType jenkinsfile setlocal commentstring=#\ %s
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
    autocmd FileType yaml setlocal ai ts=2 sts=2 sw=2 et
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
