" Use vim settings, rather than vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    " do not keep a backup file, use versions instead
    set nobackup
else
    " keep a backup file
    set backup
endif

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" do incremental searching
set incsearch

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif

    augroup END
else
    set autoindent  " always set autoindenting on
endif

" Adds line numbers on the left margin.
set number

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Use the appropriate number of spaces to insert a <Tab>.  Spaces are used
" in indents with the '>' and '<' commands and when 'autoindent' is on.
" To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth'
" worth of space at the start of the line.
set smarttab

" Makes backspace work sensibly
set backspace=indent,eol,start

" Makes h, l keys wrap around lines, as they should
set whichwrap+=<,>,h,l

" Show (partial) command in status line.
set showcmd

" Show the matching braces when highlighted by the cursor
set showmatch

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" While typing a search command, show immediately where the so far typed
" pattern matches.
set incsearch

" Ignore case in search patterns.
set ignorecase      

" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase       

" Copy indent from current line when starting a new line (typing <CR> in Insert
"" mode or when using the "o" or "O" command).
set autoindent

" Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width.
set textwidth=79


" This sequence of letters describes how automatic formatting is done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting
"           the current comment leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"           after hitting <Enter> in Insert mode. 
" t         Auto-wrap text using textwidth (does not apply
"           to comments)
set formatoptions=c,q,r,t

" Show the line + column number of the cursor position, separated by a comma.
set ruler

" When set to "dark", Vim will try to use colors that look good on a dark
" background. When set to "light", Vim will try to use colors that look
" good on a light background. Any other value is illegal.
" possibilities: Mustang, astronaut, darkburn, desert256, gentooish?
" herald, jellybeans
set background=dark
colorscheme jellybeans

" Add a vertical column at line 80
set colorcolumn=80 

" Let vim display unicode reasonably.
set encoding=utf-8
set fileencoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra, convenient key combinations
let mapleader = ","
let g:mapleader = ","

" Treat long lines as break lines (useful when moving)
map j gj 
map k gk

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" For convenience, switch the ; and : keys
noremap ; :
noremap : ;




" Sources
" Lots of this file came from http://amix.dk/vim/vimrc.html
" as well as https://github.com/W4RH4WK/dotVim/blob/master/vimrc
" and the system-wide arch defaults, at /usr/share/vim/vimfiles/archlinux.vim