" Use Vim defaults
set nocompatible


" =============================== Vundle Settings

" Init
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Other bundles

Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-fugitive"
Bundle "scrooloose/syntastic"
Bundle "kien/ctrlp.vim"


" =============================== General Settings

" Colorscheme
set background=dark
" colorscheme solarized

" Line numbers
set number

" Allow Backspace
set backspace=indent,eol,start

" Disable blinking cursor
set gcr=a:blinkon0

" Notify visually
set visualbell

" Show partial command in last line
set showcmd

" Show current mode in last line
set showmode

" Reload file automatically if it has been changed outside
set autoread

" Check if the file changed outside of vim
autocmd CursorHold * checktime
autocmd WinEnter * checktime
autocmd BufWinEnter * checktime

" Filepath completion
set wildmenu
set wildmode=list:longest

" Stuff to ignore for completion
set wildignore=*.o,*.obj
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif

" Always show 5-lines of context
set scrolloff=5

" Set editor and file encoding to Unicode
set encoding=utf-8
set fileencoding=utf-8

" Spellcheck off 
set nospell


" =============== Status Bar

" Always display
set laststatus=2

" Status bar display items
" (left)  [filepath][+]
" (right) [colnum],[linenum]/[total lines]
set statusline=%f
set statusline+=%m
set statusline+=%=
set statusline+=%c,
set statusline+=%l/%L


" =============================== Syntax

" Filetype detection
filetype on

" Load filetype specific plugins
filetype plugin on

syntax enable

" Show matching braces
set showmatch


" =============================== Search

" Case insensitive
set ignorecase

" but respect explict Upper-case
set smartcase

" Highlight matches
set hlsearch

" Search while typing
set incsearch


" =============================== Swap and Backup

" Don't use any swap files
set noswapfile

" or writing to a backup file
set nowb

" or backup file
set nobackup


" =============================== Persistent Undo

" Directory for undo file
silent !mkdir ~/.vim/undos > /dev/null 2>&1
set undodir=~/.vim/undos
set undofile


" =============================== Indentation

" Load filetype indent plugins
filetype indent on

" Carry-over indentation when starting a new line
set autoindent

" Indent new line based on previous line's syntax
set smartindent

" Use shiftwidth when in line beginnings
set smarttab

" Wrap when displaying long lines
set wrap

" Wrap intelligently
set linebreak

" Display tabs, trailing spaces, eol, wrap chars visually
set listchars=tab:»-,trail:·,eol:$,extends:»,precedes:«

" Display trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tabs are 2-spaces
set tabstop=2

" Use 2-spaces when shifting
set shiftwidth=2

" Tabs are 2-spaces
set softtabstop=2

" Convert tabs to spaces
set expandtab


" =============================== Folds

" Don't fold by default
set nofoldenable

" Based on indent
set foldmethod=indent

" Max nesting is 3-levels deep
set foldnestmax=3


" =============== Yelp-specific settings

function YelpSettings()
  " Use 4 spaces when shifting
  set shiftwidth=4

  " Tab char is 4 spaces
  set softtabstop=4
  set tabstop=4


  " Don't break lines automatically
  set textwidth=0
endfunction

autocmd BufNewFile,BufRead ~/pg/* call YelpSettings()


" =============================== Custom Mappings

" tags file location
set tags=./tags

" Leader key is comma
let mapleader = ","

" ,l - toggle line numbers
nmap <silent> <Leader>l :set invnumber<CR>
map <silent> <Leader>l :set invnumber<CR>

" ,w - to toggle displaying whitespace chars
nmap <silent> <Leader>w :set nolist!<CR>

" ,n - open new tab
noremap <Leader>n :tabnew<CR>

" ,e - open new tab with filename
noremap <Leader>e :tabe

" Firefox-line tab switches
" ,[tabnum] - goto tab
noremap <Leader>1 :tabnext 1<CR>
noremap <Leader>2 :tabnext 2<CR>
noremap <Leader>3 :tabnext 3<CR>
noremap <Leader>4 :tabnext 4<CR>
noremap <Leader>5 :tabnext 5<CR>
noremap <Leader>6 :tabnext 6<CR>
noremap <Leader>7 :tabnext 7<CR>
noremap <Leader>8 :tabnext 8<CR>
noremap <Leader>9 :tabnext 9<CR>

" Diff-mode mappings
if &diff
  " `m` - next change
  nnoremap m ]cz.
  " `M` - previous change
  nnoremap M [cz.
  " `R` - refresh
  nnoremap R :w\|set nodiff\|set diff<cr>
  " `q` - quit both panes
  nnoremap q :qall<cr>
  " place cursor on top of the "new" file
  autocmd VimEnter * normal lgg
endif


" ============ CtrlP
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CloseSingleConque<CR>:CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CloseSingleConque<CR>:CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,ja :CloseSingleConque<CR>:CtrlP app/assets<CR>
map ,jm :CloseSingleConque<CR>:CtrlP app/models<CR>
map ,jc :CloseSingleConque<CR>:CtrlP app/controllers<CR>
map ,jv :CloseSingleConque<CR>:CtrlP app/views<CR>
map ,jh :CloseSingleConque<CR>:CtrlP app/helpers<CR>
map ,jl :CloseSingleConque<CR>:CtrlP lib<CR>
map ,jp :CloseSingleConque<CR>:CtrlP public<CR>
map ,js :CloseSingleConque<CR>:CtrlP spec<CR>
map ,jf :CloseSingleConque<CR>:CtrlP fast_spec<CR>
map ,jd :CloseSingleConque<CR>:CtrlP db<CR>
map ,jC :CloseSingleConque<CR>:CtrlP config<CR>
map ,jV :CloseSingleConque<CR>:CtrlP vendor<CR>
map ,jF :CloseSingleConque<CR>:CtrlP factories<CR>
map ,jT :CloseSingleConque<CR>:CtrlP test<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CloseSingleConque<CR>:CtrlPBufTag<CR>
