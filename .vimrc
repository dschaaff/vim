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
Plug 'w0rp/ale', { 'tag': 'v2.5.0' }
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Git support
Plug 'tpope/vim-fugitive'
" puppet stuff
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
" Chef Stuff
Plug 'dougireton/vim-chef'
Plug 'davewongillies/vim-eyaml'
" Ansible
Plug 'pearofducks/ansible-vim'
" ctags
Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
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
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ruby and rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" make vim json less annoying
Plug 'elzr/vim-json'
" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'romainl/flattened'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
" Search Stuff
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'edkolev/tmuxline.vim'
" smooth scrolling
Plug 'yuttie/comfortable-motion.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'tag': '5.1', 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" file icons
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" fold code based on syntax by default
set foldmethod=syntax
set foldlevel=99
" stop hiding quotes in json
let g:vim_json_syntax_conceal = 0
" set Vim-specific sequences for RGB colors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
if (has("termguicolors"))
 set termguicolors
endif
try
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  colorscheme OceanicNext
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
" indent line plugin
"let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0
" markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
let g:terraform_align=1
" airline status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline_theme='oceanicnext'
" enable deoplete completions
let g:terraform_registry_module_completion = 0
let g:terraform_fmt_on_save=1
" let g:deoplete#omni_patterns = {}
" call deoplete#custom#option('omni_patterns', {
" \ 'complete_method': 'omnifunc',
" \ 'terraform': '[^ *\t"{=$]\w*',
" \ 'auto_complete_delay': 2
" \})
" call deoplete#initialize()
let g:deoplete#enable_at_startup = 1
"NerdTREE settings
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" coc.vim
set cmdheight=2
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=yes
set updatetime=300

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""
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
"        commands          "
""""""""""""""""""""""""""""
com! FormatJSON %!jq .

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
    autocmd FileType yaml setlocal ai ts=2 sts=2 sw=2 et foldmethod=indent
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter markdown setlocal setl conceallevel=0
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
