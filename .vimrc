set nocompatible              " be iMproved, required
filetype off                  " required

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
set nohlsearch
set ignorecase
set smartcase
" https://github.com/neoclide/coc.nvim
set encoding=utf-8
set hidden
set cmdheight=2
set updatetime=500
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" https://github.com/nvim-treesitter/nvim-treesitter#folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

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
" Plugin 'tpope/vim-endwise'
" Plugin 'tpope/vim-dispatch'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
" type TabNine::version then TabNine::sem
" Plugin 'zxqfl/tabnine-vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'machakann/vim-sandwich'
" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plugin 'AndrewRadev/splitjoin.vim'

" Plugin 'AndrewRadev/switch.vim'
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
map <leader>so :source ~/.vimrc<CR>
map <leader>gi :tabnew ~/.gitconfig<CR>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map  <Esc>:w<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew
map <C-x> <C-w>c
nmap <Tab> <C-w><C-w>
nnoremap <C-e> <C-i>
nnoremap <C-f> :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-c> :Commits<CR>
nnoremap <C-h> :History<CR>
nnoremap <silent> <C-j> gT
nnoremap <silent> <C-k> gt
nnoremap <Leader>dt :vs<CR><C-w>l
nmap <Leader>gd <esc>:Git diff<CR>
nmap <Leader>gs <esc>:Git<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gb <esc>:Git blame<CR>
nmap <Leader>gl <esc>:Git log -- %<CR>
nmap <Leader>q :qall<CR>
map <leader>gg mmgg=G`mzz<ESC>
map <Leader>rp viwpyiw
map <Leader>ch :chdir %<CR>
nmap <Leader>cp :let @+ = expand("%")<CR>
nmap <Leader>cl :let @+ = expand("%") . ":" . line(".")<CR>
nmap <Leader>sp :let @+ = "spec " . expand("%")<CR>
nmap <Leader>rb :let @+ = "rubocop -A " . expand("%")<CR>
nmap <Leader>sl :let @+ = "spec " . expand("%") . ":" . line(".")<CR>
nmap <Leader>vl :let @+ = "vim +" . line(".") . " " . expand("%")<CR>
nnoremap <leader>ee :Exp<CR>
nnoremap <leader>rr :e!<CR>
nnoremap <leader>bp Obinding.pry<ESC>
nnoremap <leader>ss Orequire 'rails_helper'\r RSpec.describe Placeholder do\r end<ESC>
nnoremap <leader>nt <C-w><S-t>

" copy/paste buffer
map <leader>cc "+y
map <leader>cw "+yiw

" https://vi.stackexchange.com/questions/184/how-can-i-clear-word-highlighting-in-the-current-document-e-g-such-as-after-se
" https://stackoverflow.com/a/54938524
" nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
nnoremap <silent> <C-L> :set invhlsearch<CR><C-L>

" https://neovim.io/doc/user/map.html
" inoremap <expr> <C-I> nr2char(getchar())
" inoremap <expr> <C-I>c "console.log();"

" close quickfix
" nnoremap <leader><SPACE> :ccl<CR>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/usr/dict/words"

" https://stackoverflow.com/questions/63905992/open-fzf-vim-in-split-instead-of-floating-window
let g:fzf_layout = { 'down': '~40%' }
" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
let g:ackprg = 'ag --vimgrep'
nnoremap \ :Ack<SPACE><c-r>=expand("<cword>")<cr>
nnoremap <A-r> viw<Esc>:%s/\<<c-r>=expand("<cword>")<cr>\>//g<left><left>
nnoremap ^[r viw<Esc>:%s/\<<c-r>=expand("<cword>")<cr>\>//g<left><left>

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" https://github.com/neoclide/coc-solargraph
" Use command :CocConfig to open config file.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" let g:coc_node_path = '/usr/local/Cellar/node/16.6.0/bin/node'
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent> <space>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>cb  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>

" indents
" https://stackoverflow.com/questions/1229900/reformat-in-vim-for-a-nice-column-layout
" :%!column -t
