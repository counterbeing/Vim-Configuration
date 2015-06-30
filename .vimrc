"----------------------------------------------------------------------------
"              __
"      __  __ /\_\    ___ ___   _ __   ___
"     /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
"    __\ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"   /\_\\ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"   \/_/ \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
" This .vimrc file uses folding to manage the display of its contents.
" Use the 'zR' command to open all of the sections if you're lost...
" ----------------------------------------------------------------------------
" Vundle                                                                   {{{
" ----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'            " Required for vundle
Plugin 'tpope/vim-liquid'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'briancollins/vim-jst'
Plugin 'elzr/vim-json'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'avakhov/vim-yaml'
Plugin 'othree/html5.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Keithbsmiley/rspec.vim'

" Do Stuff Plugins
Plugin 'dhruvasagar/vim-table-mode'     " Easily create tables
Plugin 'blerins/flattown'               " Simple colors
Plugin 'bling/vim-airline'              " Fancy bar at the bottom
Plugin 'sjl/gundo.vim'                  " Show tree of undos
Plugin 'thoughtbot/pick.vim'            " Fuzzy finder replacement
Plugin 'tpope/vim-surround'             " For quickly changing surrounding characters
Plugin 'scrooloose/nerdtree'            " File Browser, sometimes you need to see the tree
Plugin 'tpope/vim-fugitive'             " Vim based git access
Plugin 'tomtom/tcomment_vim'            " Super fast commenting (try gcc for one line)
Plugin 'taylor/vim-zoomwin'             " Zooms in on a specific window when you have a bunch of splits
Plugin 'godlygeek/tabular'              " Regex based indentation
Plugin 'scrooloose/syntastic'           " Shows syntax errors in sidebar
Plugin 'mileszs/ack.vim'                " Allows searching through many files for a specific string
Plugin 'kana/vim-textobj-user'          " Select objects defined by patterns, used by vim-textobject-ruby
Plugin 'nelstrom/vim-textobj-rubyblock' " select rubyblocks
Plugin 'Yggdroot/indentLine'            " Adds vertical lines for code blocks

" Currently evaluating these two...
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'

call vundle#end()            " required
filetype plugin indent on    " required

" }}}-------------------------------------------------------------------------
" Base                                                                     {{{
" ----------------------------------------------------------------------------

" Set up Pathogen Bundle Mangement
" call pathogen#infect()
" call pathogen#helptags()

let mapleader=","
set nocompatible " enable modern features
set hidden       " hide buffers so we don't have to write them when working on another file
set lazyredraw   " redraw only when we need to.
set shortmess+=I " No welcome screen
set history=200  " Remember the last 200 :ex commands
set exrc " Allow custom vim configs in project folders
set secure " Don't allow malicious vim configs
set autoread


" }}}-------------------------------------------------------------------------
" Command Line                                                            {{{
" ----------------------------------------------------------------------------

set cmdheight=1                " how tall is command line
set wildmenu                   " Enable menu during command tab completion
set wildmode=longest:full,full " 1st tab = longest commong string, subsequent show possible full matches
set ignorecase                 " case insensitive search
set smartcase                  " (unless your search query has caps)

" }}}-------------------------------------------------------------------------
" Status Line                                                              {{{
" ----------------------------------------------------------------------------

set noshowmode                    " don't show mode in last row, it's in airline.
set laststatus=2                  " Always display the status line
let g:airline_powerline_fonts = 1 " Enable special powerline font (requires install)
let g:airline_theme='wombat'
let g:airline_left_sep=''         " Controls airline separator characters
let g:airline_right_sep=''        " these can get a little goofy depending on font

" }}}-------------------------------------------------------------------------
" Input and Navigation                                                     {{{
" ----------------------------------------------------------------------------

if has("mouse")
  set mouse=a                  " Enable Mouse support
endif

set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  " Allows for things like pane resizing within a tmux session
  set ttymouse=xterm2
endif

set scrolloff=3                " how many lines to pad between cursor and edge of page when scrolling
set backspace=indent,eol,start " allow backspacing over autoindent, line breaks, start of inserts
set showmatch                  " briefly jump to the matching brace when you insert one, use matchtime to control how long.

set hlsearch                   " highlight matched search results
nnoremap <CR> :nohlsearch<cr>| " remove highlighting when you hit <Enter>
set incsearch                  " move cursor to matched string while typing pattern

" Nerd Tree binding and plugin options
map <leader>n :NERDTreeToggle <Return>
let NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.DS_Store$']

nnoremap <Leader>t :call PickFile()<CR>| " Pick binding (an awesome fuzzy finder plugin)
nnoremap <leader>u :GundoToggle<CR>|     " Gundo binding (ultra-undo plugin)


" }}}-------------------------------------------------------------------------
" Key Bindings                                                             {{{
" ----------------------------------------------------------------------------

" Note: pipe characters at the end of these commands are to allow
" inline comments. Gross hack job. But look how pretty!

command! Tab :Tabularize
map Q gq|                          " Shortcut to rewrap selected text
command! W :w                      " For fat fingers: make :W == :w
imap <c-c> <esc>|                  " Map Ctrl-c to <Esc> to ease finger gymnastics
imap <S-CR> <CR><CR>end<Esc>-cc|   " Shift-Enger to insert 'end' from insert mode, broken?
map <leader>m Jxi\n<ESC>|          " Merge Lines, replacing newlines with \n char
map <leader>w :set wrap!<CR>|      " Toggle line wrapping
nnoremap gV `[v`]|                 " Highlight last inserted text
cmap w!! w !sudo tee > /dev/null % " Sudo save something

vmap <C-y> :w !pbcopy<CR><CR> 

" Shortcut to pretty-format ugly blocks of json
nmap <leader>j <Esc>:%!python -m json.tool<CR><ESC>gg=G<Esc>:noh<CR>

" }}}-------------------------------------------------------------------------
" Folding                                                                  {{{
" ----------------------------------------------------------------------------

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
nnoremap <space> za|    " space open/closes folds

" }}}-------------------------------------------------------------------------
" Indentation and Whitespace                                               {{{
" ----------------------------------------------------------------------------

set tabstop=2      " How many spaces per <Tab> char, for existing text
set shiftwidth=2   " Number of space chars used for indentation
set softtabstop=2  " Treat our hard tabs like soft tabs (backspace deletes 2 spaces)
set expandtab      " When inserting <Tab> char, write as spaces instead.
set autoindent     " copies indentation level from the previous line, shouldn't interfere with filetype indent.
filetype plugin on " determine various behaviour by file extension
filetype indent on " indent based on file-type

" Filetype-specific settings
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" }}}-------------------------------------------------------------------------
" Color & Syntax                                                           {{{
" ----------------------------------------------------------------------------

syntax on                   " enable file syntax highlighting

if &term == "screen"
  set t_Co=256              " Force 256 color only if needed
endif

" Base16 plugin options
let base16colorspace=256    " Enable 256 color mode
color flattown
" colorscheme base16-tomorrow " set color scheme
set background=dark         " Use dark instead of light

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

" }}}-------------------------------------------------------------------------
" Appearance                                                               {{{
" ----------------------------------------------------------------------------

let g:indentLine_noConcealCursor="" " prevent conflict in vim-json and indentLine
hi link jsonBraces Function| " pretty blue braces instead of red
set synmaxcol=500 " Prevent performance issues on long lines
set nowrap        " Don't wrap lines by default
set cursorline  " highlight cursor location
set number      " show line numbers

" }}}-------------------------------------------------------------------------
" Custom Functions                                                         {{{
" ----------------------------------------------------------------------------

" Paste Toggle
" The following sets a variable to keep track of paste mode, and turns
" both paste mode and insert lines on and off for copying and pasting
let g:pasteMode = 0
function PasteToggle()
  if g:pasteMode
    IndentLinesEnable
    set nopaste
    set nowrap
    set number
    if has("mouse")
      set mouse=a
    endif
    setlocal conceallevel=2
    let g:pasteMode = 0
    echom "Paste mode OFF!"
  else
    IndentLinesDisable
    set mouse=""
    set paste
    set wrap
    set nonumber
    setlocal conceallevel=0
    let g:pasteMode = 1
    echom "Paste mode ON!"
  endif
endfunction
map <leader>p :call PasteToggle()<cr>




" Reveal files in the finder
function! RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R %"
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open %:p:h"
  else
    let l:command = "open ."
  endif
  execute ":silent! !" . l:command
 " For terminal Vim not to look messed up.
 redraw!
endfunction 
nmap <Leader>r :call RevealInFinder()<CR>

" Copy complete contents of current file to clipboard
function! CompleteCopy()
  ! cat % | pbcopy 
  echom "Complete file copied to clipoard!"
endfunction
nmap <Leader>cc :call CompleteCopy()<CR><CR><CR>



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

" }}}
" vim:foldmethod=marker:foldlevel=0

