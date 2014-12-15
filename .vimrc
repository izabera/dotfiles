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
set cursorline

set noerrorbells visualbell t_vb=


"set hlsearch
set incsearch

" " " " " " " " " " " " " " " " " " " " " " " " " " "
" clipboard mappings:
" " " " " " " " " " " " " " " " " " " " " " " " " " "
vnoremap <C-x> "*x
vnoremap <C-c> "*y



" " " " " " " " " " " " " " " " " " " " " " " " " " "
" misc mappings:
" " " " " " " " " " " " " " " " " " " " " " " " " " "

" select all: C-a
vnoremap <C-a> <Esc>ggVG
inoremap <C-a> <Esc>ggVG
" nnoremap <C-a> ggVG         " C-a == increment number
"
" insert new line in normal mode: <CR>
nnoremap <CR> o<Esc>

" save 'with sudo' by using :w!!
cmap w!! w !sudo tee > /dev/null %

" default Y = yank current line
nnoremap Y y$

" change from cursor to the beginning of the word: cb
" change from cursor to the beginning of the Word: cB
" these two would be great but are messing up with the counters...
"nnoremap cb cb<DEL>
"nnoremap cB cB<DEL>

filetype plugin indent on
syntax on
set foldmethod=indent



" " " " " " " " " " " " " " " " " " " " " " " " " " "
" Theme
" " " " " " " " " " " " " " " " " " " " " " " " " " "
colorscheme torte
hi clear CursorLine
hi CursorLine ctermbg=233
hi Folded ctermfg=236
hi LineNr ctermfg=8



" " " " " " " " " " " " " " " " " " " " " " " " " " "
" PLUGINS
" " " " " " " " " " " " " " " " " " " " " " " " " " "

" nerdtree config:

" open at startup
" autocmd vimenter * NERDTree

" show hidden files
let NERDTreeShowHidden=1

" ignore git and swp files
let NERDTreeIgnore=['\~$', '^\.git', '\.swp$']

" close vim if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <F4> :NERDTreeToggle<CR>

" focus on the file (if any)
autocmd vimenter * wincmd l


" nerdcommenter mappings:
" toggle comments: C-k
nmap <C-k> <Leader>c<Space>
vmap <C-k> <Leader>c<Space>


" open man page inside of vim
runtime ftplugin/man.vim
nnoremap K :Man <C-r><C-w><CR>
vnoremap K :Man <C-r><C-w><CR>

" run pathogen
execute pathogen#infect()




" save all on focus lost
autocmd FocusLost * :wa

" buffers mappings:
"
" (buffers list in the line below thx to bufferline plugin) " save & show next buffer in the current split: Tab
nnoremap <Tab> :w<CR>:bnext<CR>

" save & show previous buffer in the current split: S-Tab
nnoremap <S-Tab> :w<CR>:bprevious<CR>

" resize window mappings:
" increase width: C-Left
" decrease width: C-Right
" increase height: C-Up
" decrease height: C-Down
"map <C-Left> <Esc><C-w><
"map <C-Right> <Esc><C-w>>
"map <C-Up> <Esc><C-w>+
"map <C-Down> <Esc><C-w>-

