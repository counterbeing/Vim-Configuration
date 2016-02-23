# A Solid Vim Configuration
This is an ever evolving VIM config, which incorperates several plugins, color schemes, and custom functions. The `.vimrc` if heavily commented, and there are a few notes in this file, about some of the handier plugins and quicktips.

I also recommend you check out the my [dotfiles repo](https://github.com/counterbeing/.dotfiles) as it includes some binaries that this depends on like, `ack`, `pick`, and `eshint`. If you use that repo, it will include this one, and you can skip installation.

## Installation

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

## Featured Plugins
There are many great plugins out there, and many of them depend on what you're trying to do with vim. This is my own personal selecition, but would probably be a good starting point if you're working in Ruby and/or JavaScript.

Here's a cheatsheet of handy things, for reference.

### Fugitive

### Gundo

### TComment


## Custom Script
### Visual Mode

| Command  | Result                                                                                 |
|----------|----------------------------------------------------------------------------------------|
| `,p`     | Paste mode removes line numbers, and vertical alignment lines for easy system copying. |
| `,r`     | Reveals a particular file in the finder.                                               |
| `,j`     | Pretty formats selected json.                                                          |
| `CTRL-y` | Yanks selected text to system clipboard.                                               |

## General Vim Reminders

Some of my favorite and most used shortcuts.

### Tab Navigation

| command    | result                       |
|------------|------------------------------|
| `:tabnew`  | Make a new tab               |
| `gt`       | Toggle between tabs          |
| \<ctrl\> w T | Open current file in new tab |
