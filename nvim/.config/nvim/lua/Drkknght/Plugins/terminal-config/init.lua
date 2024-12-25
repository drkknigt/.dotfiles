-- local status_ok, toggleterm = pcall(require, "toggleterm")
-- if not status_ok then
-- 	return
-- end
--
-- toggleterm.setup({
-- 	size = function(term)
-- 		if term.direction == "horizontal" then
-- 			return 15
-- 		elseif term.direction == "vertical" then
-- 			return vim.o.columns * 0.4
-- 		else
-- 			return 10
-- 		end
-- 	end,
-- 	open_mapping = [[<c-\>]],
-- 	hide_numbers = true,
-- 	shade_filetypes = {},
-- 	shade_terminals = false,
-- 	shading_factor = 2,
-- 	start_in_insert = true,
-- 	insert_mappings = true,
-- 	persist_size = true,
-- 	direction = "float",
-- 	close_on_exit = true,
-- 	shell = vim.o.shell,
-- 	float_opts = {
-- 		border = "curved",
-- 		winblend = 0,
-- 		highlights = {
-- 			border = "Normal",
-- 			background = "None",
-- 		},
-- 	},
-- })
--
-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-;>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--
-- local Terminal = require("toggleterm.terminal").Terminal
--
-- function _LAZYGIT_TOGGLE()
-- 	Terminal
-- 		:new({
-- 			cmd = "lazygit",
-- 			-- cmd = "lazygit --use-config-file=$HOME/.config/lazygit/config.yml",
-- 			dir = vim.fn.getcwd(),
-- 			hidden = true,
-- 			float_opts = {
-- 				border = "curved",
-- 				width = 80,
-- 				height = 80,
-- 				winblend = 0,
-- 				highlights = { border = "Normal", background = "None" },
-- 			},
-- 			on_open = function(term)
-- 				lazygit_group = vim.api.nvim_create_augroup("LazyGitInputWatch", { clear = true })
-- 				vim.api.nvim_create_autocmd("InsertCharPre", {
-- 					callback = function()
-- 						os.execute("echo hello >> /tmp/test.txt")
-- 					end,
-- 					group = lazygit_group,
-- 					buffer = term.bufnr,
-- 				})
-- 			end,
-- 			on_close = function()
-- 				vim.api.nvim_del_augroup_by_id(lazygit_group)
-- 			end,
-- 		})
-- 		:toggle()
-- end
--
-- function _NODE_TOGGLE()
-- 	Terminal:new({ cmd = "node", hidden = true }):toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
-- 	Terminal:new({ cmd = "htop", hidden = true }):toggle()
-- end
--
-- function _PYTHON_TOGGLE()
-- 	Terminal
-- 		:new({
-- 			cmd = "python3",
-- 			hidden = true,
-- 		})
-- 		:toggle()
-- end
--
-- function _LUA_TOGGLE()
-- 	Terminal:new({ cmd = "lua", hidden = true }):toggle()
-- end
--
-- function _GLOW()
-- 	Terminal:new({ cmd = "glow " .. vim.fn.expand("%"), hidden = true }):toggle()
-- end

-- end of toggle term config --

--------------------------------------------- vim-floaterm ------------------------------------

vim.g.floaterm_opener = "edit"

-- functions to call various external cmd line repls, tools

-- call lazygit
function _LAZYGIT_TOGGLE()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.9 --width=1.0 --title=lazygit --titleposition=center --disposable lazygit -ucf ~/.dotfiles/lazygit/.config/lazygit/config.yml"
	)
	vim.cmd("cd " .. current_dir)
end

-- call nodejs repl
function _NODE_TOGGLE()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.7 --width=0.8 --disposable --title=Node --titleposition=center node"
	)
	vim.cmd("cd " .. current_dir)
end

-- call htop
function _HTOP_TOGGLE()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.7 --width=0.8 --disposable --title=Htop --titleposition=center htop"
	)
	vim.cmd("cd " .. current_dir)
end

-- call python repl
function _PYTHON_TOGGLE()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.7 --width=0.8 --disposable --title=Python --titleposition=center python3"
	)
	vim.cmd("cd " .. current_dir)
end

-- call lua repl
function _LUA_TOGGLE()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.7 --width=0.8 --disposable --title=Lua --titleposition=center lua"
	)
	vim.cmd("cd " .. current_dir)
end

-- call glow markdown viewer
function _GLOW()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.9 --width=0.9 --disposable --title=Glow --titleposition=center glow -p %"
	)
	vim.cmd("cd " .. current_dir)
end

-- make horizontal terminal
function _HORIZONTAL()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd=" .. current_dir .. " --height=0.4 --title=Horizontal --titleposition=center --wintype=split"
	)
	vim.cmd("cd " .. current_dir)
end

-- make vertical terminal
function _VERTICAL()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd=" .. current_dir .. " --width=0.4 --title=Vertical --titleposition=center --wintype=vsplit"
	)
	vim.cmd("cd " .. current_dir)
end

-- make floating terminal
function _FLOAT()
	local current_dir = vim.fn.getcwd()
	vim.cmd("normal mf")
	vim.cmd(
		"FloatermNew --cwd=" .. current_dir .. " --height=0.8 --width=0.7 --title=Horizontal --titleposition=center"
	)
	vim.cmd("cd " .. current_dir)
end

-- mapping to kill floaterm in terminal mode
local map = vim.api.nvim_set_keymap
map("t", "<C-d>", "<C-\\><C-n>:FloatermKill<cr><bar>i<ESC>`f", { silent = true, noremap = true })

-- maping to run programming language

function _Run_Program()
	local language_table = {
		["lua"] = "lua %",
		["typescript"] = "deno run %",
		["javascript"] = "node %",
		["markdown"] = "glow %",
		["python"] = "python3 %",
		["rust"] = "rustc % && ./$fileBase && rm $fileBase",
		["cpp"] = "g++ % -o $fileBase && ./$fileBase",
		["c"] = "gcc % -o $fileBase && ./$fileBase",
		["go"] = "go run %",
		["sh"] = "sh %",
		["lua"] = "lua5.3 %",
		["sh"] = "bash %",
		["zsh"] = "zsh %",
		["java"] = "java %",
	}
	local filetype = vim.bo.filetype
	local current_dir = vim.fn.getcwd()
	vim.cmd(
		"FloatermNew --cwd="
			.. current_dir
			.. " --height=0.7 --width=0.8 --disposable --title=Lua --titleposition=center --autoclose=0 "
			.. language_table[filetype]
	)
end
