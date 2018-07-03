call plug#begin('~/.vim/plugged')
" colors
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'junegunn/seoul256.vim'

" syntax
Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'

" utils
Plug 'sjl/vitality.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'

" tools
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmux-plugins/tmux-sensible'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
call plug#end()

let g:jsx_ext_required = 0
let g:vitality_fix_cursor = 0
let g:ack_default_options = ' -s -H --nopager --nocolor --nogroup --column --ignore-dir=dist --ignore-dir=webpack/dll'
let g:ackhighlight = 1
" let g:seoul256_background = 254
let mapleader = "z"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'botright vsplit' }

set noswapfile
set number
set scrolloff=999
set hlsearch
set ignorecase
set smartcase
set hidden
set tabstop=4
set shiftwidth=4
set noexpandtab
set nowrap
set autowrite

set background=light " or light if you prefer the light version
let g:two_firewatch_italics=1
colo two-firewatch

let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme

inoremap jk <esc>

" fzf {{{
noremap <leader>f :Files<cr>
" }}}

noremap <c-r>o :NERDTreeFocus<cr>
noremap <c-r>c :NERDTreeClose<cr>
noremap <c-r>f :NERDTreeFind<cr>
noremap <c-w><c-m> <c-w><bar><c-w>_
noremap J gt
noremap K gT
noremap H ^
noremap L $
noremap <c-h> :wincmd h<cr>
noremap <c-j> :wincmd j<cr>
noremap <c-k> :wincmd k<cr>
noremap <c-l> :wincmd l<cr>

noremap <leader>h :nohl<cr>
noremap <leader>w :set nowrap<cr>
noremap <leader>q :set wrap<cr>
noremap <leader>j :join<cr>
noremap <leader>, $%
noremap <leader>< %
noremap <leader>l :set list<cr>
noremap <leader>; :set nolist<cr>
noremap <leader>m :marks a,s,d,f<cr>
noremap <leader>r :redo<cr>
noremap <leader>nw *
noremap <leader>pw #
noremap <leader>> f>l

" motion / operator-pending {{{
onoremap i, :normal t,vB<cr>

onoremap ;l :normal t:vB<cr>
" }}}

" open files
nnoremap <leader>ov :botright split ~/.vimrc<cr>
nnoremap <leader>cv ZZ:source ~/.vimrc<cr>
nnoremap <leader>on :botright 50vnew ~/documents/notes.txt<cr>:set textwidth=45<cr>
nnoremap <leader>ot :botright 100vnew ~/dev/gg-api/src/Router/Routes/Test.class.php<cr>
nnoremap <leader>orbl :e ~/dev/gg-api/src/Tournament/Registration/BL.class.php<cr>

" all files {{{
autocmd FocusLost * :wa
" }}}

" javascript {{{
autocmd FileType javascript,javascript.jsx iabbrev <buffer> log console.log
" }}}

" php {{{
augroup filetype_php
	autocmd!

	autocmd FileType php iabbrev <buffer> log \Logger::log
	autocmd FileType php iabbrev <buffer> print print_r(json_encode

	autocmd FileType php nnoremap <leader>nf :execute "normal! j/\\(public\\\\|private\\).*function\r"<cr>
	autocmd FileType php nnoremap <leader>pf :execute "normal! k?\\(public\\\\|private\\).*function\r"<cr>
	autocmd FileType php nnoremap <leader>sf /\(public\\|private\).*function 

	autocmd BufWritePost *.php !gg-repo-sync
augroup END
" }}}

" vim {{{
augroup filetype_vim
	autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
