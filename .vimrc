set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
" set re=1 " https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
" set synmaxcol=256
set lazyredraw          " Wait to redraw
set ttyfast
set cul!
set nu rnu
set showcmd
set ts=2 sts=2 noet
set shiftwidth=2
set expandtab
set noswapfile
set splitright
set hlsearch
set ignorecase
set smartcase
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
" https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
" Plugin 'tpope/vim-dispatch'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'
" Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Plugin 'AndrewRadev/switch.vim'
" Plugin 'zxqfl/tabnine-vim'
" https://github.com/nvim-treesitter/nvim-treesitter#quickstart
" To install :TSInstall {language}
" To update all parsers unconditionally, use :TSUpdate all or just :TSUpdate
if has('nvim')
  Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

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

set bg=dark
colorscheme gruvbox

imap kj <Esc>
imap jk <Esc>


let mapleader = "\<Space>"

map <leader>vi :tabe $MYVIMRC<CR> :sp ~/.vimrc<CR>
map <leader>gi :tabnew ~/.gitconfig<cr>
map <leader>so :source $MYVIMRC<cr>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map  <Esc>:w<CR>
map <C-s> <esc>:w<CR>:nohlsearch<CR>
imap <C-s> <esc>:w<CR>:nohlsearch<CR>
map <C-t> <esc>:tabnew
map <C-x> <C-w>c
nnoremap <Leader>dt :vs<CR><C-w>l
nmap <Tab> <C-w><C-w>
nnoremap <C-e> <C-i>
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-c> :Commits<CR>
nnoremap <C-h> :History<CR>
nnoremap <silent> <C-j> gT
nnoremap <silent> <C-k> gt
nmap <Leader>gd <esc>:Gdiff<CR>
nmap <Leader>gs <esc>:Gstatus<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gb <esc>:Gblame<CR>
nmap <Leader>gl <esc>:Glog -- %<CR>
nmap <Leader>q :qall<CR>
map <leader>gg mmgg=G`mzz<ESC>
map <Leader>rp viwpyiw
" map <Leader>ch :chdir %<CR>
" map <Leader>cr :Ex $HOME/git/core-api<CR>
" map <Leader>mr :Ex $HOME/git/onelogin.com<CR>
" map <Leader>ds :Ex $HOME/git/directory-service<CR>
" map <Leader>pv :Ex $HOME/git/onelogin-provisioning<CR>
nmap <Leader>cp :let @+ = expand("%")<CR>
nmap <Leader>cl :let @+ = expand("%") . ":" . line(".")<CR>
nmap <Leader>sp :let @+ = "spec " . expand("%")<CR>
nmap <Leader>sl :let @+ = "spec " . expand("%") . ":" . line(".")<CR>
nmap <Leader>vl :let @+ = "vim +" . line(".") . " " . expand("%")<CR>
nnoremap <leader>ee :Exp<CR>
nnoremap <leader>bp Obinding.pry<ESC>
nnoremap <leader>nt <C-w><S-t>

" RSpec.vim mappings
let g:rspec_command = "!spec -c -f n --drb {spec}"
map <Leader>rs :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

" copy/paste buffer
map <leader>cc "+y
map <leader>cw "+yiw

" close quickfix
nnoremap <leader><SPACE> :ccl<CR>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" https://robots.thoughtbot.com/faster-grepping-in-vim
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<SPACE>

" https://stackoverflow.com/questions/63905992/open-fzf-vim-in-split-instead-of-floating-window
let g:fzf_layout = { 'down': '~40%' }
" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
let g:ackprg = 'ag --vimgrep'
nnoremap \ :Ack<SPACE><c-r>=expand("<cword>")<cr>

" https://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap ® viw<Esc>:%s/\<<c-r>=expand("<cword>")<cr>\>//g<left><left>
nnoremap ^[r viw<Esc>:%s/\<<c-r>=expand("<cword>")<cr>\>//g<left><left>
" map <C-V>       "+gP
" nnoremap <leader>l "0p
" nnoremap <leader>fh $v%lohc<CR><CR><Up><C-r>"<Esc>:s/,/,\r/g<CR>:'[,']norm ==<CR>

autocmd BufWritePre * %s/\s\+$//e

" https://vi.stackexchange.com/questions/184/how-can-i-clear-word-highlighting-in-the-current-document-e-g-such-as-after-se
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
