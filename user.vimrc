
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

