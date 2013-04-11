#!/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/ervandew/supertab.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/groenewege/vim-less.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/wincent/Command-T.git",
  "git://github.com/tpope/vim-unimpaired.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/tpope/vim-commentary.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/vim-scripts/ZoomWin.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/scrooloose/nerdcommenter.git",
  "https://github.com/hughbien/md-vim.git",
  "https://github.com/rodjek/vim-puppet.git",
  "https://github.com/avakhov/vim-yaml.git",
  "https://github.com/mileszs/ack.vim.git",
  "git://github.com/othree/html5.vim.git"
]

vim_org_scripts = [
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
