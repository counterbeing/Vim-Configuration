set nocompatible
syntax on
set hidden

" Set up Pathogen Bundle Mangement
call pathogen#infect()
call pathogen#helptags()

" Enable Mouse support
if has("mouse")
  set mouse=a
endif

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jshint']


set wildignore=vendor/rails/**
set history=1000
set wildmenu
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set ruler
set showcmd
map Q gq
set smartindent
set autoindent
filetype plugin on 
filetype indent on 
" autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=ruby | endif
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
set showmatch
set incsearch
set hls
set t_Co=256
set background=dark
color solarized
nnoremap <CR> :nohlsearch<cr>
set cursorline
set cmdheight=1
set number
" set numberwidth=5
command! W :w
let mapleader=","
imap <c-c> <esc>
imap <S-CR> <CR><CR>end<Esc>-cc
map <leader>n :NERDTreeToggle <Return>
let NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.DS_Store$']
set nowrap

 " jamessan's
set statusline=                                                     " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                                             " buffer number
set statusline+=%f\                                                 " file name
set statusline+=%h%m%r%w                                            " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},                         " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},                        " encoding
set statusline+=%{&fileformat}]                                     " file format
set statusline+=%=                                                  " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\   " highlight
set statusline+=%b,0x%-8B\                                          " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P                               " offset


" Ctrl-P
" -----------------------------------------------------------------------------
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader>t :CtrlP<cr>
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_use_caching=0
" function RefreshFiles()
"   echom "Refreshing file list..."
"   :call CtrlP#CtrlPClearAllCaches()
"   " NERDTreeMapRefreshRoot()
" endfunction
" map <leader>r :call RefreshFiles()<cr>

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
