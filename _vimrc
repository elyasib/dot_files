set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gre/play2vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/dbext.vim'
call vundle#end()

filetype plugin indent on
syntax enable
set showmatch     
set ignorecase    
set smartcase     
set hlsearch      
set incsearch     
set nowrap
set hidden
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set title
set visualbell
set noerrorbells
nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

cmap w!! w !sudo tee % >/dev/null    " w!! to save changes to a file that requieres sudo 
nmap <silent> ,/ :nohlsearch<CR>     " ,/ to clear the highlight after searching
set pastetoggle=<F2>
au BufRead,BufNewFile *.cob,*.cpy,*.cbl let &colorcolumn=join(range(12,72),",") " Set column colors for COBOL code
au FileType cobol let &colorcolumn=join(range(12,72),",")                       " Set column colors for COBOL code
nmap <S-Enter> O<Esc>j               " Insert new line above the cursor, without entering insert mode 
nmap <CR> o<Esc>k                    " Insert new line below the cursor, without entering insert mode

" dbext configuration
let g:dbext_default_profile_mxd = 'type=SQLSRV'
let g:dbext_default_SQLSRV_bin               = "osql"
let g:dbext_default_SQLSRV_cmd_header        = ""
let g:dbext_default_SQLSRV_cmd_terminator    = ""
let g:dbext_default_SQLSRV_cmd_options       = "-E -D MYDSNNAME"
let g:dbext_default_profile = 'mxd'

