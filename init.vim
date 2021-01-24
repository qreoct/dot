" Vim sensible settings {{{
let mapleader="\<Space>"
set encoding=utf-8
set listchars=trail:.,tab:>\ ,eol:$
set tabstop=1
set softtabstop=1
set expandtab
set termguicolors

" Searching
set incsearch hlsearch smartcase
nnoremap <silent> <leader><cr> :nohlsearch<cr>
set number
set backspace=indent,eol,start
set nostartofline
set autoread
set scrolloff=3
set wildmenu wildignorecase wildmode=list:longest,full
set cursorline
set ignorecase smartcase
set showmode showcmd
set shortmess+=I
set hidden
set history=100
set undolevels=100
set splitright splitbelow
set display+=lastline
set foldenable foldmethod=syntax foldlevelstart=99
set ttimeoutlen=50
set switchbuf=useopen
set breakindent
set autoindent
set smarttab

filetype plugin indent on

" fix conemu backspace {{{
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
" }}}

" make j and k act normally for wrapped lines {{{
nnoremap j gj
nnoremap k gk
" }}}

" splitting windows and cycling through {{{
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>h :sp<CR>
map <Tab><Tab> <C-W>w
" }}}

" better backup, swap and undo storage {{{
set noswapfile
set backup
set undofile
" }}}

" Custom utils/mappings {{{
"
" easy system clipboard copy/paste
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P

" visual paste without losing the copied content
xnoremap p "0p

" ez savefile
nnoremap <silent><Leader>w :w<CR>

" copy full file path to clipboard
nnoremap <silent><Leader>gp :let @+ = expand("%:p")<CR>

" cd to directory of current file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>

" edit config file
nnoremap <silent><leader>ec :e C:\Users\Jefferson\AppData\Local\nvim\init.vim<CR>

" compile and run code 
nnoremap <Leader>r :call CompileProgram()<CR>

function! CompileProgram()
  if &filetype == 'python'
    exec ":!timer %"
  elseif &filetype == 'java'
    exec ":!javac %"
    exec ":split|:terminal java %:t:r"
  elseif &filetype == 'html'
    exec ":!vivaldi % &"
  else
    exec ":!echo 'invalid filetype'"
  endif
endfunc

" exit from terminal mode (for java)
tnoremap <Esc> <C-\><C-n>

" easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <leader>q <c-w>c
nnoremap <silent> <leader>\ <c-^>

" buffer navigation
nnoremap <silent> <leader>b :buffers<CR>:buffer<SPACE>

" handling folds (especially in org mode)
nnoremap <silent> <leader><Tab> za

call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } "{{{
  nnoremap <silent> <Leader>4 :NERDTreeToggle<CR>
  nnoremap <silent> <Leader>5 :NERDTreeFind<CR>
"}}}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'

Plug 'sjl/badwolf'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'axvr/org.vim'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

let g:onedark_terminal_italics=1
let g:airline_theme='owo'
let g:org_clean_folds=1
autocmd FileType org,outline setlocal foldenable
syntax on
colorscheme onedark

