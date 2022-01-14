set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
"Plug 'elzr/vim-json'
Plug 'Chiel92/vim-autoformat'
Plug 'elubow/cql-vim'
Plug 'felixhummel/setcolors.vim'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim' "<C-p>: search
Plug 'tomtom/tcomment_vim' "gcc: to add comments
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'avakhov/vim-yaml'
Plug 'bfredl/nvim-miniyank'
Plug 'hashivim/vim-terraform'
"
"
"Plug 'udalov/kotlin-vim'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'tpope/vim-surround' "ysiw<symbol>: add symbol, ds: remove, cs<oldSymbol><newSymbol>: replace
"Plug 'Shougo/denite.nvim'

"Plugin 'ensime/ensime-vim'
"Plugin 'groenewege/vim-less'
"Plugin 'vim-scripts/dbext.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'IN3D/vim-raml'
call plug#end()

filetype plugin indent on
syntax enable

""Automatically reload vimrc
"augroup myvimrc
"  au!
"  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

" line numbers
set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" signal max characters line
set colorcolumn=140

" leader key
let mapleader = ','

" miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

" BUFFER CONF
nmap <leader>s :bnext<CR>
nmap <leader>a :bprevious<CR>
nmap <leader>ls :ls<CR>
nmap <leader># :b#<CR>
nmap <Leader>1 :1b<CR>
nmap <Leader>2 :2b<CR>
nmap <Leader>3 :3b<CR>
nmap <Leader>4 :4b<CR>
nmap <Leader>5 :5b<CR>
nmap <Leader>6 :6b<CR>
nmap <Leader>7 :7b<CR>
nmap <Leader>8 :8b<CR>
nmap <Leader>9 :9b<CR>
nmap <Leader>0 :10b<CR>
nmap <Leader>x :bd<CR>

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
nmap ; :

" INDENT CONFIG
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=2
set shiftround

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" |" """"""""""""""""
" |" "" ensime config
" |" """"""""""""""""
" |" "
" |" "" type checking
" |" ""nmap <buffer> <silent> tt :EnType<CR>
" |" "nmap tt :EnType<CR>
" |" "nmap t] :EnDeclaration<CR>
" |" "nmap t[ :EnDeclarationSplit v<CR>
" |" "nmap td :EnDocBrowse<CR>
" |" "nmap ti :EnSuggestImport<CR>
" |" "nmap tc :EnTypeCheck<CR>
" |" "nmap tr :EnRename<CR>
" |" ""nmap <buffer> tt :EnType<CR>
" |" ""nmap <buffer> t] :EnDeclaration<CR>
" |" ""nmap <buffer> t[ :EnDeclarationSplit v<CR>
" |" ""nmap <buffer> td :EnDocBrowse<CR>
" |" ""nmap <buffer> ti :EnSuggestImport<CR>
" |" ""nmap <buffer> tc :EnTypeCheck<CR>
" |" ""nmap tr :EnRename<CR>
" |" """autocmd BufWritePost *.scala silent :EnTypeCheck

cmap w!! w !sudo tee % >/dev/null    " w!! to save changes to a file that requieres sudo
nmap <silent> ,/ :nohlsearch<CR>     " ,/ to clear the highlight after searching
set pastetoggle=<F2>
nmap <S-Enter> O<Esc>j               " Insert new line above the cursor, without entering insert mode
nmap <CR> o<Esc>k                    " Insert new line below the cursor, without entering insert mode

" show the whole filename
nmap <space>n :echo expand('%:p')<CR>

" diff current files
nmap <space>d :windo diffthis<CR>
" diff off
nmap <space>f :diffoff<CR>

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

""""""""""""""""
"NERDTree
""""""""""""""""

"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

nmap <leader>f :NERDTreeFind<CR>

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeWinSize = 40

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" temporal fix for slow scrolling
set lazyredraw
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1


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
nmap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt'"
let g:formatters_scala = ['scalafmt']

"Ctags
set tags=tags;/

" Allow editing crontab
autocmd FileType crontab setlocal nowritebackup

" |" " Denite
" |" call denite#custom#var('file_rec', 'command',
" |"       \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" |" nmap <space>/ :Denite grep:.<cr>

" yank and paste from clipboard
"set clipboard=unnamed
set clipboard+=unnamedplus

" |" " ctrlp
" |" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" |" 

" vim-devicons
set encoding=utf8
"set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ Regular\ 18
"set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ Regular:h18

