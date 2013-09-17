
" looks
set number
set cursorline
set ruler

" operation
set incsearch
set hlsearch

" tab setting
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" colorize
set modeline modelines=4
syntax enable

au BufNewFile,BufRead Rakefile setf ruby
au BufNewFile,BufRead Gemfile setf ruby

" -----------------------------------------------------------------------------

 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 Bundle 'repos-scala/scala-vundle'

 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'

 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
 " Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...
 
 filetype plugin indent on     " required!

