local cmd = vim.api.nvim_create_user_command
local command = vim.api.nvim_command
local buffer_delete = vim.api.nvim_buf_delete

-- delete buffers lua function

local function kill_buffers(value)
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

cmd("Bo", kill_buffers, { desc = "Delete all buffers except current one" })
-- delete empty buffes

local function kill_empty(value)
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

local function run_tmux_pane_commands()
	local os = require("os")
	local tmux_active = os.getenv("TMUX")
	if tmux_active then
		local total_panes = vim.fn.system("tmux list-panes | wc -l", true)
		local active_pane = vim.fn.system("tmux display -p '#{pane_index}'", true)
		total_panes = tonumber(total_panes)
		local input = vim.fn.input("Command: ")
		if string.len(input) == 0 then
			return
		end
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

local function run_tmux_pane_lines()
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
cmd("Tl", run_tmux_pane_lines, { desc = "run lines in tmux pane" })
cmd("Tc", run_tmux_pane_commands, { desc = "run commands in tmux pane" })

-- kill all empty buffers
cmd("Be", kill_empty, { desc = "kill empty buffers" })

cmd("Docs", "e ~/.config/nvim/Readme.md", { desc = "load custom docs for neovim" })

local function set_abb()
	local file_type = vim.bo.file_type
	command("abb py! #!/usr/bin/env " .. file_type)
end
