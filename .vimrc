set nocompatible
let mapleader=","

" pathogen
"call pathogen#infect('$VIM/vimfiles/bundle')
call pathogen#infect()
syntax on
filetype plugin indent on
" Ждем очень недолго key codes, так что ESC работает быстро при выходе из 
" command mode. Не должно вызывать проблем при работе в локальной консоли.
set timeout ttimeoutlen=10

" colemak
noremap j h
noremap h gk
noremap k gj

"set visualbell
set noerrorbells
set title
set listchars=tab:>\ ,eol:$,nbsp:.,extends:#,trail:!
set nowrap
set incsearch
set ignorecase
set nohlsearch
set nosmartcase
set backspace=eol,indent,start
set ruler
set showcmd
set autowriteall
set textwidth=79
set diffopt=filler,vertical
colorscheme wombat256
compiler! gcc
set keymap=russian-colemak
set iminsert=0
set imsearch=-1
"set termencoding=cp866
set encoding=utf-8
"set iskeyword=@,48-57
set fileformat=unix
"set fileencodings=utf-8
set fileencodings=utf-8,cp1251
set makeprg=make
set tags=tags
set complete=.,b,t
set noinfercase
set completeopt=menu,preview,longest
set wildmode=longest,list
"set shell=$MSYS\bin\sh.exe\ --login
"set shellcmdflag=-c
"
"Хинты с How I boosted my Vim
set hidden
set nobackup
set noswapfile
set undofile
set switchbuf=useopen
" hints from coming home to vim
set gdefault
set formatoptions=qrn1

nnoremap <C-j> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>k
nnoremap <C-k> <C-w>j
cmap w!! w !sudo tee % >/dev/null
nnoremap <leader><space> :nohlsearch<CR>
nmap <silent> <leader>/ :set hlsearch!<CR>
nmap <leader>p :setlocal paste! paste?<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
vnoremap ; :
nnoremap q; q:
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>sv :so ~/.vimrc<CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>u g~iwe
imap <C-l> <ESC>bg~wea

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabLongestEnhanced=1

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['.exe$', '.o$', '.ico$', '.tif$', '.png', '.jpg', '.bmp', '.png$', '.dll$', '.gz$', '.a$']
nnoremap <leader>t :NERDTreeToggle<CR>

" buffer explorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=1
nnoremap <leader>b :BufExplorer<CR>
" Michael Henry from Yahoo Groups 94310
augroup buf-explorer-patch
  autocmd!
  autocmd BufEnter \[BufExplorer\] nunmap ds
  autocmd BufLeave \[BufExplorer\] nmap ds <Plug>Dsurround
augroup END

" set autoindent

augroup spaces 
  autocmd!
  autocmd FileType ruby,eruby,yaml,sh setlocal tabstop=8 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType c,h,make setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
augroup END

augroup misc
  autocmd!
  autocmd FocusLost * :wa
augroup END


if filereadable(".lvimrc")
  so .lvimrc
endif
