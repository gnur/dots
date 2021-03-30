if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'simnalamburt/vim-mundo'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdTree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'zivyangll/git-blame.vim'
Plug 'dag/vim-fish'
Plug 'jkramer/vim-checkbox'
Plug '907th/vim-auto-save'


Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For async completion
call plug#end()


let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

set guifont="Cascadia Code PL"
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
nmap <silent> gd <Plug>(coc-definition)

"wiki stuff
filetype plugin on
syntax on

set ttimeout
set ttimeoutlen=0

let g:mapleader = "\<Space>"

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :buffers<CR>:buffer<Space>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>q :bdel<CR>
nnoremap <silent> <leader>u :MundoToggle<CR>
nnoremap <silent> <leader>d o<esc>:put =strftime('%FT%T')<CR>o---<esc>O
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next-error)

" theme
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

set termguicolors
colorscheme nightfly

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" tabs
set tabstop=2 shiftwidth=2 expandtab

" persistent undo stuffs
set undofile
set undodir=~/.vim/undo-dir

set scrolloff=5

" .vimrc
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:coc_disable_startup_warning = 1

if &term =~ '^xterm'
  " enter vim
  autocmd VimEnter * silent !echo -ne "\e[2 q"
  " oherwise
  let &t_EI .= "\<Esc>[2 q"
  " insert mode
  let &t_SI .= "\<Esc>[5 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  " leave vim
  autocmd VimLeave * silent !echo -ne "\e[5 q"
endif
