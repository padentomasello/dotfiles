set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" Buffer Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenCL Syntax
Plugin 'petRushka/vim-opencl'

" Syntax Checking
Plugin 'scrooloose/syntastic'

""""""""""""""""""""""""""""""""""""""""
" Easy motion
"""""""""""""""""""""""""""""""""""""""
Plugin 'Lokaltog/vim-easymotion'

""""""""""""""""""""""""""""""""""""""""""""
" Marks
"""""""""""""""""""""""""""""""""""""""""
Plugin 'kshenoy/vim-signature'
"""""""""""""""""""""""""""""""""""""""""
" Git
" """"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-conflicted'
Plugin 'gregsexton/gitv'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
" """"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'

"Plugin "marijnh/tern_for_vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"Plugin 'othree/yajs.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'xolox/vim-session'

Plugin 'xolox/vim-misc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
""""""""""" Some nice key mappings
""""""""""""""""""""""""""""""
Plugin 'tpope/vim-unimpaired.git'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'sjl/gundo.vim'
"
"""""""""""""""""""
" Mapping
"""""""""""""""""""""""
Plugin 'takac/vim-hardtime'

Plugin 'morhetz/gruvbox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ntpeters/vim-better-whitespace'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""indent guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required
filetype plugin indent on

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
"set foldmethod=syntax
"set foldnestmax=3
set lazyredraw


"" Take this off
""let g:hardtime_default_on = 1


"specific filetype
au BufRead,BufNewFile *.cl setfiletype c

let g:Gitv_TruncateCommitSubjects = 1




""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, remove the outermost $TMUX check.
""For Neovim 0.1.3 and 0.1.4
"if (has("nvim"))
    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    "set termguicolors
"endif

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors


let mapleader=','

map <Leader>m :SignatureToggle<CR>


"nmap <leader>gv :Gitv --all<cr> :unmap <buffer> o
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>


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
nnoremap <Leader>g- :Silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :Silent Git stash pop<CR>:e<CR>

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
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

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

""if &diff
  ""colorscheme github
""endif
""
"let g:indent_guides_start_level=2



set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=0
colorscheme gruvbox

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

function! TrimWhiteSpace()
%s/\s\+$//e
endfunction

map <leader>w :ToggleWhitespace<ENTER>
map <leader>W :StripWhitespace<ENTER>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Long line highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
autocmd BufEnter * 2match OverLength /\%102v.*/
autocmd BufEnter * let w:long_line_match = 1

fu! LongLineHighlightToggle()
        highlight OverLength ctermbg=darkgrey guibg=#592929
        if exists('w:long_line_match')
                2match OverLength //
                unlet w:long_line_match
        else
                2match OverLength /\%92v.*/
                let w:long_line_match = 1
        endif
endfunction

map <Leader>l :call LongLineHighlightToggle()<CR>

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
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w


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

noremap H ^
noremap L $
vnoremap L g_
nnoremap gI `.

