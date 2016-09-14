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
" Base                                                                     {{{
" ----------------------------------------------------------------------------

set nocompatible           " be iMproved, required
source $HOME/.vim/plug.vim " load plugins
filetype off               " required
filetype plugin indent on  " required
let mapleader=","          " Set leader key to ','
set hidden                 " hide buffers so we don't have to write them when working on another file
set lazyredraw             " redraw only when we need to.
set ttyfast
set shortmess+=I           " No welcome screen
set history=200            " Remember the last 200 :ex commands
set exrc                   " Allow custom vim configs in project folders
set secure                 " Don't allow malicious vim configs
set autoread
set re=1                   " Use old regex engine, faster for ruby syntax
set visualbell             " Sweet silence
set timeoutlen=300 ttimeoutlen=10


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

set ttymouse=sgr
set mouse+=a

set scrolloff=3                " how many lines to pad between cursor and edge of page when scrolling
set backspace=indent,eol,start " allow backspacing over autoindent, line breaks, start of inserts
set showmatch                  " briefly jump to the matching brace when you insert one, use matchtime to control how long.

set hlsearch                   " highlight matched search results
nnoremap <CR> :nohlsearch<cr>| " remove highlighting when you hit <Enter>
set incsearch                  " move cursor to matched string while typing pattern

" Nerd Tree binding and plugin options
map <leader>n :NERDTreeToggle <Return>
nmap <leader>nn :NERDTreeFind<CR>
let NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.DS_Store$']

nnoremap <Leader>t :call PickFile()<CR>| " Pick binding (an awesome fuzzy finder plugin)
nnoremap <Leader>T :call PickBuffer()<CR>| 
nnoremap <leader>u :GundoToggle<CR>|     " Gundo binding (ultra-undo plugin)

if executable('ag')
    " Use the silver searcher if available
    let g:ackprg = 'ag --vimgrep'
  endif


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

" Finding and replacing interactively using over-vim, thanks toranb
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

map <leader>R :call RunRubocop()<CR>

" Copy current file path to clipboard
map <leader>s :call CopySpecCommand() <CR>
map <leader>f :call CopyFilePath()<CR>
map <leader>p :call PasteToggle()<cr>
nmap <Leader>r :call RevealInFinder()<CR>
nmap <Leader>ct :call RegenerateCtagsForYCM()<CR>
nmap <Leader>cc :call CompleteCopyFile()<CR><CR><CR>

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
" colorscheme base16-default
" color flattown
set background=dark         " Use dark instead of light
colorscheme hybrid

let g:ruby_path                           = '~/.rbenv/shims/ruby'
let g:syntastic_ruby_checkers             = ['rubocop', 'mri']

let g:syntastic_ruby_mri_exec             = '~/.rbenv/shims/ruby'
let g:syntastic_javascript_checkers       = ['eslint']
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

" }}}-------------------------------------------------------------------------
" Appearance                                                               {{{
" ----------------------------------------------------------------------------

" let g:indentLine_noConcealCursor="" " prevent conflict in vim-json and indentLine
" hi link jsonBraces Function| " pretty blue braces instead of red
set synmaxcol=500 " Prevent performance issues on long lines
set nowrap        " Don't wrap lines by default
set cursorline  " highlight cursor location
set number      " show line numbers

" }}}-------------------------------------------------------------------------
" Plugin Configuration                                                     {{{
" ----------------------------------------------------------------------------
let g:table_mode_corner="|"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger="<tab><tab>"

" }}}-------------------------------------------------------------------------
" Custom Functions                                                         {{{
" ----------------------------------------------------------------------------

function! CopyFilePath()
  let l:filePath = expand('%')
  execute ':silent !echo ' . l:filePath . " | pbcopy"
  redraw!
  echo "Path to file copied to clipboard!"
endfunction

" Copy spec command of current line in file
" This makes the full spec command on your behalf, and puts it on the system
" clipboard for you to call wherever you like. Using relative paths allows
" this to work when your rails app is running in some kind of container.
function! CopySpecCommand()
  let l:lineNumber = line('.')
  let l:filePath = expand('%')
  let l:fullPath =  "rspec " . "./" . l:filePath .  ":" . l:lineNumber
  execute ':silent !echo ' . l:fullPath . " | pbcopy"
  redraw!
  echo "Spec command copied to clipboard!"
endfunction


" Paste Toggle
" The following sets a variable to keep track of paste mode, and turns
" both paste mode and insert lines on and off for copying and pasting
let g:pasteMode = 0
function! PasteToggle()
  if g:pasteMode
    IndentLinesEnable
    GitGutterEnable
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
    GitGutterDisable
    set mouse=""
    set paste
    set wrap
    set nonumber
    setlocal conceallevel=0
    let g:pasteMode = 1
    echom "Paste mode ON!"
  endif
endfunction

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

" Copy complete contents of current file to clipboard
function! CompleteCopyFile()
  ! cat % | pbcopy 
  echom "Complete file copied to clipoard!"
endfunction

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

function! VisualFindAndReplace()
  :OverCommandLine%s/
  :w
endfunction

function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
  :w
endfunction

function! RunRubocop()
  execute ":silent !NO_BUNDLE_EXEC=1 rubocop -f s -Ra ./%"
  redraw!
endfunction

function! RegenerateCtagsForYCM()
  execute ":silent !ctags -R -f ./.tags --fields=+l"
  redraw!
  echo "Regenerated ctags in .tags"
endfunction

" }}}
" vim:foldmethod=marker:foldlevel=0

