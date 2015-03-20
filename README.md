# Recommended Usage

### Move to your homedir
cd ~

### Clone the Repo 
This will end up in your home directory.

`git clone git://github.com/counterbeing/Vim-Configuration.git ~/.vim`

### Symlink it
Create a symlink in your homedir from .vimrc to the .vimrc inside this .vim
`ln -s .vim/.vimrc `

### Run The Script To Grab All Vim Bundles
```
cd .vim
git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall
```
