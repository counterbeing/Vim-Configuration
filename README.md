# A Solid Vim Configuration
This is an ever evolving VIM config, which incorperates several plugins, color schemes, and custom functions. The `.vimrc` if heavily commented, and there are a few notes in this file, about some of the handier plugins and quicktips.

Part of the beauty of vim is how modular and configurable it is. I invite you to use this repo as a starting point, or a guide for your own. This is also very handy as a place to sync such information between machines. Pretty much any machine I work on can be quickly bootstrapped to have a text editor that I know and love up and running in seconds. It's magic. 

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

https://github.com/tpope/vim-fugitive

Git integration within VIM. I know I really don't use this enough. I use this plugin in a few key ways, so I will outline them in workflows.

#### Making changes, and commiting them.
After making changes to a file, you can use `:Gstatus` to stage files for commit. A list will pop up, and you can select from the list of unstaged file by hitting the `-`  key. Each time you do this, a file will be staged for commit. You can move them the other way as well. Then, in the same window you can use `:Gcommit` to commit and write a message, `:wq` and you're done. Here's a video demo. 

[![asciicast](https://asciinema.org/a/6ko5vf3czc8hvobhn57m0g6dw.png)](https://asciinema.org/a/6ko5vf3czc8hvobhn57m0g6dw)

<iframe width="560" height="315" src="https://www.youtube.com/embed/AsKGOeonbIs?start=445&end=556&version=3" frameborder="0" allowfullscreen=""></iframe>

### Gundo

### TComment
| command | result                                      |
|---------|---------------------------------------------|
| `gcc`   | Toggles the commenting of a block on or off |

### TableMode

https://github.com/dhruvasagar/vim-table-mode

There are a few minor tweaks to make this work a bit more naturally with markdown, as that's what I use it for primarily.

| command | result                        |
|---------|-------------------------------|
| `,tm`   | Toggles table mode on or off. |


### GitGutter

https://github.com/airblade/vim-gitgutter

This offers some great integration for git, showing the current status of changes in a file. It really helps you remember what you were working on, and be aware of what changes you've made. Even more cool. If you were workig on two different changes by mistake, you can easily stage just some of them for commiting.

| Command | Result                  |
|---------|-------------------------|
| `,hs`   | Stage a hunk for commit |
| `,hu`   | Unstage a hunk          |

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

| command      | result                       |
|--------------|------------------------------|
| `:tabnew`    | Make a new tab               |
| `gt`         | Toggle between tabs          |
| `<ctrl> w T` | Open current file in new tab |

### Folding

| command   | result                                  |
|-----------|-----------------------------------------|
| `<space>` | Toggles a code block of folding.        |
| `zW`      | Fold everything in a file               |
| `zw`      | Fold everything at a particular level   |
| `zR`      | Unfold everything in a file             |
| `zr`      | Unfold everything at a particular level |

### Splits and Tabs

Super useful feature of vim for laying out different files next to each other, so that you can see everything you want to see at one time.

| command   | result                                                                                                                  |
|-----------|-------------------------------------------------------------------------------------------------------------------------|
| `:vsp`    | Creates a vertical split                                                                                                |
| `:sp`     | Creates a horizontal split                                                                                              |
| `:tabnew` | Creates a new tab                                                                                                       |
| `^w h`    | Move left to different window, in a split scenario. This also works with all of the direction keys `h`, `j`, `k` or `l` |
| `:tabnew` | Creates a new tab                                                                                                       |
| `gt`      | Toggle to next tab                                                                                                      |

### Sessions

Sessions are a quick way of saving window layouts, including spits, tabs, and even even set variables. I use it in a very simple way, which is just to output a `Session.vim` file in the current directory. I often need to drop what I'm working on to check out something on another git branch, which can cause issues with which files I want open. Usually I have things arranged in such a way that I have tests in one tab, and related code in another, or test/code pairs in each tab. It just depends on what I'm working on. With sessions, I can quickly save the state of the windows I was working on.

| command                | result                                                       |
|------------------------|--------------------------------------------------------------|
| `:mks` or `:mksession` | makes a simple `Session.vim` file in the current directory.  |
| `:mks file_path.vim`   | Makes the session file where you tell it.                    |
| `:mks!`                | Same as above except forces overwrite.                       |
| `$ vim -S Session.vim` | Open a VIM session file and open all of the tabs and splits. |

