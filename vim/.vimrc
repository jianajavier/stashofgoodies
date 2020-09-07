set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin '907th/vim-auto-save'
Plugin 'w0rp/ale'

" Syntax Highlighting
Plugin 'vim-scripts/Io-programming-language-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'

" Colorscheme
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Theme
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

call vundle#end()

filetype plugin indent on

" Remove the ugly splits separator
set fillchars=vert:\│
hi VertSplit term=NONE cterm=NONE gui=NONE ctermfg=DarkGrey

" tabstop settings
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Set to auto read when a file is changed from the outside
set autoread

" show matching parenthesis/brace/bracket
set showmatch

" show statusline containing current cursor position
set ruler

" don't highlight search matches
set nohls

" use backspaces like all other programs
set backspace=indent,eol,start

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch

" line numbers
set number

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Turn off bells
set noerrorbells  " don't beep

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" always show statusline
set laststatus=2

set t_Co=256

" syntax highlighting on, if the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" set title in console title bar
set title

" map leader key to ,
let mapleader = ","

" toggle spellcheck with ,s
nmap <silent> <leader>s :set spell!<CR>

" vim-gitgutter
nmap <leader>h :GitGutterLineHighlightsToggle<CR>

" toggle the NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>m :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

hi EasyMotionTarget ctermbg=none ctermfg=Yellow

hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use The Silver Searcher over grep, iff possible
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
endif

" Silver Searcher
nnoremap <Leader>p :Ag<enter>

" grep/Ack/Ag for the word under cursor
" vnoremap <leader>a y:grep! "\b<c-r>"\b"<cr>:cw<cr>
" nnoremap <leader>a :grep! "\b<c-r><c-w>\b"
vnoremap <leader>a y:Ag <c-r><cr>:cw<cr><enter>
nnoremap <leader>a :Ag <c-r><c-w><enter>

nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" Use shift-H and shift-L for move to beginning/end
nnoremap <S-h> 0
nnoremap <S-l> $

nmap <silent> <Leader>t :tabnew<CR>
nmap <silent> <C-N> :tabprevious<CR>
nmap <silent> <C-M> :tabnext<CR>
nmap <silent> <Leader>d :tabe %<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"

let g:onedark_termcolors=16
set termguicolors

colorscheme onedark

