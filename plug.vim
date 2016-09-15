if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

"Syntax and such
Plug 'tpope/vim-liquid'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'
Plug 'briancollins/vim-jst'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-haml'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'vim-ruby/vim-ruby'
Plug 'avakhov/vim-yaml'
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Keithbsmiley/rspec.vim'
Plug 'airblade/vim-gitgutter'

"Do Stuff Plugins
Plug 'dhruvasagar/vim-table-mode'                       " Easily create tables
Plug 'bling/vim-airline'                                " Fancy bar at the bottom
Plug 'vim-airline/vim-airline-themes'                   " Themes for airline
Plug 'sjl/gundo.vim'                                    " Show tree of undos
Plug 'thoughtbot/pick.vim'                              " Fuzzy finder replacement
Plug 'tpope/vim-surround'                               " For quickly changing surrounding characters
Plug 'scrooloose/nerdtree'                              " File Browser, sometimes you need to see the tree
Plug 'tpope/vim-fugitive'                               " Vim based git access
Plug 'tomtom/tcomment_vim'                              " Super fast commenting (try gcc for one line)
Plug 'taylor/vim-zoomwin'                               " Zooms in on a specific window when you have a bunch of splits
Plug 'godlygeek/tabular'                                " Regex based indentation
Plug 'scrooloose/syntastic'                             " Shows syntax errors in sidebar
Plug 'mileszs/ack.vim'                                  " Allows searching through many files for a specific string
Plug 'AndrewRadev/splitjoin.vim'                        " Auto-format code on single or multi lines
Plug 'Yggdroot/indentLine'                              " Adds vertical lines for code blocks
Plug 'osyo-manga/vim-over'                              " Live preview for search and replace
Plug 'jgdavey/vim-blockle'                              " Convert block formats
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Advanced autocomplete
Plug 'SirVer/ultisnips'                                 " Snippets loader
Plug 'honza/vim-snippets'                               " Predefined snippets
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-endwise'

" Color Schemes
Plug 'flazz/vim-colorschemes'                                 " Simple colors

filetype plugin indent on                               " required!
call plug#end()
