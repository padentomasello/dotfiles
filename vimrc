"set mouse=a
syntax on
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
filetype off                  " required

set relativenumber
set number


"specific filetype
au BufRead,BufNewFile *.cl setfiletype c

set t_Co=256
set background=dark

set nocompatible
let mapleader=','
command! W :w

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""
" Easy motion
"""""""""""""""""""""""""""""""""""""""
Bundle 'Lokaltog/vim-easymotion'


""""""""""""""""""""""""""""""""""""""""""""
" Marks
"""""""""""""""""""""""""""""""""""""""""
Bundle 'kshenoy/vim-signature'
map <Leader>m :SignatureToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
" """"""""""""""""""""""""""""""""""""""""""""""""""""
"Bundle 'Valloric/YouCompleteMe'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'pangloss/vim-javascript'

let g:javascript_conceal = 0

hi Conceal ctermfg=Yellow ctermbg=black
set conceallevel=0


let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
"
"
"Other syntax 
"Bundle 'jelera/vim-javascript-syntax'
"au FileType javascript call JavaScriptFold() 

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdcommenter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Status Bars
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" better status bar
Plugin 'bling/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1 "show splits and tab number
let g:airline#extensions#tabline#buffer_nr_show = 0

"
" " Show just the filename
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#bufferline#overwrite_variables = 1

" statusline settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenCL Syntax
Bundle 'petRushka/vim-opencl'

" Syntax Checking
"Bundle 'scrooloose/syntastic'
let g:syntastic_javascript_jslint_args = "--nomen --bitwise --todo"
let g:syntastic_javascript_checkers = ['jslint']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" Buffer Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'kien/ctrlp.vim'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_open_multiple_files = 'ij'
let g:buffergator_autoupdate=1
let g:buffergator_mru_cycle_loop=1

" Use a leader instead of the actual named binding
nmap <leader>ff :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>fb :CtrlPBuffer<cr>
nmap <leader>fm :CtrlPMixed<cr>
nmap <leader>fr :CtrlPMRU<cr>

Bundle 'jeetsukumaran/vim-buffergator'
 "Use the right side of the screen
 let g:buffergator_viewport_split_policy = 'L'

 " I want my own keymappings...
 let g:buffergator_suppress_keymaps = 0

 " Looper buffers
 let g:buffergator_mru_cycle_loop = 1

 "" Go to the previous buffer open
 nmap <leader>jj :bn <cr>
 "" Go to the next buffer open
 nmap <leader>kk :bp <cr>

 "" View the entire list of buffers open
 "nmap <leader>bl :BuffergatorOpen<cr>

 " Shared bindings from Solution #1 from earlier
 "nmap <leader>T :enew<cr>
 "nmap <leader>bq :bp <BAR> bd #<cr>

 """""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'sjl/gundo.vim'
let g:gundo_preview_bottom=1
nmap <leader>g :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make vim play nicely with TMUX
"""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'christoomey/vim-tmux-navigator'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("+relativenumber")
  if v:version >= 400
    set number
  endif
  set relativenumber  " show relative line numbers
  set numberwidth=3   " narrow number column
  " cycles between relative / absolute / no numbering
  if v:version >= 400
    function! RelativeNumberToggle()
      if (&number == 1 && &relativenumber == 1)
        set nonumber
        set relativenumber relativenumber?
      elseif (&number == 0 && &relativenumber == 1)
        set norelativenumber
        set number number?
      elseif (&number == 1 && &relativenumber == 0)
        set norelativenumber
        set nonumber number?
      else
        set number
        set relativenumber relativenumber?
      endif
    endfunc
  else
    function! RelativeNumberToggle()
      if (&relativenumber == 1)
        set number number?
      elseif (&number == 1)
        set nonumber number?
      else
        set relativenumber relativenumber?
      endif
    endfunc
  endif
  nnoremap <silent> <leader>n :call RelativeNumberToggle()<CR>
else                  " fallback
  set number          " show line numbers
  " inverts numbering
  nnoremap <silent> <leader>n :set number! number?<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'flazz/vim-colorschemes'

if &diff
  colorscheme github
endif
"
" Nice folded
hi Folded ctermbg=234
hi Folded ctermfg=196

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""indent guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level=2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
" Show trailing whitespace:
"autocmd BufWinEnter * match OverLength /\%91v.\+/
"autocmd BufWinLeave * call clearmatches()
"
"
"""""""""""""""""""""""""""""""""""""""""""
" Back
" """""""""""""""""""""""""
"backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'ntpeters/vim-better-whitespace'
function! TrimWhiteSpace()
%s/\s\+$//e
endfunction

map <leader>w :ToggleWhitespace<ENTER>
map <leader>W :StripWhitespace<ENTER>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Long line highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guide
""""""""""""""""""""""""""""""""""""""""""""""
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=darkgrey
nnoremap <leader>I :call IndentGuides()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

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
