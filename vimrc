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
Plugin 'cohama/lexima.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tmhedberg/matchit'
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
imap jk <esc>
map <Leader>i mmgg=G`m

nnoremap <leader>osr :VtrOpenRunner<cr>

nnoremap <leader>_ 80a-<ESC>o<ESC>o

" https://www.linux.com/learn/vim-tips-folding-fun
" saving view and loading view on exit and startup respectively
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
" Possible solution:
" https://github.com/VundleVim/Vundle.vim/issues/742#issuecomment-300534497
nnoremap <leader>h :!htmlbeautifier %<cr>

" Indent using '>'
set shiftwidth=2

" Delete comment lines starting with #
nnoremap <leader>dcl :g/^#/d<cr>
nnoremap <leader>dcL :g/\v^(#\|$)/d<cr>

" Customized Command-t

nnoremap <leader>p :CommandT<cr>

let g:rspec_command = "VtrSendCommandToRunner rspec {spec}"
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" https://github.com/christoomey/dotfiles/blob/26ef48ccf14b556d0a9e3944ccce6cb8f7e5d7d1/vim/rcplugins/tmux-runner
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <Leader>f :VtrSendFile<cr>

" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" Automatically open netrw
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
