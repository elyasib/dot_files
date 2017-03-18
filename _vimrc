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
"Plugin 'vim-scripts/dbext.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'Chiel92/vim-autoformat'
Plugin 'elubow/cql-vim'
Plugin 'IN3D/vim-raml'
Plugin 'felixhummel/setcolors.vim'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim' "gc or gcc
Plugin 'airblade/vim-gitgutter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()

filetype plugin indent on
syntax enable

" line numbers
set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" leader key
let mapleader = ','

" BUFFER CONF
nmap <leader>s :bnext<CR>
nmap <leader>a :bprevious<CR>
nmap <leader>ls :ls<CR>
nmap <leader># :b#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrap
set hidden
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set title
set visualbell
set noerrorbells
nnoremap ; :

" INDENT CONFIG
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set shiftround

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
nmap <S-Enter> O<Esc>j               " Insert new line above the cursor, without entering insert mode
nmap <CR> o<Esc>k                    " Insert new line below the cursor, without entering insert mode

"gruvbox config
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italicize_comments=1

"Airline
set encoding=utf-8
let g:airline_powerline_fonts=1
set laststatus=2

set ttimeoutlen=50
let g:airline_theme = 'base16'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8

"NERDTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let NERDTreeIgnore = ['\.pyc$', '\.DS_Store$', '\.swp$', '\.swo$']

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeWinSize = 40

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_conceal_nerdtree_brackets = 1


" vim-devicons {{{
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
  endif
" }}}

function! s:setSyntax()
   if g:webdevicons_conceal_nerdtree_brackets == 1
      exec 'autocmd filetype nerdtree syntax match hideBracketsInNerdTree "[\]|\[]*" contained conceal cchar=_ containedin=ALL'
      exec 'autocmd filetype nerdtree set conceallevel=3'
      exec 'autocmd filetype nerdtree set concealcursor=nvic'
   endif
endfunction

"Copy search results to a new buffer
command! -nargs=? Gl let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

"scala autoformat
noremap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt'"
let g:formatters_scala = ['scalafmt']

"Automatically reload vimrc
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"Ctags
set tags=tags;/

" Allow editing crontab
autocmd FileType crontab setlocal nowritebackup

" vim-devicons
set encoding=utf8
"set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ Regular\ 18
"set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ Regular:h18
