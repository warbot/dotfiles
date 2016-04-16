" A lot borrowed from https://github.com/r00k/dotfiles/blob/master/vimrc
" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'

" Colors
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
colorscheme jellybeans

syntax on
" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

" sets
set nu
set expandtab
set tabstop=2 
set shiftwidth=2
set softtabstop=2
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
set backspace=indent,eol,start " allow backspacing through everything in insert mode
set history=500
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set autoindent
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp
set autoread
set sw=2
set smarttab
set laststatus=2 " always show last status 
set scrolloff=4 " keep 4 lines shown while scrolling
set shiftround " when >> shift from 1 space to 2 instead of 3
set nocompatible " disable compatibility with vi
set rnu
set showcmd

" mapping 
nmap 0 ^
command! W w

" leader
let mapleader = "\<Space>"

map <leader>r :!rake<cr>
map <leader>vi :tabe $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
" nmap <C-Tab> gt
nmap <Tab> <C-w><C-w>
nnoremap <CR> o<Esc>
nnoremap <S-K> r<CR><Esc>
nnoremap <Esc>f gt
nnoremap <Esc>b gT
map <leader>o <S-o><ESC>
map <leader>gg mmgg=G`mzz<ESC>
map <Leader>rp viwpyiw
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nmap <Leader>gd <esc>:Gdiff<CR>
nmap <Leader>gs <esc>:Gstatus<CR>

" RSpec.vim mappings
let g:rspec_command = "!spec -c -f n --drb {spec}"
map <Leader>rs :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
map <Leader>rk :w<CR>:!rake<CR>
map <Leader>dt :vs<CR><C-w>l

" Rust.vim mapping
map <Leader>ct :!cargo test<CR>

imap jk <ESC>
imap kj <ESC>

" Quickfix management
map <Space><Space> :ccl<cr>

" alias commands
command! Q q " alias :Q, :q
command! Qall qall

" tabs
nnoremap <C-f> <esc>:tabfirst<cr>
nnoremap <C-l> <esc>:tablast<cr>

" copy/paste buffer
map <leader>cc "+y
map <leader>cw viw"+y
map <leader>dw viw"+ydiw

" Disable K looking stuff up
map K i<cr><esc>

" Borrowed form r00k
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

" Remove file
nmap <Leader>rm :call delete(expand('%'))

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" https://github.com/rking/ag.vim
" https://github.com/karlbright/qfdo.vim
" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
set runtimepath^=~/.vim/bundle/ag

" auto trim white spaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType ruby autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Wrap the quickfix window
autocmd FileType qf setlocal wrap linebreak

" Make it more obviouser when lines are too long
highlight ColorColumn ctermbg=100
