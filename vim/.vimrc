set nocompatible " vi compatible mode off
colorscheme slate
set wrap " longer lines will wrap
set clipboard=unnamedplus
set dictionary=/usr/share/dict/words " set words for ins-completion in dictionary mode
set thesaurus=/usr/share/dict/words  " set words for ins-completion in thesaurus mode
set ruler "  Show the line and column number of the cursor 
set cursorline " set the cursorline to identify where the cursor is
syntax on " show and highlight text in specific colors
set rnu " enable relative numbers
set showcmd " Show (partial) command in the last line of the screen
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
set undodir=$HOME/.textedit/vim/undodir " set the undo directory
set undofile " enable the undo file for the persistent undoes
set nrformats+=alpha " This defines what bases Vim will consider for numbers when using the CTRL-A and CTRL-X
set numberwidth=4 " Minimal number of columns to use for the line number.
set splitright " When on, splitting a window will put the new window right of the current one
set splitbelow " When on, splitting a window will put the new window below the current one
set history=1000 " amount of commands saved in the history 
set colorcolumn=100 " set distance of the colorcolumn
set background=dark " set the dark background
set nohlsearch " dont hightlight searched words
set lazyredraw " When this option is set, the screen will not be redrawn while
set ttyfast " indicates fast terminal connection
set ignorecase " while searching ignore case
set shell=/bin/zsh " default shell for external cmds
set laststatus=2 " display statusline always
set statusline=%F%m%r%h%w=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)  " what to display on statusline
set is " incremental search
set scrolloff=5 " Minimal number of screen lines to keep above and below the cursor
" set wildmode=longest,list,full " wildmenu options
"set highlight options
"hi Normal ctermfg=yellow " highlight color 
hi Pmenu ctermbg=NONE ctermfg=white
hi PmenuSel ctermfg=yellow
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE  guibg=NONE cterm=NONE
highlight CursorLine ctermfg=NONE ctermbg=5 guifg=NONE guibg=NONE  guibg=NONE cterm=NONE
hi ColorColumn ctermbg=yellow
"quit all
"enable matchit
packadd! matchit
"abbrevaition
abbreviate py! #!/usr/bin/env python3 
set shortmess-=S " show current searched items with  number of items found
set autochdir " autochange directory
set autoshelldir " change current working directory for terminal
set autoread " auto read changed file
set completeopt=menu,menuone,preview,popup " A comma-separated list of options for Insert mode completion
set magic " Enable extended regexes.
set title " set title of window with file name
set wildoptions=pum "layout of the wildmenu
set cpoptions+=>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set fo-=o fo-=r fo-=c
" remap Esc to jk
" leader key
hi Normal ctermbg=None
hi CursorLine ctermbg=Black
let mapleader =" "
inoremap jk <Esc> 
" remap Esc to kj
inoremap kj <Esc>
nnoremap <silent> <leader>e :30Lex<CR>
nnoremap <leader>z :e $MYVIMRC<CR>
nnoremap ZQ :qall!<CR>
" line object
xnoremap il g_o^ 
onoremap il :normal vil<CR>
xnoremap al $o^
onoremap al :normal val<CR>

augroup yank_restore_cursor
    autocmd!
    autocmd VimEnter,CursorMoved *
        \ let s:cursor = getpos('.')
    autocmd TextYankPost *
        \ if v:event.operator ==? 'y' |
            \ call setpos('.', s:cursor) |
        \ endif
augroup END

autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview

" wayland-clipboard.vim - Integrate with Wayland's clipboard when using the '+'
" register. Requires wl-clipboard and the +eval and +clipboard Vim features.
"
" This code was inspired by
" https://www.reddit.com/r/Fedora/comments/ax9p9t/vim_and_system_clipboard_under_wayland/
" but uses an autocmd to allow yanking with operators to work.
" the code is from https://github.com/jasonccox/vim-wayland-clipboard

" Early exit checks {{{

" only load this script once
if exists('g:loaded_wayland_clipboard')
    finish
endif
let g:loaded_wayland_clipboard = 1

" only run this in Vim on Wayland -- Vim on X has native clipboard support,
" and Neovim already works with wl-copy by default
if has('nvim') || empty($WAYLAND_DISPLAY)
    finish
endif

" }}}

" Yanking {{{

" On Vim builds without 'clipboard', the '+' register doesn't work for
" yanking. My solution is to map '"+' to '"w' and send the 'w' register to the
" Wayland clipboard as well.
"
" This variable controls whether '"+' gets mapped to '"w'. It's on by default
" if the 'clipboard' feature isn't available, but the user can turn it off
" always if desired.
let s:plus_to_w = !has('clipboard') && !exists('g:wayland_clipboard_no_plus_to_w')

" remap '"+' to '"w' -- this will only apply to yanking since '"+p' and '"+P'
" are also remapped below
if s:plus_to_w
    nnoremap "+ "w
    vnoremap "+ "w
endif

let s:copy_args = exists('g:wayland_clipboard_copy_args') ? g:wayland_clipboard_copy_args : []

" pass register contents to wl-copy if the '+' (or 'w') register was used
function! s:WaylandYank()
    if v:event['regname'] == '+' ||
                \ (v:event['regname'] == 'w' && s:plus_to_w) ||
                \ (v:event['regname'] == '' && &clipboard =~ 'unnamedplus')
        silent call job_start(['wl-copy'] + s:copy_args + ['--', getreg(v:event['regname'])], {
            \   "in_io": "null", "out_io": "null", "err_io": "null",
            \   "stoponexit": "",
            \ })
    endif
endfunction

" run s:WaylandYank() after every time text is yanked
augroup waylandyank
    autocmd!
    autocmd TextYankPost * call s:WaylandYank()
augroup END

" }}}

" Pasting {{{

" remap paste commands to first pull in clipboard contents with wl-paste

let s:paste_args = exists('g:wayland_clipboard_paste_args') ? g:wayland_clipboard_paste_args : []
let s:paste_args_str = empty(s:paste_args) ? '' : ' ' . join(s:paste_args)

function! s:clipboard_to_unnamed()
    silent let @"=substitute(system('wl-paste --no-newline' . s:paste_args_str), "\r", '', 'g')
endfunction

function! s:put(p, fallback)
    if a:fallback
        return a:p
    endif

    call s:clipboard_to_unnamed()
    return '""' . a:p
endfunction

function! s:ctrl_r(cr)
    call s:clipboard_to_unnamed()
    return a:cr . '"'
endfunction

nnoremap <expr> <silent> "+p <SID>put('p', v:false)
nnoremap <expr> <silent> "+P <SID>put('P', v:false)
nnoremap <expr> <silent> p <SID>put('p', &clipboard !~ 'unnamedplus')
nnoremap <expr> <silent> P <SID>put('P', &clipboard !~ 'unnamedplus')

vnoremap <expr> <silent> "+p <SID>put('p', v:false)
vnoremap <expr> <silent> "+P <SID>put('P', v:false)
vnoremap <expr> <silent> p <SID>put('p', &clipboard !~ 'unnamedplus')
vnoremap <expr> <silent> P <SID>put('P', &clipboard !~ 'unnamedplus')

inoremap <expr> <silent> <C-R>+ <SID>ctrl_r("\<C-R>")
inoremap <expr> <silent> <C-R><C-R>+ <SID>ctrl_r("\<C-R>\<C-R>")
inoremap <expr> <silent> <C-R><C-O>+ <SID>ctrl_r("\<C-R>\<C-O>")
inoremap <expr> <silent> <C-R><C-P>+ <SID>ctrl_r("\<C-R>\<C-P>")

" }}}

" vim:foldmethod=marker:foldlevel=0
