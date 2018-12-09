let mapleader = "<"
let maplocalleader = ","

"Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Utility
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim' "distraction free writing
Plug 'junegunn/limelight.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'mboughaba/i3config.vim' "i3 config syntax support

" --- Generic programming support ---
Plug 'Townk/vim-autoclose'
Plug 'KabbAmine/zeavim.vim' "access zeal (offline docs browser) from within vim

" Theme / Interface
Plug 'lifepillar/vim-solarized8' " provides theme 'solarized8_high'
Plug 'dracula/vim' " provides theme 'dracula'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- Markdown ---
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" --- Latex ---
Plug 'xuhdev/vim-latex-live-preview' " A Vim Plugin for Lively Previewing LaTeX PDF Output

Plug 'dylanaraps/wal.vim' " python wal

" ----------- END PLUGINS ------------
call plug#end()

" BASIC SETTINGS
set nocompatible              " be iMproved, required
set encoding=utf-8
syntax on
filetype plugin on


" DISPLAY SETTINGS
set nowrap              " dont wrap lines
set scrolloff=5         " 2 lines above/below cursor when scrolling
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
set relativenumber
set ruler               " show cursor position in status bar

" Enable highlighting of the current line
set cursorline

" Theme and Styling
set t_Co=256
set background=dark     " enable for dark terminals
let base16colorspace=256  " Access colors present in 256 colorspace
"let g:solarized_use16 = 0

"colorscheme dracula
colorscheme solarized8_high
"colorscheme wal

" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
    syntax on          " enable colors
    set hlsearch       " highlight search (very useful!)
    set incsearch      " search incremently (search while typing)
endif

" GOYO
map <leader>f :Goyo<CR>
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" SPELL CHECK ('o' for 'orthography'), set all, set german, set english
map <leader>oa :setlocal spell! spelllang=en_us,en_gb,de_ch<CR>
map <leader>od :setlocal spell! spelllang=de_ch<CR>
map <leader>oe :setlocal spell! spelllang=en_us,en_gb<CR>

" VIM SPLIT
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Vim-airline configuration
let g:airline#extensions#tabline#enabled = 1 " list of buffers on top
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme= 'wombat'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline_powerline_fonts = 1

" ------------------- EDITOR SETTINGS ----------------------
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set magic               " change the way backslashes are used in search patterns
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

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
" source .vimrc config file
nnoremap <leader>sv :source<space>$MYVIMRC<CR>
" open .vimrc in vertical split window
nnoremap <leader>ev :vsplit<space>$MYVIMRC<CR>

" make upper case in insert/normal mode
inoremap <leader>u <esc>bveUea
nnoremap <leader>u bveUel

" surround word in double quotes
nnoremap <leader>" ea"<esc>bi"<esc>lel
" surround visual selection in double quotes
vnoremap <leader>" <esc>'<i"<esc>'>A"<esc>

" surround word in double asterix
nnoremap <leader>2* ea**<esc>bbi**<esc>lel
" surround visual selection in double asterix
vnoremap <leader>2* <esc>'<i**<esc>'>A**<esc>

" surround word in single asterix
nnoremap <leader>* ea*<esc>bi*<esc>lel
" surround visual selection in single asterix
vnoremap <leader>* <esc>'<i*<esc>'>A*<esc>

" buffer mappings
nnoremap <leader>n :enew<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>k :bd <BAR> bd #<CR>
nnoremap <leader>l :ls<CR>

" avoid using U
nnoremap U :echo "ARE YOU SERIOUS? I THINK YOU JUST MEANT C-r?"<CR>


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

" DISABLE AUTOMATIC COMMENTING ON NEWLINE
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" AUTOMATICALLY DELETE ALL TRAILING WHITESPACE ON SAVE
autocmd BufWritePre * %s/\s\+$//e

" AUTOMATICALLY UPDATE Xresources/Xdefaults
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

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
    autocmd BufRead,BufNewFile *.md,*.markdown setfiletype markdown
    autocmd FileType markdown setlocal spell spelllang=en_us,en_gb,de_ch
    autocmd FileType markdown :call <SID>MDSettings()

"-- pandoc Markdown+LaTeX -------------------------------------------
function! s:MDSettings()
    inoremap <buffer> <leader>n \note[item]{}<Esc>i
    nnoremap <buffer> <leader>b :! pandoc -t beamer % -o %<.pdf<CR><CR>
    nnoremap <buffer> <leader>c :! pandoc -t latex % -o %<.pdf<CR>
    nnoremap <buffer> <leader>s :! zathura %<.pdf 2>&1 >/dev/null &<CR><CR>

    " adjust syntax highlighting for LaTeX parts
    "   inline formulas:
    syntax region Statement oneline matchgroup=Delimiter start="\$" end="\$"
    "   environments:
    syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
    "   commands:
    syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
endfunction

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
