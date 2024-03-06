-- local cmd = vim.api.nvim_create_user_command
-- local command = vim.api.nvim_command
-- local buffer_delete = vim.api.nvim_buf_delete

-- table of helper functions
local M = {}

-- delete buffers lua function

M.kill_buffers = function(value)
	local buf_list = vim.api.nvim_list_bufs()
	local current_buf_no = vim.api.nvim_get_current_buf()
	for i, v in pairs(buf_list) do
		if v ~= current_buf_no then
			-- buffer_delete(v, { force, unlord })
			-- command(string.format("bd! %s", v))
			pcall(vim.api.nvim_command, "bd! " .. v)
		end
	end
end

-- cmd("Bo", kill_buffers, { desc = "Delete all buffers except current one" })
-- delete empty buffes

M.kill_empty = function(value)
	local buf_list = vim.api.nvim_list_bufs()
	local current_buf_no = vim.api.nvim_get_current_buf()
	for i, v in pairs(buf_list) do
		if #vim.api.nvim_buf_get_name(v) == 0 then
			-- buffer_delete(v, { force })
			-- command(string.format("bd! %s", v))
			pcall(vim.api.nvim_command, "bd! " .. v)
		end
	end
end

-- run commands in tmux pane

M.run_tmux_pane_commands = function()
	local os = require("os")
	local tmux_active = os.getenv("TMUX")
	if tmux_active then
		local input = vim.fn.input("Command: ")
		if string.len(input) == 0 then
			return
		end
		local total_panes = vim.fn.system("tmux list-panes | wc -l", true)
		local active_pane = vim.fn.system("tmux display -p '#{pane_index}'", true)
		total_panes = tonumber(total_panes)
		if total_panes < 2 then
			os.execute("tmux kill-pane -a -t " .. active_pane)
			os.execute("tmux split-window -h")
			-- os.execute("tmux send " .. '"cd "' .. current_dir .. " C-m")
			os.execute("tmux last-pane")
			vim.cmd([[ silent VtrAttachToPane ]])
			vim.cmd("VtrSendCommandToRunner " .. input)
		else
			local current_dir = vim.loop.cwd()
			vim.cmd([[ silent VtrAttachToPane ]])
			vim.cmd("VtrSendCommandToRunner cd " .. current_dir)
			vim.cmd("VtrSendCommandToRunner " .. input)
		end
	else
		print("Not inside tmux session")
	end
end

-- run current line in tmux pane

M.run_tmux_pane_lines = function()
	local os = require("os")
	local tmux_active = os.getenv("TMUX")
	local current_dir = vim.loop.cwd()
	if tmux_active then
		local total_panes = vim.fn.system("tmux list-panes | wc -l", true)
		total_panes = tonumber(total_panes)
		if total_panes < 2 then
			os.execute("tmux split-window -h")
			-- os.execute("tmux send " .. '"cd "' .. current_dir .. " C-m")
			os.execute("tmux last-pane")
			vim.cmd([[ silent VtrAttachToPane ]])
			vim.cmd("VtrSendLinesToRunner")
		else
			vim.cmd([[ silent VtrAttachToPane ]])
			vim.cmd("VtrSendLinesToRunner")
		end
	else
		print("Not inside tmux session")
	end
end

-- custom commands to run commands in tmux
-- cmd("Command", run_tmux_pane_lines, { desc = "run lines in tmux pane" })
-- cmd("Commands", run_tmux_pane_commands, { desc = "run commands in tmux pane" })

-- kill all empty buffers
-- cmd("Be", kill_empty, { desc = "kill empty buffers" })

-- cmd("Docs", "e ~/.config/nvim/Readme.md", { desc = "load custom docs for neovim" })

-- oil function to toggle oil window
M.toggle_oil = function()
	local buf_list = vim.fn.tabpagebuflist()
	local current_buf_no = vim.api.nvim_get_current_buf()
	local oil_found = false
	local oil_buffer = false
	for i, v in pairs(buf_list) do
		local file_type = vim.api.nvim_buf_get_option(v, "filetype")
		if file_type == "oil" then
			pcall(vim.api.nvim_command, "bd! " .. v)
			return
		end
	end
	vim.cmd("vsplit | wincmd H")
	require("oil").open()
end

-- move to next buffer while updating oil
M.next_buffer = function()
	vim.cmd("bnext")
	local buf_list = vim.fn.tabpagebuflist()
	local current_buf_no = vim.api.nvim_get_current_buf()
	local oil_found = false
	local oil_buffer = false
	for i, v in pairs(buf_list) do
		local file_type = vim.api.nvim_buf_get_option(v, "filetype")
		if file_type == "oil" then
			pcall(vim.api.nvim_command, "bd! " .. v)
			M.toggle_oil()
			vim.cmd("wincmd l")
			break
		end
	end
end

M.previous_buffer = function()
	vim.cmd("bprevious")
	local buf_list = vim.fn.tabpagebuflist()
	local current_buf_no = vim.api.nvim_get_current_buf()
	local oil_found = false
	local oil_buffer = false
	for i, v in pairs(buf_list) do
		local file_type = vim.api.nvim_buf_get_option(v, "filetype")
		if file_type == "oil" then
			pcall(vim.api.nvim_command, "bd! " .. v)
			M.toggle_oil()
			vim.cmd("wincmd l")
			break
		end
	end
end

-- open previously saved session
M.open_previous_session = function()
	vim.cmd("source $HOME/.textedit/nvim/early.vim")
	M.kill_empty()
end

-- search files in dotfiles
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		file_ignore_patterns = { "%.git", "node_modules/.*", "BraveSoftware/" },
		prompt_title = "<--DOTFILES-->",
		search_dirs = { "~/.dotfiles", "~/.cache/tmux" },
		hidden = true,
	})
end

-- search files in arch and mint ansible bootstrap
M.search_ansible = function()
	require("telescope.builtin").find_files({
		file_ignore_patterns = { "%.git" },
		prompt_title = "<--Arch-Mint-ansible-->",
		search_dirs = { "~/.ansible_sync", "~/arch-pull" },
		hidden = true,
	})
end

-- make backup of lazy snapshots
local function copy_lazy_to_snapshots()
	local snapshot_dir = vim.fn.stdpath("config") .. "/snapshots"
	local snapshot = snapshot_dir .. os.date("/%B-%d-%Y-Time-%H:%M:%S-lazy.json")
	local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
	vim.loop.fs_copyfile(lockfile, snapshot)
end

local back_up_lazy = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local selected_file = action_state.get_selected_entry()
	local actions = require("telescope.actions")
	actions.close(prompt_bufnr)
	copy_lazy_to_snapshots()
	local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
	vim.loop.fs_copyfile(selected_file[1], lockfile)
	vim.cmd("Lazy restore")
end

M.backup_lazy = function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("n", "<cr>", back_up_lazy)
			map("i", "<cr>", back_up_lazy)
			return true
		end,
		search_dirs = { "~/.dotfiles/nvim/.config/nvim/snapshots" },
		path_display = { "tail" },
		wrap_results = true,
	})
end

--- open oil via telescope in choosen directory
local function open_oil_telescope(prompt_bufnr)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local selected_file = action_state.get_selected_entry()
	actions.close(prompt_bufnr)
	vim.cmd("Oil " .. selected_file[1])
	vim.cmd("cd " .. selected_file[1])
end

M.open_dir_telescope = function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("n", "<cr>", open_oil_telescope)
			map("i", "<cr>", open_oil_telescope)
			return true
		end,
		search_dirs = { "/home/" },
		-- path_display = { "tail" },
		wrap_results = true,
		find_command = { "fd", "--type", "d", "--hidden", "--max-depth", "8" },
	})
end

M.total_buffers = function()
	local tab_buf = vim.api.nvim_list_bufs()
	local count = 0
	for _, buf_hndl in pairs(tab_buf) do
		if vim.api.nvim_buf_is_loaded(buf_hndl) then
			count = count + 1
		end
	end
	return count
end

M.total_buffers = function()
	buffer_table = vim.tbl_filter(function(bufnr)
		return vim.api.nvim_buf_get_option(bufnr, "buflisted")
	end, vim.api.nvim_list_bufs())
	count = 0
	for i, j in pairs(buffer_table) do
		count = count + 1
	end
	return count
end

M.buffer_number = function()
	local current_buf_no = vim.api.nvim_get_current_buf()
	buffer_table = vim.tbl_filter(function(bufnr)
		return vim.api.nvim_buf_get_option(bufnr, "buflisted")
	end, vim.api.nvim_list_bufs())
	for i, j in pairs(buffer_table) do
		if j == current_buf_no then
			return string.format("Buffer No: " .. tostring(i))
		end
	end
end

-- return functions
return M
