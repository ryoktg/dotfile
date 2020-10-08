syntax on

set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set colorcolumn=80
set completeopt=longest,menuone,noinsert,noselect
set encoding=utf8
"set esckeys
set nohlsearch
set expandtab
set exrc
set incsearch
set laststatus=2
set modelines=0
set nobackup
set nocompatible
set noea
set noerrorbells
set nofixendofline
set noswapfile
set nu
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set timeoutlen=1000
set ttimeoutlen=100
set undodir=~/.config/nvim/undo
set undofile
set updatetime=50
set wrap
"set cursorline

highlight ColorColumn ctermbg=0 guibg=lightgrey

" map
let mapleader=" "

source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/gruvbox.vim
source $HOME/.config/nvim/plug-config/highlightedyank.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/netrw.vim
source $HOME/.config/nvim/plug-config/rg.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/undotree.vim

filetype on
filetype plugin on
filetype indent on


" general mapping
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> <Esc>:w<CR>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>q :q!<CR>

let g:ryo_toggle_comment=1
function! Comment() abort
  let l:ft = &filetype
  if l:ft == 'go'
    let l:comment = '//'
  elseif l:ft == 'vim'
    let l:comment = '"'
  else
    throw 'unknown file type: '.&filetype
  endif
  let l:comment = l:comment.' '
  let l:line = getline('.')
  let l:linenr = line('.')
  let l:comment_pattern = '\s*'.l:comment.'\s*'
  let l:not_commented = match(l:line, l:comment_pattern) != 0
  let l:new_line = l:line
  if l:not_commented
    let l:new_line = l:comment.l:line
  elseif get(g:, 'ryo_toggle_comment', 0) == 1
    let l:new_line = substitute(l:line, l:comment_pattern, '', '')
  endif
  call setline(l:linenr, l:new_line)
endfunction

