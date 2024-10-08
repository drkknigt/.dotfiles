-- leadker key
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local map_func = vim.keymap.set

-- visually select inside and outside the line
map("x", "il", "g_o^", { noremap = true, silent = true })
map("o", "il", ":normal vil<cr>", { noremap = true, silent = true })
map("x", "al", "$o^", { noremap = true, silent = true })
map("o", "al", ":normal val<cr>", { noremap = true, silent = true })

-- editor keymaps
map(
	"n",
	"<leader>hh",
	"md<bar>:call matchadd('LineHighlight','\\%'.line('.').'l')<cr>",
	{ silent = true, noremap = true, desc = "create a local mark with d and highlight line" }
)
map("n", "<leader>lf", ":!touch ", { silent = false, noremap = true, desc = "create a file with !touch" })
map("n", "<leader>lc", ":!mkdir -p ", { silent = false, noremap = true, desc = "create a dir with !mkdir" })
map(
	"n",
	"<leader>hv",
	":set nohls<bar>call clearmatches()<cr>",
	{ silent = true, noremap = true, desc = "clear highlight created by <leader>hh" }
)
map_func(
	"n",
	"<leader>bo",
	require("Drkknght.core.userFunctions").kill_buffers,
	{ silent = true, noremap = true, desc = "Delete all buffers except current one" }
)
map_func(
	"n",
	"<leader>be",
	require("Drkknght.core.userFunctions").kill_empty,
	{ silent = true, noremap = true, desc = "Delete all empty buffers" }
)
map_func(
	"n",
	"<leader>bb",
	require("Drkknght.core.userFunctions").run_tmux_pane_commands,
	{ silent = true, noremap = true, desc = "Run commands in tmux pane" }
)
map(
	"n",
	"<leader>br",
	":vert Compile ",
	{ silent = false, noremap = true, desc = "Run commands in nvim vertical window" }
)
map_func(
	"n",
	"<leader>bl",
	require("Drkknght.core.userFunctions").run_tmux_pane_lines,
	{ silent = true, noremap = true, desc = "Run current line under cursor in tmux pane" }
)
map("n", "<leader>bk", ":VtrSendCtrlD<cr>", { silent = true, noremap = true, desc = "send ctrd-d to tmux pane" })
map("n", "<leader>bx", ":VtrSendCtrlC<cr>", { silent = true, noremap = true, desc = "send ctrd-c to tmux pane" })
map("i", "kj", "<Esc>", { silent = true })
map_func("n", "<C-k>", require("Drkknght.core.userFunctions").next_buffer, { noremap = true, silent = true })
map_func("n", "<C-j>", require("Drkknght.core.userFunctions").previous_buffer, { noremap = true, silent = true })
map("n", "<leader>d", ":bd!<CR>", { noremap = true, silent = true, desc = "delete buffer forcefully" })
map("n", "<leader>w", ":w ++p<CR>", { noremap = true, silent = true, desc = "save buffer" })
map_func(
	"n",
	"<leader>,",
	require("Drkknght.core.userFunctions").open_previous_session,
	{ noremap = true, silent = true, desc = "restore last session created before exiting" }
)
map("n", "<leader>k", "K", { noremap = true, silent = true, desc = "open man page for keyword under cursor" })
map(
	"n",
	"<leader>c",
	":mks! $HOME/.textedit/nvim/early.vim<bar>qall!<CR>",
	{ noremap = true, silent = true, desc = "exit vim but also save current session before exiting" }
)
map("n", "<leader>y", 'magg"+yG`a', { noremap = true, silent = true, desc = "copy full file" })
map("n", "n", "nzznN", { noremap = true, silent = true })
map("n", "N", "NzznN", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
map("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
map("v", "<", "<gv", { noremap = true, silent = true })
map("n", "<leader>z", ":e ~/.config/nvim/init.lua<cr>", { noremap = true, silent = true, desc = "open init.lua" })

-- jump keymaps
map("n", "<leader>n)", "/)<cr>", { noremap = true, silent = true })
map("n", "<leader>n(", "/(<cr>", { noremap = true, silent = true })
map("n", "<leader>m)", "?)<cr>", { noremap = true, silent = true })
map("n", "<leader>m(", "?(<cr>", { noremap = true, silent = true })
map("n", "<leader>n[", "/[<cr>", { noremap = true, silent = true })
map("n", "<leader>n]", "/]<cr>", { noremap = true, silent = true })
map("n", "<leader>m[", "?[<cr>", { noremap = true, silent = true })
map("n", "<leader>m]", "?]<cr>", { noremap = true, silent = true })
map("n", "<leader>n{", "/{<cr>", { noremap = true, silent = true })
map("n", "<leader>n}", "/}<cr>", { noremap = true, silent = true })
map("n", "<leader>m{", "?{<cr>", { noremap = true, silent = true })
map("n", "<leader>m}", "?}<cr>", { noremap = true, silent = true })
map("n", "<leader>n'", "/'<cr>", { noremap = true, silent = true })
map("n", "<leader>m'", "?'<cr>", { noremap = true, silent = true })
map("n", '<leader>n"', '/"<cr>', { noremap = true, silent = true })
map("n", '<leader>m"', '?"<cr>', { noremap = true, silent = true })
map("n", "<leader>n`", "/`<cr>", { noremap = true, silent = true })
map("n", "<leader>m`", "?`<cr>", { noremap = true, silent = true })
map("n", "<leader>ne", "/=\\+<cr>", { noremap = true, silent = true })
map("n", "<leader>me", "?=<cr>", { noremap = true, silent = true })
map("n", "<leader>na", "/+<cr>", { noremap = true, silent = true })
map("n", "<leader>ma", "?+<cr>", { noremap = true, silent = true })
map("n", "<leader>ns", "/-<cr>", { noremap = true, silent = true })
map("n", "<leader>ms", "?-<cr>", { noremap = true, silent = true })
map("n", "<leader>nd", "/_<cr>", { noremap = true, silent = true })
map("n", "<leader>md", "?_<cr>", { noremap = true, silent = true })
map("n", "<leader>nb", "//<cr>", { noremap = true, silent = true })
map("n", "<leader>mb", "?/<.\\{-}><cr>", { noremap = true, silent = true })
map("n", "<leader>nt", "/<.\\{-}><cr>", { noremap = true, silent = true })
map("n", "<leader>mt", "?><cr>", { noremap = true, silent = true })
map("n", "<leader>nn", "/\\d\\+<cr>", { noremap = true, silent = true })
map("n", "<leader>mn", "?\\d\\+<cr>", { noremap = true, silent = true })
-- map("n", "<leader>o", "O<Esc>jo<Esc>k", { noremap = true, silent = true })
map("n", "<leader>O", "O<Esc>j", { noremap = true, silent = true })
map("n", "<leader>nv", "/\\w\\+\\s*=\\s*<cr>", { noremap = true, silent = true })
map("n", "<leader>mv", "?\\w\\+\\s*=\\s*<cr>", { noremap = true, silent = true })
map("n", "]a", ":s/[a-zA-Z1-9\\-_0\\+]\\+/'\\0',/g<bar>normal I= [<Esc>A]<Esc>I", { noremap = true, silent = true })
map("n", "]e", ":s/[a-zA-Z1-9\\-_0\\+]\\+/\\0,/g<bar>normal I= [<Esc>A]<Esc>I", { noremap = true, silent = true })

-- terminal keymaps

-- visula mapping

map("v", ".", ":normal .<CR>", { noremap = true, silent = true })
map("v", "<leader>bl", ":VtrSendLinesToRunner<cr>", { silent = true, noremap = true })
