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
vim.g.floaterm_opener = "edit"

function _LAZYGIT_TOGGLE()
	vim.cmd(
		"FloatermNew --cwd=<buffer> --height=0.9 --width=1.0 --title=lazygit --titleposition=center --disposable lazygit -ucf ~/.dotfiles/lazygit/.config/lazygit/nvim_config.yml"
	)
end

function _NODE_TOGGLE()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.7 --width=0.8 --disposable --title=Node --titleposition=center node")
end

function _HTOP_TOGGLE()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.7 --width=0.8 --disposable --title=Htop --titleposition=center htop")
end

function _PYTHON_TOGGLE()
	vim.cmd(
		"FloatermNew --cwd=<buffer> --height=0.7 --width=0.8 --disposable --title=Python --titleposition=center python3"
	)
end

function _LUA_TOGGLE()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.7 --width=0.8 --disposable --title=Lua --titleposition=center lua")
end

function _GLOW()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.9 --width=0.9 --disposable --title=Glow --titleposition=center glow")
end

function _HORIZONTAL()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.4 --title=Horizontal --titleposition=center --wintype=split")
end

function _VERTICAL()
	vim.cmd("FloatermNew --cwd=<buffer> --width=0.4 --title=Vertical --titleposition=center --wintype=vsplit")
end

function _FLOAT()
	vim.cmd("FloatermNew --cwd=<buffer> --height=0.8 --width=0.7 --title=Horizontal --titleposition=center")
end
