set nocompatible              " be iMproved, required
set encoding=utf8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


"Plugin ‘GITHUB_REPO_USER/GITHUB_REPO_PROJECT_NAME’

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" ----------- PLUGINS ----------------
" Utility

Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-Commenter'

" Generic programming support
Plugin 'Townk/vim-autoclose'

" Theme / Interface
Plugin 'lifepillar/vim-solarized8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" HTML5
" for html5 support
Plugin 'othree/html5.vim'

" Java 
Plugin 'artur-shaik/vim-javacomplete2'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'
" ----------- END PLUGINS ------------

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

" reset to vim-defaults
"if &compatible          " only if not set before:
"  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
"endif


" ------------------ DISPLAY SETTINGS -----------------------
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html

" show linenumbers
set number              " show line numbers
set ruler               " show cursor position in status bar

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark     " enable for dark terminals
let base16colorspace=256  " Access colors present in 256 colorspace
"let g:solarized_use16 = 0
colorscheme solarized8_high

" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
    syntax on          " enable colors
    set hlsearch       " highlight search (very useful!)
    set incsearch      " search incremently (search while typing)
endif

" Vim-airline configuration
let g:airline#extensions#tabline#enabled = 1 " list of buffers on top
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline_powerline_fonts = 1

" ------------------- EDITOR SETTINGS ----------------------
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode

" set proper tabs
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set smarttab            " smart tab handling for indenting
set expandtab           " turn a tabs into spaces

set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode


" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

set clipboard=unnamedplus 


" ----------------------- MAPPINGS ----------------------------
let mapleader = "<"
let maplocalleader = ","
" source .vimrc config file
nnoremap <leader>sv :source $MYVIMRC<cr>
" open .vimrc in vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" make upper case in insert/normal "mode"
inoremap <leader>u <esc>bveUea
nnoremap <leader>u bveUel

" surround word in double quotes
nnoremap <leader>" ea"<esc>bi"<esc>lel
" surround visual selection in double quotes
vnoremap <leader>" <esc>'<i"<esc>'>A"<esc>

" buffer mappings
nnoremap <leader>n :enew<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>k :bd <BAR> bd #<CR>
nnoremap <leader>l :ls<CR>


" ---------------------- ABBREVATIONS ----------------------------
let g:AutoCloseExpandSpace = 0 " Make iabbrev work again
inoreabbrev mymail    veit.karpf@gmail.com
inoreabbrev ccopy Copyright 2018 Veit Karpf, all rights reserved.
inoreabbrev ssig -- <cr>Veit Karpf<cr>veit.karpf@gmail.com


" ---------------------- AUTOCOMMANDS ----------------------------
" example events: BufNewFile, BufWritePre, BufRead, FileType
"
" Use of the filetype plugins, auto completion and indentation support
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
"hi clear SpellBad
"hi SpellBad cterm=underline


augroup mysettings
    autocmd!
    autocmd FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
    " add comments quickly
    autocmd FileType javascript,java,c,cpp nnoremap <buffer> <localleader>c I//<esc>
    " Always jump to the last known cursor position. 
    " Don't do it when the position is invalid or when inside
    " an event handler (happens when dropping a file on gvim). 
    autocmd BufReadPost * 
                \ if line("'\"") > 0 && line("'\"") <= line("$") | 
                \   exe "normal g`\"" | 
                \ endif 
    " change to directory of current file automatically
    autocmd BufEnter * lcd %:p:h
augroup END


" Markdown Syntax Support
augroup markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" word ompletion: <c-n>, <c-p>
" add word to dict: zg
augroup latex
    autocmd!
    autocmd FileType tex setlocal wrap shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType tex setlocal spell spelllang=en_us,en_gb,de_ch
    autocmd FileType tes setlocal complete+=kspell
    autocmd FileType tex setlocal updatetime=1
    let g:livepreview_preview = 'okular'
augroup END


augroup java
    autocmd!
    autocmd FileType java iabbrev ff public static void main () {<cr><cr>}
augroup END


augroup python
    autocmd!
    " Confirm to PEP8
    autocmd FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END


augroup perl
    autocmd!  
    autocmd BufReadPre,BufNewFile
                \ *.pl,*.pm
                \ set formatoptions=croq smartindent shiftwidth=2 softtabstop=2 cindent cinkeys='0{,0},!^F,o,O,e' " tags=./tags,tags,~/devel/tags,~/devel/C
    " formatoption:
    "   t - wrap text using textwidth
    "   c - wrap comments using textwidth (and auto insert comment leader)
    "   r - auto insert comment leader when pressing <return> in insert mode
    "   o - auto insert comment leader when pressing 'o' or 'O'.
    "   q - allow formatting of comments with "gq"
    "   a - auto formatting for paragraphs
    "   n - auto wrap numbered lists
augroup END


"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p


