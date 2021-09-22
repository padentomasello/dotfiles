if filereadable($LOCAL_ADMIN_SCRIPTS . "/master.vimrc")
  source $LOCAL_ADMIN_SCRIPTS/master.vimrc
  source $LOCAL_ADMIN_SCRIPTS/vim/biggrep.vim
elseif filereadable($ADMIN_SCRIPTS)
  source $ADMIN_SCRIPTS/master.vimrc
  source $ADMIN_SCRIPTS/vim/biggrep.vim
endif
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
Plug 'morhetz/gruvbox'

" File Finder
Plug 'ctrlpvim/ctrlp.vim'
set rtp+=/usr/local/share/myc/vim
Plug 'tpope/vim-dispatch'
Plug 'majutsushi/tagbar'

" Python folding
"Plug 'tmhedberg/SimpylFold'

Plug 'Lokaltog/vim-easymotion'


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Autocomplete
"" """"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'valloric/youcompleteme'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

if &t_Co > 256
    set termguicolors
 else
     set notermguicolors
 endif

filetype plugin indent on                   " required!
call plug#end()


"set mouse=a
"syntax on
"syntax enable
"set ruler
"set ls=2 " Show status line even with only one window is show
"set bs=2
set expandtab " Inset space characters for tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set showbreak=↪  " Line wrap
"set foldmethod=syntax
"set foldnestmax=3
"set lazyredraw
set relativenumber
set number
set wildmenu
"set scrolloff=5
"set sidescrolloff=5
"set autoread
"set clipboard=unnamed,unnamedplus
"set clipboard=unnamedplus
"let g:gruvbox_termcolors=16
colorscheme gruvbox

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
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


"" Take this off
""let g:hardtime_default_on = 1


"specific filetype
au BufRead,BufNewFile *.cl setfiletype c

set background=dark
let g:airline_theme='gruvbox'
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>s :TagbarShowTag<CR>
"compiler buck


map <Leader>m :SignatureToggle<CR>


"let g:Gitv_TruncateCommitSubjects = 0
"let g:Gitv_OpenHorizontal = 1
"nmap <leader>gv :Gitv <cr>
"nmap <leader>gV :Gitv! --all<cr>
"vmap <leader>gV :Gitv! --all<cr>
""set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


"nnoremap <Leader>gs :Gstatus<CR>
"nnoremap <Leader>gd :Gdiff<CR>
"nnoremap <Leader>gb :Gblame<CR>
"nnoremap <Leader>gL :exe ':!cd ' . expand('%:p:h') . '; git la'<CR>
"nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git las'<CR>
"nnoremap <Leader>gl2 :exe ':!cd ' . expand('%:p:h') . '; git lg'<CR>
"nnoremap <Leader>gh :Glog<CR>
"nnoremap <Leader>gH :Glog<CR>:set nofoldenable<CR>
"nnoremap <Leader>gr :Gread<CR>
"nnoremap <Leader>gw :Gwrite<CR>
"nnoremap <Leader>gp :Git push<CR>

"command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
"nnoremap <Leader>g- :Silent Git stash<CR>
"nnoremap <Leader>g+ :Silent Git stash pop<CR>

"let g:ycm_autoclose_preview_window_after_completion = 1


"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
"set wildignore+=*/nodemodule/*,.*git
" Setup some default ignores
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](\.(git)|\_site|\/var)$',
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}


"" Use the nearest .git directory as the cwd
"" This makes a lot of sense if you are working on a project that is in version
"" control. It also supports works with .svn, .hg, .bzr.
"let g:ctrlp_working_path_mode = 'r'

"let g:ctrlp_open_multiple_files = 'ij'

"" Use a leader instead of the actual named binding
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f'
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

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
