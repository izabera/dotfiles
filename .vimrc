if &compatible 
  set nocompatible
endif

set number
set mouse=a
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linebreak
set ruler
set title
set smartcase
set bs=eol,indent,start
"set cursorline

set hlsearch
set incsearch

" clipboard mappings:
" copy: C-c
" cut: C-x
vnoremap <C-x> "+x
vnoremap <C-c> "+y
" imap <C-v> <Esc>"+Pa        " my terminal uses <C-S-v> as paste

" misc mappings:
" select all: C-a
" insert new line in normal mode: <CR>
vnoremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVG
" nnoremap <C-a> ggVG         " C-a == increment number
nnoremap <CR> o<Esc>

filetype plugin indent on
syntax on
set foldmethod=indent

" theme config:
" solarized theme
" light bg in gui
" ubuntu mono 9 in gui
" colorscheme solarized
" if has('gui_running')
"   set background=light
" else
"   set background=dark
" endif
" set guifont=Ubuntu\ Mono\ 9
" let g:solarized_termcolors=256
" set t_Co=256
colorscheme torte
hi CursorLine ctermbg=233
hi Folded ctermfg=236
hi LineNr ctermfg=8

" <------------ PLUGINS --------------->
" nerdtree config:
" open at startup
" show hidden files
" ignore git and swp files
" open nerdtree on home folder if no file is selected
" close vim if nerdtree is the only buffer left
" focus on the file (if any)
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <F4> :NERDTreeToggle<CR>
autocmd vimenter * wincmd l

" neocomplete
" let g:neocomplete#enable_at_startup = 1

" nerdcommenter mappings:
" toggle comments: C-k
nmap <C-k> <Leader>c<Space>
vmap <C-k> <Leader>c<Space>
" <----------- /PLUGINS --------------->

" save all on focus lost
autocmd FocusLost * :wa

" buffers mappings:
" (buffers list in the line below thx to bufferline plugin) " save & show next buffer in the current split: Tab
" save & show previous buffer in the current split: S-Tab
nnoremap <Tab> :w<CR>:bnext<CR>
nnoremap <S-Tab> :w<CR>:bprevious<CR>

" resize window mappings:
" increase width: C-Left
" decrease width: C-Right
" increase height: C-Up
" decrease height: C-Down
map <C-Left> <Esc><C-w><
map <C-Right> <Esc><C-w>>
map <C-Up> <Esc><C-w>+
map <C-Down> <Esc><C-w>-

" run pathogen
execute pathogen#infect()

