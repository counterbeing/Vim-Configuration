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
filetype plugin indent on
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=4
set laststatus=2
set showmatch
set incsearch
set hls
set t_Co=256
set background=light
color solarized
nnoremap <CR> :nohlsearch<cr>
set cursorline
set cmdheight=2
set number
set numberwidth=5
command! W :w
let mapleader=","
imap <c-c> <esc>
imap <S-CR> <CR><CR>end<Esc>-cc
map <leader>n :NERDTreeToggle <Return>
let NERDTreeDirArrows=0
set nowrap
" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%{fugitive#statusline()} " Fugitive status
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position


