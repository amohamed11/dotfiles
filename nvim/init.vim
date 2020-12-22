" ~~~ Plugins ~~~
call plug#begin('~/.local/share/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'dkarter/bullets.vim'
Plug 'metakirby5/codi.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'tell-k/vim-autopep8'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-sneak'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'

" Themes
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'Brettm12345/moonlight.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'kyoz/purify', { 'rtp': 'vim' }

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" AutoCompletion
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fatih/vim-go'

call plug#end()

" ~~~ Plugin Config files ~~~
source $HOME/.config/nvim/plugin-configs/fzf.vim

" Sneak
let g:sneak#label = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" LanguageClient
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ 'cpp': ['clangd'],
      \ }
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" Vim-devicons
let g:airline_powerline_fonts = 1

" NERDTree commands
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Tabs commands
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Hotkeys 
nnoremap <SPACE> :Files<CR>

" Highlight the line on which the cursor lives.
set nocursorline

" Always show at least one line above/below the cursor.
set scrolloff=1
" Always show at least one line left/right of the cursor.
set sidescrolloff=5

" Relative line numbers
set number relativenumber

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Use system clipboard
set clipboard=unnamedplus

" Remove timeout for partially typed commands
set notimeout

" F keys
" Quick write session with F2
map <F2> :mksession! ~/.vim_session<cr>
" And load session with F3
map <F3> :source ~/.vim_session<cr>

" Fix indentation
map <F7> gg=G<C-o><C-o>
" Toggle auto change directory
map <F8> :set autochdir! autochdir?<CR>

" Toggle vertical line
set colorcolumn=
fun! ToggleCC()
  if &cc == ''
    " set cc=1,4,21
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <silent> <F9> :call ToggleCC()<CR>

" Beginning and end of line
imap <C-a> <home>
imap <C-e> <end>
cmap <C-a> <home>
cmap <C-e> <end>

" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>
" Save + back into insert
" imap <C-S> <esc>:w<cr>a

" Control-C Copy in visual mode
vmap <C-C> y

" Control-V Paste in insert and command mode
imap <C-V> <esc>pa
cmap <C-V> <C-r>0

" Window Movement
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l

" Resizing
nmap <C-M-H> 2<C-w><
nmap <C-M-L> 2<C-w>>
nmap <C-M-K> <C-w>-
nmap <C-M-J> <C-w>+

" Insert mode movement
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
imap <M-f> <C-right>
imap <M-b> <C-left>

" Spacemacs-like keybinds
" Change <leader> bind from default \
" nnoremap <space> <nop>
" let mapleader=" "

" Make ci( work like quotes do
function! New_cib()
    if search("(","bn") == line(".")
        sil exe "normal! f)ci("
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f(ci("
        sil exe "normal! l"
        startinsert
    endif
endfunction

" And for curly brackets
function! New_ciB()
    if search("{","bn") == line(".")
        sil exe "normal! f}ci{"
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f{ci{"
        sil exe "normal! l"
        startinsert
    endif
endfunction

nnoremap ci( :call New_cib()<CR>
nnoremap cib :call New_cib()<CR>
nnoremap ci{ :call New_ciB()<CR>
nnoremap ciB :call New_ciB()<CR>

" Alt-m for creating a new line in insert mode
imap <M-m> <esc>o

" netrw configuration
let g:netrw_browse_split = 0
let g:netrw_altfile = 1

" Cycle windows
nmap <M-o> <C-W>w
vmap <M-o> <C-W>w
tmap <M-o> <esc><C-W>w
imap <M-o> <esc><C-W>w

" Command mode history
cmap <M-p> <up>
cmap <M-n> <down>
cmap <M-k> <up>
cmap <M-j> <down>

" Back to normal mode from insert
" inoremap jk <esc>
" inoremap JK <esc>

" Manually refresh file
nmap <F5> :e!<cr>

" Indentation
set smarttab
set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2

"set smartindent
set autoindent
"set cindent

set nocompatible
filetype plugin indent on

" Write buffer through sudo (works on vim but not neovim)
" cnoreabbrev w!! w !sudo -S tee % >/dev/null
" Neovim: suda plugin
cnoreabbrev w!! w suda://%

" Allow switching between buffers without saving
set hidden

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Substitute live preview
set inccommand=nosplit

" Markdown Folding
let g:markdown_fold_style = 'nested'

" Vimwiki
" let g:vimwiki_list = [{'path': '~/dox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings=0
let g:vimwiki_folding='expr'
nmap <leader>vv <Plug>VimwikiIndex
nmap <leader>vV <Plug>VimwikiTabIndex
nmap <leader>vs <Plug>VimwikiUISelect
nmap <leader>vi <Plug>VimwikiDiaryIndex
nmap <leader>vdd <Plug>VimwikiMakeDiaryNote
nmap <leader>vDD <Plug>VimwikiTabMakeDiaryNote
nmap <leader>vdy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>vdt <Plug>VimwikiMakeTomorrowDiaryNote
nmap <M-space> <Plug>VimwikiToggleListItem

" Highlighted yank (-1 for persistent)
let g:highlightedyank_highlight_duration = 400

" If lightline/airline is enabled, don't show mode under it
set noshowmode

" Shell
set shell=/bin/zsh

" Ctrlp
let g:ctrlp_switch_buffer = '0'
" Useful for large projects
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10
" So that it does not only index starting from current directory
let g:ctrlp_working_path_mode = ""
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Use ag AKA the_silver_searcher for indexing. Faster!!!
" TIP: Use ~/.ignore to ignore directories/files
" set grepprg=ag\ --nogroup\ --nocolor
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
""if executable('ag')
""  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
""endif
let g:ctrlp_show_hidden =1
let g:ctrlp_clear_cache_on_exit = 0


" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

set wildmenu

set encoding=utf8
scriptencoding utf-8

" Colorscheme
set fillchars=vert::
set background=dark
set termguicolors
colorscheme purify
let g:deepspace_italics=1

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif
