local set = vim.opt -- api to interact with vim options
local macro = vim.fn -- Invokes |vim-function| or |user-function| {func} with arguments {...}.
local cmd = vim.cmd -- execute vim commands
local undo_dir = vim.fn.expand("~") .. "/.textedit/nvim/undodir"

set.compatible = false -- disable vi-mode and enable vim-mode

macro.setreg("p", "yyp^v$r") -- macro in p register to underline a line with specific character

set.nu = true -- set line numbers in every file

set.rnu = true -- set relative line numbers in every file

set.clipboard = { "unnamed", "unnamedplus" } --  Vim will use the clipboard reg '*' for all yank, delete, change and put operations and always use '*' instead of '+' reg

-- set.path = set.path + "~/.config/nvim/**" -- list of directories searched with gf,find,sfind,tabfind cmds

set.shiftround = true -- roune the surrounding indent of shiftwidth

set.exrc = true -- enable the reading of .vimrc init.vim and .gvimrc in current directory

set.linebreak = true -- setlinebreak

set.scrolloff = 5 -- minimal number of screen lines to keep above and below the cursor

set.is = true -- whie typing a search command, show where th pattern, as it was typed so far, matches.

set.wrap = true -- When on, lines longer than the width of the window will wrap and displaying continues on the next line.

set.wildmenu = true -- set wild menu to give suggestions for items using tabs of wildchars

set.smd = true -- show mode (insert/visual/normal)

set.ttyfast = true -- fast char insertion

set.smartindent = true -- Do smart autoindenting when starting a new line.

set.splitbelow = true -- split windows below horizontally

set.splitright = true -- split windows on right vertically

set.errorbells = false -- dont ring the bell for errors

set.hidden = true -- seamlessly change buffers without saving

set.mouse = "a" -- makes mouse active

set.tabstop = 4 -- tabs to 4 spaces

set.softtabstop = 4 -- tabs to 4 spaces

set.shiftwidth = 4 -- Number of spaces to use for each step of autoindent

set.encoding = "UTF-8" -- set the encoding pattern

set.expandtab = true -- In insert mode use appropriate number os spaces to insert a <tab>

set.smartcase = true -- Override the ignore case option if the search pattern contains upper case characters.

set.ignorecase = true -- Ignore case in search patterns.

set.ai = true -- enable auto indent

set.swapfile = false -- dont set temporary files for buffer changes

set.backup = false -- dont make a backup before overwriting a file

set.history = 1000 -- set history items to 1000

set.ut = 300 -- update time

set.sidescrolloff = 8 -- set sidescroffoff to 8

set.undofile = true -- sets undo file

set.undodir = undo_dir -- undo file location

set.colorcolumn = "100" -- set colorcolumn to 100

set.termguicolors = true -- terminal colors enables 24bit colors

set.completeopt = { "noinsert", "menu", "menuone", "noselect", "preview" } -- A comma separated list of options for Insert mode completion

set.guicursor = { "n-v-c:block-Cursor", "i-ci-ve:ver25-Cursor", "r-cr-o:hor20-Cursor" } -- Configures the cursor sytle for each mode. Works in the Gui and many

set.cursorline = true -- highlight the screen line of the cursor with Cursorline

set.lazyredraw = true -- screen will not be redrawn whie executing macros, reg etc which are not typed

set.hls = false -- dont highlight all search patterns

set.is = true -- incremental search highlight

set.nrformats = set.nrformats -- This defines what bases Vim will consider for numbers when using the CTRL-A and CTRL-X commands for adding to and subtracting from a number

set.matchpairs = set.matchpairs + "<:>" -- Characters that form pairs.  The |%| command jumps from one to the other.

set.sessionoptions = { "buffers", "curdir", "folds", "tabpages", "winsize" } -- options to preserve when making session

set.autochdir = true -- change dir on buffer change

-- set.virtualedit = all

set.grepprg = "rg --vimgrep --smart-case --follow" -- change native grep program for vim

set.laststatus = 3 -- neovim specific to get a global statusline

-- set.statusline = "   %F"
-- set.statusline = "%{%v:lua.require('core.statusline').current()%}"

set.cpoptions = set.cpoptions + ">" -- A sequence of single character flags.

set.timeoutlen = 100 -- Time in milliseconds to wait for a mapped sequence to complete.

--set.fillchars = {fold='\',vert='\|',eob='\',msgsep='‾'} -- characters to fille the statuslines and vertical separators.
set.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- suppress ~ at EndOfBuffer
	--diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

set.jumpoptions = "view" -- set the jumptions for jumplist and changelist and alternate list to view

cmd([[abb py! #!/usr/bin/env python3]]) -- set abbreviation

cmd([[filetype plugin indent on ]]) -- make filetype plugin on

-- sandwhich vim
cmd([[ set path+=~/.config/nvim/** ]]) -- add extra directory for cmds that use path
cmd([[ set path+=~/.dotfiles/** ]]) -- add -- add extra directory for cmds that use path
-- cmd([[ runtime macros/sandwich/keymap/surround.vim ]])
-- vim.g.nvim_tree_respect_buf_cwd = 1
-- vim.g.nvim_tree_root_foler_modifier = ':p:r'
-- vim.g.nvim_tree_highlight_opened_files = 2
-- local present, mod = pcall(require, "impatient")
-- if present then
-- set.winbar = "%{%v:lua.require'Plugins.winbar'.get_winbar%}"
-- set.winbar = "%=%{%v:lua.require('core.userFunctions').total_buffers()%}=%F"
-- set.winbar = "%=%{len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))}=%F"
-- set.winbar = " Total buffers:%{len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))}  %F"
-- set.winbar = "%#WhichKey#%=%F"

-- winbar format
-- set.winbar = " Total buffers:%{%v:lua.require('core.userFunctions').total_buffers()%} %F"

-- native vim syntax off by default
cmd([[syntax off]])

-- set syntax highlight bash for all sh extension files
vim.filetype.add({
	extension = {
		sh = "bash",
		config = "bash",
		conf = "bash",
	},
	filename = {
		["config"] = "bash",
		[".config"] = "bash",
		[".conf"] = "bash",
		["tmux.conf"] = "bash",
		["lfrc"] = "bash",
	},
})
