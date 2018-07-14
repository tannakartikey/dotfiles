set nocompatible              " be iMproved, required
filetype off                  " required

" space as leader key
let mapleader=" "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/command-t'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rhubarb'
Plugin 'christoomey/vim-tmux-runner'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" zoom a vim pane, <C-w>= to re-balance
 nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
 nnoremap <leader>= :wincmd =<cr>

" Open new split panes to right and bottom
set splitbelow
set splitright

" Set line number on
set relativenumber

" vim-ruby
" https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" Ben Orenstein (Thoughtbot - Upcase)
" https://github.com/r00k/dotfiles/blob/master/vimrc
imap jj <esc>
map <Leader>i mmgg=G`m

nnoremap <leader>osr :VtrOpenRunner<cr>
