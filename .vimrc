" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
" set leader eary or it could be the source of wtf
let mapleader=","

syntax on
filetype plugin indent on
" Ждем очень недолго key codes, так что ESC работает быстро при выходе из
" command mode. Не должно вызывать проблем при работе в локальной консоли.
set nocompatible
set timeout ttimeoutlen=10
"set visualbell
set noerrorbells
set title
set listchars=tab:>\-,nbsp:.,extends:#,trail:\!
set nowrap
set showbreak=…
set linebreak
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
"set sHELLCMDFLag=-c
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

" My key mappings

" Very useful mapping must be
" as little keypressings as possible

" colemak
noremap j h
noremap h gk
noremap k gj
noremap zh zk
noremap zk zj

" mappings that change default ones
nnoremap <C-j> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>k
nnoremap <C-k> <C-w>j
nnoremap ; :
vnoremap ; :
nnoremap q; q:
nnoremap <tab> %
vnoremap <tab> %

" fast leader mappings
" fFtTwWbBeE are occupied by easymotion
nnoremap <leader>; ;
vnoremap <leader>; ;
nmap <silent> <leader>/ :set hlsearch!<CR>
" paste on new line and indent
nnoremap <leader>p o<ESC>p==
nnoremap <leader>P O<ESC>p==
let g:EasyMotion_mapping_j='<leader>k'
let g:EasyMotion_mapping_k='<leader>h'
" for navigate
" tAg
nnoremap <leader>a :TagbarToggle<CR>
" r for recent
nnoremap <leader>r :BufExplorer<CR>
" o for open
nnoremap <leader>o :NERDTreeToggle<CR>
" m for make
nnoremap <leader>m :silent make\|redraw!\|cc<CR>
" s for start
function! <SID>cmd_command()
  if !exists("w:cmd_command")
    echo "Command to run is not set"
    return
  endif
  if !exists("w:cmd_silent")
    let w:cmd_silent=0
  endif
  let l:pref = w:cmd_silent ? 'silent !' : '!'
  exec l:pref . w:cmd_command
  if w:cmd_silent
    redraw!
  endif
endfunction
nnoremap <leader>s :call <SID>cmd_command()<CR>
" i resembles |
nnoremap <leader>i :call <SID>open_file_from_pipe()<CR>

" slower leader mappings
nnoremap <leader><leader>p :setlocal paste! paste?<CR>
nnoremap <leader><leader>t :tabedit<CR>
nnoremap <leader><leader>w <C-w>v<C-w>l
" strip trailing whitespaces
nnoremap <leader><leader>s :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <leader><leader>l :set list!<CR>

" put under <leader>z misc stuff that i will not need
" constantly
" v for vimfile
nnoremap <leader>zv :e ~/.vimrc<CR>
" r for reread
nnoremap <leader>zr :so ~/.vimrc<CR>

" insert mode mappings
imap <C-l> <ESC>bg~wea

" abbreviations
" h expands to vert help
cnoreabbrev <expr> h ((getcmdtype() == ':' && getcmdline() == 'h')
                          \?('vert h'):('h'))
cnoreabbrev <expr> w!! ((getcmdtype() == ':' && getcmdline() == 'w!!')
                          \?('w !sudo tee % >/dev/null'):('w!!'))

" gcc compiler options
let g:compiler_gcc_ignore_unmatched_lines='yes'

" easymotion
let g:EasyMotion_leader_key='<leader>'

" Tagbar
let g:tagbar_left=1
let g:tagbar_autoclose=1
let g:tagbar_compact=1

" TagList
let Tlist_Show_One_File=1
let Tlist_Close_On_Select=1
let Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Enable_Fold_Column=0

" Supertab
let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabLongestEnhanced=1

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['.exe$', '.o$', '.ico$', '.tif$', '.png',
                        \'.jpg', '.bmp', '.png$', '.dll$', '.gz$', '.a$']
let NERDTreeShowHidden=1

" buffer explorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=1
let g:bufExplorerDefaultMappings=0
" Michael Henry from Yahoo Groups 94310
" TODO make less dependet on existing d* mappings assumption
" and mappings {rhs} too.
augroup buf_explorer_patch
  autocmd!
  autocmd BufEnter \[BufExplorer\] if maparg("ds") != "" | nunmap ds| endif
  autocmd BufLeave \[BufExplorer\] nmap ds <Plug>Dsurround
augroup END


let readline_has_bash="yes"

" set color column
augroup color-column
  autocmd!
  autocmd FileType ruby,sh,vim,c,h,make setlocal colorcolumn=80
augroup END

" set spaces
augroup spaces
  autocmd!
  autocmd FileType ruby,eruby,yaml,sh,vim setlocal tabstop=8
              \ shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType c,h,make setlocal tabstop=8 shiftwidth=8
              \ softtabstop=8 noexpandtab
augroup END

function! s:add_bad_whitespace_matches()
  if exists("w:bad_ts")
    return
  endif
  " Mark mixing tab and spaces
  let w:bad_ts = matchadd("BadWhitespace", '\t ')
  let w:bad_st = matchadd("BadWhitespace", ' \t')
  " Mark trailing whitespaces
  let w:bad_trail = matchadd("BadWhitespace", '\s\+$')
endfunction

function! s:rm_bad_whitespace_matches()
  call matchdelete(w:bad_ts)
  call matchdelete(w:bad_st)
  call matchdelete(w:bad_trail)
  unlet w:bad_ts
  unlet w:bad_st
  unlet w:bad_trail
endfunction

function! s:i_mode_bad_whitespace_matches()
  if !exists("w:bad_trail")
    return
  endif
  call matchdelete(w:bad_trail)
  let w:bad_trail = matchadd("BadWhitespace", '\s\+\%#\@<!$')
endfunction

function! s:n_mode_bad_whitespace_matches()
  if !exists("w:bad_trail")
    return
  endif
  call matchdelete(w:bad_trail)
  let w:bad_trail = matchadd("BadWhitespace", '\s\+$')
endfunction

" order is significant!
colorscheme wombat256
call s:add_bad_whitespace_matches()

" Mark bad cases of spaces
augroup bad-spaces
  autocmd!

  " On for all buffers except */doc/*
  autocmd WinEnter * call s:add_bad_whitespace_matches()
  autocmd BufEnter * call s:add_bad_whitespace_matches()
  autocmd BufEnter */doc/* call s:rm_bad_whitespace_matches()

  " Disable mark trailing whitespaces when in insert mode
  autocmd InsertEnter * call s:i_mode_bad_whitespace_matches()
  autocmd InsertLeave * call s:n_mode_bad_whitespace_matches()
augroup END




" wd per tab
function! s:enter_buffer()
  if exists("t:wd")
    exec "cd" t:wd
  else
    let t:wd = getcwd()
  endif
endfunction

function! s:leave_buffer()
  let t:wd = getcwd()
endfunction

augroup wd-per-tab
  autocmd!
  autocmd TabEnter * call s:enter_buffer()
  autocmd TabLeave * call s:leave_buffer()
augroup END

command! -complete=file -nargs=* CommandSet let w:cmd_command = <q-args>
command! -nargs=0 CommandShow echo w:cmd_command
command! -nargs=0 CommandSilent let w:cmd_silent=1
command! -nargs=0 CommandVerbose let w:cmd_silent=0

function! <SID>open_file_from_pipe()
  " read -t 0 will be no good
  let filename = system("read -t 0.001 filename <~/.vim/fifo; echo -n \"$filename\"")
  if strlen(filename) == 0
    echo "Filename pipe is empty"
  else
    exec "e" filename
  endif
endfunction

if filereadable(".lvimrc")
  so .lvimrc
endif
