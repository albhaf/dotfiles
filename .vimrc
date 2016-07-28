" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
set shell=/bin/sh
endif

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kchmck/vim-coffee-script'
Plugin 'joonty/vim-phpqa'
Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'cespare/vim-toml'
call vundle#end()
filetype plugin indent on

syntax on

set ofu=syntaxcomplete#Complete
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set number
set hidden
set wildmode=list:longest,full
set laststatus=2
set ttimeoutlen=50

set cursorline
set list
autocmd BufEnter * set listchars=tab:▸\ ,eol:¬

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen=1

" Key mappings
nnoremap <C-m> :TagbarToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd BufRead,BufNewFile *.py set tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab

" Javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
let g:jsx_ext_required = 0

" Go (vim-go)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Rust
let g:rustfmt_autosave = 1

" PHP
autocmd Filetype php setlocal ts=4 sts=4 sw=4
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0

" Backup
set backup
set backupdir=~/.vim-backup/
set directory=~/.vim-backup/

" Theme and visuals
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

let g:molokai_original = 1
let g:rehash256 = 1

colors molokai
