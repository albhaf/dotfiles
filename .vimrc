" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
set shell=/bin/sh
endif

set encoding=utf-8
set fileencoding=utf-8

" Vundle
set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kchmck/vim-coffee-script'
Plug 'jimenezrick/vimerl'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/ruby-matchit'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'rhysd/vim-clang-format'
call plug#end()

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
