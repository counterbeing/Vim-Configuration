#!/usr/bin/env ruby

require 'fileutils'
require 'open-uri'


git_bundles = [ 
  "git://github.com/godlygeek/tabular.git",
  "https://github.com/tpope/vim-liquid",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/pangloss/vim-javascript.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/digitaltoad/vim-jade.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/groenewege/vim-less.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  # "https://github.com/kana/vim-textobj-user",
  # "https://github.com/nelstrom/vim-textobj-rubyblock",
  # "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/taylor/vim-zoomwin",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/rodjek/vim-puppet.git",
  # "https://github.com/nathanaelkane/vim-indent-guides",
  # "https://github.com/jelera/vim-javascript-syntax",
  "https://github.com/scrooloose/syntastic.git",
  ["https://github.com/marijnh/tern_for_vim", "cd ~/.vim/bundle/tern_for_vim/; npm install"],
  # "https://github.com/Raimondi/delimitMate",
  # "https://github.com/maksimr/vim-jsbeautify",
  "https://github.com/vim-scripts/FuzzyFinder",
  "https://github.com/avakhov/vim-yaml.git",
  "https://github.com/vim-scripts/L9",
  "https://github.com/mileszs/ack.vim.git",
  "git://github.com/othree/html5.vim.git"
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


