" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'freeo/vim-kalisi'
"Plug 'terryma/vim-multiple-cursors'


Plug 'AndrewRadev/splitjoin.vim'

" File Finder
Plug 'ctrlpvim/ctrlp.vim'

" OpenCL Syntax
Plug 'petRushka/vim-opencl'

" Python folding
Plug 'tmhedberg/SimpylFold'

Plug 'Lokaltog/vim-easymotion'

" Syntax Checking
"Plug 'scrooloose/syntastic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Nerd commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'

""""""""""""""""""""""""""""""""""""""""""
"" Git
"" """"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'gregsexton/gitv'
Plug 'junegunn/vim-github-dashboard'

let g:github_dashboard = {
\ 'username': 'padentomasello',
\ 'password': $GITHUB_TOKEN
\ }
""""""""""
""""""" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocomplete
"" """"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Sessions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'xolox/vim-session'

"Plug 'xolox/vim-misc'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""
""""""""""" Some nice key mappings
""""""""""""""""""""""""""""""
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sjl/gundo.vim'
"

"""""""""""""""""""""""""""""""""""""""""""""
"" Marks
""""""""""""""""""""""""""""""""""""""""""
Plug 'kshenoy/vim-signature'

set t_Co=256
" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

filetype plugin indent on                   " required!
call plug#end()

set mouse=a
syntax on
syntax enable
set ruler
set ls=2 " Show status line even with only one window is show
set bs=2
set number
set expandtab " Inset space characters for tab
set tabstop=4
set shiftwidth=4
set showbreak=↪  " Line wrap
set foldmethod=syntax
set foldnestmax=3
set lazyredraw
set relativenumber
set number
set wildmenu
set scrolloff=5
set sidescrolloff=5
set autoread

let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S',
\ }
let g:airline_powerline_fonts=0
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"" Take this off
""let g:hardtime_default_on = 1


"specific filetype
au BufRead,BufNewFile *.cl setfiletype c

colorscheme kalisi
set background=dark
let g:airline_theme='kalisi'


let mapleader=','

map <Leader>m :SignatureToggle<CR>


let g:Gitv_TruncateCommitSubjects = 0
let g:Gitv_OpenHorizontal = 1
nmap <leader>gv :Gitv <cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gL :exe ':!cd ' . expand('%:p:h') . '; git la'<CR>
nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git las'<CR>
nnoremap <Leader>gl2 :exe ':!cd ' . expand('%:p:h') . '; git lg'<CR>
nnoremap <Leader>gh :Glog<CR>
nnoremap <Leader>gH :Glog<CR>:set nofoldenable<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
nnoremap <Leader>g- :Silent Git stash<CR>
nnoremap <Leader>g+ :Silent Git stash pop<CR>

"let g:ycm_autoclose_preview_window_after_completion = 1

" Tern Shortcuts
nmap <silent> <Leader>td :TernDef<CR>
nmap <silent> <Leader>tr :TernRename<CR>
nmap <silent> <Leader>ts :TernRefs<CR>
nmap <silent> <Leader>tt :TernType<CR>
let g:tern_show_signature_in_pum = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Plugin 'mxw/vim-jsx'


"set foldmethod=syntax

""Other syntax
"au FileType javascript call JavaScriptFold()


map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
"set wildignore+=*/nodemodule/*,.*git
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|www'
" Setup some default ignores
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](\.(git)|\_site|\/var)$',
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}


"" Use the nearest .git directory as the cwd
"" This makes a lot of sense if you are working on a project that is in version
"" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

"let g:ctrlp_open_multiple_files = 'ij'

"" Use a leader instead of the actual named binding
nmap <leader>ff :CtrlP<cr>

"" Easy bindings for its various modes
nmap <leader>fb :CtrlPBuffer<cr>
nmap <leader>fm :CtrlPMixed<cr>
nmap <leader>fr :CtrlPMRU<cr>



"let g:gundo_preview_bottom=1
nmap <leader>u :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if &diff
  "colorscheme github
"endif
""
"let g:indent_guides_start_level=2
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
 "Show trailing whitespace:
"autocmd BufWinEnter * match OverLength /\%91v.\+/
"autocmd BufWinLeave * call clearmatches()
""
""
""""""""""""""""""""""""""""""""""""""""""""
"" Back
"" """""""""""""""""""""""""
""backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Make sure Vim returns to the same line when you reopen a file.
"" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\     execute 'normal! g`"zvzz' |
	\ endif
augroup END

"" Split line (sister to [J]oin lines)
"" The normal use of S is covered by cc, so don't worry about shadowing it.
"nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w


"noremap <leader><leader>vimrc :tabe $MYVIMRC<cr>
"autocmd bufwritepost .vimrc source $MYVIMRC

"Quick exit "
inoremap jk <esc>
" Training "
inoremap <esc> <nop>

"set pastetoggle=<leader>p

nnoremap Q @q
vnoremap Q :norm @q<cr>

"" Create new files in same directory
noremap <leader>ne :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>nt :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>ns :split <C-R>=expand("%:p:h") . "/" <CR>

noremap <leader>q :q<cr>

nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
