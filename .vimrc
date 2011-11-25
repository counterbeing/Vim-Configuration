"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
"" General Settings

" Enable syntax highlighting.
syntax on

" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix

" Set line numbering on
set number
set numberwidth=4

" Automatically indent when adding a curly bracket, etc.
set autoindent
set smartindent

" Tabs converted to 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set backspace=indent,eol,start

" Set up backup dir where the swap files are stored
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" Show special characters
if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
else
    set list listchars=tab:>-,trail:.,extends:>
endif

" Don't break up long lines, but visually wrap them.
set textwidth=0
set wrap

" Text mode
command TextMode set nolist wrap linebreak scrolloff=999 encoding=latin1

" Highlight current line
set cursorline

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Minimal number of screen lines to keep above and below the cursor.
" This keeps the cursor always in the vertical middle of the screen.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=%{fugitive#statusline()} " Fugitive status
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position

" Tab line
" Refer ':help setting-guitablabel'
if v:version >= 700

function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, '&modified')
            let label = '[+] '
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= wincount
    endif
    if label != ''
        let label .= ' '
    endif

    return label

endfunction

set guitablabel=%{GuiTabLabel()}\ %t

endif " v:version >= 700

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case while searching
set ignorecase

" Make /g flag default when doing :s
set gdefault

" Show autocomplete menus
set wildmenu

" Show editing mode
set showmode

" Ignore certain filetypes when doing filename completion
set wildignore=*.swp,*.pyc,*.bak

" Show matching brackets
set showmatch

" Bracket blinking
set matchtime=2

" Split new window below current one
set splitbelow

" Split new window right of current one
set splitright

" Error bells are displayed visually.
set visualbell

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" Disable highlighting after search. Too distracting.
"set nohlsearch
set incsearch

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Reformatting options. See `:help fo-table`
set formatoptions+=lnor1

" Disable spellcheck by default
set nospell
autocmd BufRead,BufNewFile * setlocal nospell
" To enable again, use:
