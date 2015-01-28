#!/usr/bin/env ruby

require 'fileutils'
require 'open-uri'


git_bundles = [ 
  # Various Syntax Plugins
  "https://github.com/tpope/vim-liquid",
  "git://github.com/pangloss/vim-javascript.git",
  "https://github.com/briancollins/vim-jst",
  "https://github.com/elzr/vim-json",
  "https://github.com/mustache/vim-mustache-handlebars.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/digitaltoad/vim-jade.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/groenewege/vim-less.git",
  "https://github.com/cakebaker/scss-syntax.vim",
  "git://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/rodjek/vim-puppet.git",
  "https://github.com/avakhov/vim-yaml.git",
  "git://github.com/othree/html5.vim.git",
  "https://github.com/Glench/Vim-Jinja2-Syntax",
  "https://github.com/Keithbsmiley/rspec.vim",

  # Do Stuff Plugins
  "git://github.com/tpope/vim-surround.git",              # File Browser, sometimes you need to see the tree
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/tpope/vim-fugitive.git",               # Vim based git access
  "git://github.com/msanders/snipmate.vim.git",
  "https://github.com/tomtom/tcomment_vim",                # Super fast commenting (try gcc for one line)
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/taylor/vim-zoomwin",                 # Zooms in on a specific window when you have a bunch of splits
  "https://github.com/godlygeek/tabular.git",              # Regex based indentation
  "https://github.com/scrooloose/syntastic.git",           # Shows syntax errors in sidebar
  ["https://github.com/marijnh/tern_for_vim",              # Interactive javascript lint, works with syntastic
    "cd ~/.vim/bundle/tern_for_vim/; npm install"],        # This second line in the array runs the install command
  "https://github.com/kien/ctrlp.vim",                     # A fuzzy style finder
  "https://github.com/mileszs/ack.vim.git",                # Allows searching through many files for a specific string
  "https://github.com/Yggdroot/indentLine"                 # Adds vertical lines for code blocks
]

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

unless File.exists?(bundles_dir)
   FileUtils.mkdir(bundles_dir) 
end

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

def download_repo(url)
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

git_bundles.each do |repo|
  if repo.class == Array
    download_repo(repo.delete_at(0))
    repo.each do |command|
      system(command)
    end
  else
    download_repo(repo)
  end
end


