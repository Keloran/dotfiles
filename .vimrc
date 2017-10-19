" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Start Vundle
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Language stuff
Plugin 'gabrielelana/vim-markdown'
Plugin 'instant-markdown.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'majutsushi/tagbar'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'esneider/YUNOcommit.vim'

" UI
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'

" Name conflicts
Plugin 'L9'

" Commands
Plugin 'wincent/command-t'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-sensible'

" Spark Line
Plugin 'rstacruz/sparkup',{'rtp':'vim/'}

" Colors
Plugin 'flazz/vim-colorschemes'

" Auto complete
Plugin 'ervandew/supertab'

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" Quotes
Plugin 'tpope/vim-surround'

" Comments
Plugin 'tpope/vim-commentary'

" Stop Vundle
call vundle#end()

" Indent and Highlight
filetype plugin indent on
syntax on

" Colors
set laststatus=2
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
colorscheme molokai

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

" Mouse Scrolling
set mouse=a

" Language specific stuffs
if has("autocmd")
    autocmd BufRead,BufNewFile *.podspec,Podfile set filetype=ruby
    autocmd BufRead,BufNewFile *.json set autoindent filetype=javascript
    autocmd BufRead,BufNewFile *.md set filetype=markdown
endif

" Keys
set switchbuf=usetab
nnoremap <F7> :sbnext<CR>
nnoremap <S-F7> :sbprevious<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F4> <Plug>CommentaryLine
nmap md :InstantMarkdownPreview<CR>

" Markdown
let g:instant_markdown_autostart = 0
