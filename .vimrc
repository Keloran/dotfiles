" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'garik/Vundle.vim'

" Language stuff
Plugin 'instant-markdown.vim'
Plugin 'vim-ruby/vim-ruby'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'esneider/YUNOcommit.vim'

" UI
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'

" Name conflicts
Plugin 'L9'

" Commands
Plugin 'wincent/command-t'
Plugin 'tpope/vim-eunuch'

" Spark Line
Plugin 'rstacruz/sparkup',{'rtp':'vim/'}

" Colors
Plugin 'wombat256.vim'

" Auto complete
Plugin 'ervandew/supertab'

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

" Indent and Highlight
filetype plugin indent on
syntax on

" Colors
set laststatus=2
let g:lightline = { 'colorscheme': 'wombat', }
colorscheme wombat256mod

" VIM Stuffs
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Tab Stuffs
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" Paste
set paste

syntax on

" Line Numbers
"set number

" Mouse Scrolling
set mouse=a

" Language specific stuffs
if has("autocmd")
    autocmd BufRead,BufNewFile *.podspec,Podfile set filetype=ruby
    autocmd BufRead,BufNewFile *.json set autoindent filetype=javascript
    autocmd BufRead,BufNewFile *.md set filetype=markdown
endif

" Markdown
let g:instant_markdown_autostart = 0


