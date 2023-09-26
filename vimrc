set nocompatible              " be iMproved, required
filetype off                  " required

" space as leader key
let mapleader=" "

set ruler
" vim-plug automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'Exafunction/codeium.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'vim-test/vim-test'
" Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-tmux-runner'
Plug 'cohama/lexima.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tmhedberg/matchit'
Plug 'iamcco/markdown-preview.vim'
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-pug'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-cucumber'
Plug 'TovarishFin/vim-solidity'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'mattn/emmet-vim'
" Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

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

" let g:rspec_command = "VtrSendCommandToRunner bundle exec rspec {spec}"
" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>a :TestSuite<CR>
let test#strategy = "vtr"

" https://github.com/christoomey/dotfiles/blob/26ef48ccf14b556d0a9e3944ccce6cb8f7e5d7d1/vim/rcplugins/tmux-runner
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <Leader>f :VtrSendFile<cr>

let g:vtr_filetype_runner_overrides = {
      \ 'rs': 'rustc {file}',
      \ }

" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" Automatically open netrw
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
nnoremap <leader>m :MarkdownPreview<cr>

" Emmet
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}
" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}
" let b:ale_fixers = ['prettier', 'eslint']

set rtp+=/usr/local/opt/fzf

" FZF shortcuts
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap fd :call CocActionAsync('jumpDefinition')<CR>

" imap <Tab> <Cmd>call codeium#Accept()<CR>
"
" Freed <C-l> in Netrw
" https://github.com/christoomey/vim-tmux-navigator/issues/189#issuecomment-633147327
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh


nnoremap <leader>gs :!git status<CR>
nnoremap <leader>rc :Rails console<CR>
