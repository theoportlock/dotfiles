" === Base Config ===
source $VIMRUNTIME/defaults.vim
set encoding=utf-8
set nocompatible
filetype plugin on
syntax on

" === Leader Key ===
nnoremap <SPACE> <Nop>
let mapleader = " "

" === Indentation ===
set autoindent
set smartindent
set breakindent
set linebreak

" === Search ===
set ignorecase
set infercase
set incsearch

" === UI ===
set number
set relativenumber
set statusline +=%{resolve(expand('%:p'))}\ %*
set nofoldenable
set equalalways
autocmd VimResized * wincmd =

" === Terminal Behavior ===
set hidden
set gdefault
tnoremap <F1> <C-W>N
autocmd QuitPre * call range(1, bufnr('$'))->filter('getbufvar(v:val, "&buftype") == "terminal"')->map('term_setkill(v:val, "hup")')

" === Silence Vim ===
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" === Completion ===
set omnifunc=syntaxcomplete#Complete
augroup complete_close
  autocmd!
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

set clipboard=unnamedplus

" === File Explorer ===
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" === Leader Mappings ===
autocmd FileType python set shell=ipython
autocmd FileType r set shell=R
autocmd FileType bash set shell=bash

nnoremap <leader>t :vert rightbelow term<CR><C-W><C-W>
nnoremap <leader>a :Lexplore<CR>
nnoremap <leader>lc :w<CR>:silent !xterm -hold -e bcsh --rcfile <(echo '. ~/.bashrc; ./compile.sh') &<CR>
nnoremap <F5> :!xterm -hold -e ' . &filetype . ' %'<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>ss :setlocal spell!<CR>

" Custom yank to Windows clipboard using clip.exe
" vnoremap <leader>y :w !clip.exe<CR><CR>
" vnoremap <leader>y :<C-U>let save_sh=&shell \| set shell=bash \| w !clip.exe \| let &shell=save_sh<CR><CR>
vnoremap <leader>y :<C-U>let save_sh=&shell \| set shell=bash \| '<,'>w !/mnt/c/Windows/System32/clip.exe \| let &shell=save_sh<CR><CR>

" === Send to Terminal ===
function! SendToTerm() range
    if exists("*term_sendkeys")
        let l:content = getreg('"')
        let l:paste_start = "\e[200~"
        let l:paste_end = "\e[201~"
        let l:full_content = l:paste_start . l:content . l:paste_end . "\<CR>"
        execute "normal! \<C-W>w"
        call term_sendkeys('', l:full_content)
        execute "normal! \<C-W>w"
    else
        echoerr "term_sendkeys not available in this version of Vim"
    endif
endfunction
nnoremap <leader>r yy:call SendToTerm()<CR>j
vnoremap <leader>r y:call SendToTerm()<CR>gvVj

" === Backup, Swap, Undo (default hidden files in same dir) ===
" Save your backup files to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or .
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
if has('autocmd')
  augroup MyBackupGroup
    autocmd!
    autocmd BufWritePre * nested let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'
  augroup END
endif

" Save your swap files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backup files, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" === Merge Tool ===
if &diff
    nnoremap <leader>1 :diffget LOCAL<CR>
    nnoremap <leader>2 :diffget BASE<CR>
    nnoremap <leader>3 :diffget REMOTE<CR>
    set noro
endif

" === Tags ===
set tagrelative
set tags=./tags,tags;

" === Quality of Life ===
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <Esc>
inoremap kj <Esc>
inoremap kJ <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>
nnoremap Y y$

" === Sudo Save ===
command! W w !sudo tee % > /dev/null

