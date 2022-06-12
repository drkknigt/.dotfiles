set nocompatible " vi compatible mode off
colorscheme industry
set wrap " longer lines will wrap
set ruler "  Show the line and column number of the cursor 
syntax on " show and highlight text in specific colors
set rnu " enable relative numbers
set showcmd " show current mode of vim in cursorline
set hidden " seamlessly move across the buffers without saving the buffers
set smd " show current mode of vim in cursorline
set wildmenu " command line completion menu in enhanced mode
set noerrorbells " dont ring beep sound on errors
set tabstop=4 " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4 " Number of spaces that a <Tab> counts for while performing editing
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent.
set expandtab " expand all the tabs to spaces in the file
set smartindent " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set ai " Copy indent from current line when starting a new  line
set titlestring=%t " used for the title of the window
set encoding=UTF-8 " default encoding of the text content 
set nu " set number line for the lines
set linebreak " If on, Vim will wrap long lines at a character in 'breakat'
set matchpairs+=<:> " characters that form the pairs. % jumps from one to another
filetype plugin indent on " enable filetype plugin and indent 
set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters.
set guicursor+=a:blinkon0 " This option tells vim how the cursor should look like in the different modes
set noswapfile " disable the swapfile 
set nobackup " disable the backup file
set undodir=$HOME/textedit/vim/undodir " set the undo directory
set undofile " enable the undo file for the persistent undoes
set nrformats+=alpha " This defines what bases Vim will consider for numbers when using the CTRL-A and CTRL-X
set numberwidth=4 " Minimal number of columns to use for the line number.
set splitright " When on, splitting a window will put the new window right of the current one
set splitbelow " When on, splitting a window will put the new window below the current one
set history=1000 " amount of commands saved in the history 
" remap Esc to jk
inoremap jk <Esc> 
" remap Esc to kj
inoremap kj <Esc>
set colorcolumn=100 " set distance of the colorcolumn
set background=dark " set the dark background
set nohlsearch " dont hightlight searched words
set lazyredraw " When this option is set, the screen will not be redrawn while
set ttyfast " indicates fast terminal connection
set ignorecase " while searching ignore case
set shell=/bin/zsh " default shell for external cmds
set laststatus=2 " display statusline always
set statusline=%F%m%r%h%w=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c) " what to display on statusline
set is " incremental search
set scrolloff=5 " Minimal number of screen lines to keep above and below the cursor
set wildmode=longest,list,full " wildmenu options
"set highlight options
hi Normal ctermfg=yellow " highlight color 
hi Pmenu ctermbg=NONE ctermfg=white
hi PmenuSel ctermfg=yellow
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE  guibg=NONE cterm=NONE
"quit all
nnoremap ZQ :qall!<CR>
" line object
xnoremap il g_o^ 
onoremap il :normal vil<CR>
xnoremap al $o^
onoremap al :normal val<CR>
"enable matchit
packadd! matchit
"abbrevaition
abbreviate py! #!/usr/bin/env python3 
set history=1000 " set history items to 1000
set shortmess-=S " show current searched number
set autochdir " autochange directory
set autoshelldir " change current working directory for terminal
set autoread " auto read changed file
set completeopt=menu,menuone,preview,popup " completion menu options
set magic " Enable extended regexes.
set title " set title of window with file name


