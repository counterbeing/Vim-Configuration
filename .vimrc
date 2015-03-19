" Set up Pathogen Bundle Mangement
call pathogen#infect()
call pathogen#helptags()

let mapleader=","
syntax on
set nocompatible " enable modern features
set hidden       " hide buffers so we don't have to write them when working on another file
set lazyredraw   " redraw only when we need to.
set shortmess+=I " No welcome screen
set history=200  " Remember the last 200 :ex commands


let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set synmaxcol=220       " Keeps vim from slowing down on huge lines

" Enable Mouse support
if has("mouse")
  set mouse=a
endif

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']

set wildignore=vendor/rails/**
set wildmenu
set ignorecase
set smartcase
set scrolloff=3
set backspace=indent,eol,start
set ruler
set showcmd
map Q gq
set smartindent
set tabstop=2      " How many spaces per <Tab> char, for existing text
set shiftwidth=2   " Number of space chars used for indentation
set softtabstop=2  " Treat our hard tabs like soft tabs (backspace deletes 2 spaces)
set expandtab      " When inserting <Tab> char, write as spaces instead.
set autoindent     " copies indentation level from the previous line, shouldn't interfere with filetype indent.
filetype plugin on " determine various behaviour by file extension
filetype indent on " indent based on file-type
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
set laststatus=2
set showmatch
set incsearch " search as characters are entered
set hls       "highlight search
set t_Co=256
color flattown
" color solarized
" colorscheme solarized
set background=dark
nnoremap <CR> :nohlsearch<cr>
set cursorline
set cmdheight=1
set number
" set numberwidth=5
command! W :w
imap <c-c> <esc>
imap <S-CR> <CR><CR>end<Esc>-cc
map <leader>n :NERDTreeToggle <Return>
let NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.DS_Store$']
set nowrap


" Custom Mappings
" -----------------------------------------------------------------------------
nnoremap <Leader>t :call PickFile()<CR>
" Shortcut to pretty-format ugly blocks of json
nmap <leader>j <Esc>:%!python -m json.tool<CR><ESC>gg=G<Esc>:noh<CR> 



" Paste Mode
" The following sets a variable to keep track of paste mode, and turns
" both paste mode and insert lines on and off for copying and pasting 
" related activities.
let g:pasteMode = 0
let g:indentLine_color_term = 100
function PasteToggle()
  if g:pasteMode 
    IndentLinesEnable
    set number
    set nopaste
    if has("mouse")
      set mouse=a
    endif
    setlocal conceallevel=2
    let g:pasteMode = 0
    echom "Paste mode OFF!"
  else
    IndentLinesDisable
    set paste
    set nonumber
    set mouse=""
    setlocal conceallevel=0
    let g:pasteMode = 1
    echom "Paste mode ON!"
  endif
endfunction
map <leader>p :call PasteToggle()<cr>

set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  " Allows for things like pane resizing within a tmux session
  set ttymouse=xterm2
endif

" Allow custom vim configs on a per project basis
set exrc
set secure


" Automatically create backup/cache dirs for vim
" in ~/.vim-tmp/
" Filenames are full paths with % separators
function! InitBackupDir()
  if has('win32') || has('win32unix') "windows/cygwin
    let l:separator = '_'
  else
    let l:separator = '.'
  endif
  let l:parent = $HOME . '/' . l:separator . 'vim-tmp/'
  let l:backup = l:parent . 'backup/'
  let l:tmp = l:parent . 'tmp/'
  if exists('*mkdir')
    if !isdirectory(l:parent)
      call mkdir(l:parent)
    endif
    if !isdirectory(l:backup)
      call mkdir(l:backup)
    endif
    if !isdirectory(l:tmp)
      call mkdir(l:tmp)
    endif
  endif
  let l:missing_dir = 0
  if isdirectory(l:tmp)
    execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if isdirectory(l:backup)
    execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if l:missing_dir
    echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
    echo 'Try: mkdir -p' l:backup
    echo 'and: mkdir -p' l:tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()
