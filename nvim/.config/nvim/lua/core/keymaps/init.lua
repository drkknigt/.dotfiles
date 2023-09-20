-- leadker key
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

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
	{ silent = true, noremap = true }
)
map("n", "<leader>lc", ":!touch ", { silent = false, noremap = true })
map("n", "<leader>lf", ":!mkdir ", { silent = false, noremap = true })
map("n", "<leader>hv", ":set nohls<bar>call clearmatches()<cr>", { silent = true, noremap = true })
map("n", "<leader>bo", ":Bo<cr>", { silent = true, noremap = true })
map("n", "<leader>be", ":Be<cr>", { silent = true, noremap = true })
map("n", "<leader>bb", ":Tc<cr>", { silent = true, noremap = true })
map("n", "<leader>bl", ":Tl<cr>", { silent = true, noremap = true })
map("n", "<leader>bk", ":VtrSendCtrlD<cr>", { silent = true, noremap = true })
map("n", "<leader>bx", ":VtrSendCtrlC<cr>", { silent = true, noremap = true })
map("n", "<leader>bc", ":Tc<cr>", { silent = false, noremap = true })
map("i", "jk", "<Esc>", { silent = true })
map("i", "kj", "<Esc>", { silent = true })
map("n", "<C-k>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "<leader>d", ":bd!<CR>", { noremap = true, silent = true })
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
map("n", "<leader>,", ":source /home/drkknght/.textedit/nvim/early.vim<bar>Be<CR>", { noremap = true, silent = true })
map("n", "<leader>k", "K", { noremap = true, silent = true })
map("n", "<leader>c", ":mks! $HOME/.textedit/nvim/early.vim<bar>qall!<CR>", { noremap = true, silent = true })
map("n", "<leader>y", 'magg"+yG`a', { noremap = true, silent = true })
map("n", "n", "nzznN", { noremap = true, silent = true })
map("n", "N", "NzznN", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
map("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
map("v", "<", "<gv", { noremap = true, silent = true })
map("n", "<leader>z", ":e ~/.config/nvim/init.lua<cr>", { noremap = true, silent = true })

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
map("n", "<leader>o", "O<Esc>jo<Esc>k", { noremap = true, silent = true })
map("n", "<leader>O", "O<Esc>j", { noremap = true, silent = true })
map("n", "<leader>nv", "/\\w\\+\\s*=\\s*<cr>", { noremap = true, silent = true })
map("n", "<leader>mv", "?\\w\\+\\s*=\\s*<cr>", { noremap = true, silent = true })
map("n", "]a", ":s/\\w\\+/'\\0',/g<bar>normal I= [<Esc>A]<Esc>I", { noremap = true, silent = true })
map("n", "]e", ":s/\\w\\+/\\0,/g<bar>normal I= [<Esc>A]<Esc>I", { noremap = true, silent = true })

-- terminal keymaps

-- visula mapping

map("v", ".", ":normal .<CR>", { noremap = true, silent = true })
map("v", "<leader>bl", ":VtrSendLinesToRunner<cr>", { silent = true, noremap = true })
