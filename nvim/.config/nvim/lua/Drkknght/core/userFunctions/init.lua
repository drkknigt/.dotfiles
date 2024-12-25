-- local cmd = vim.api.nvim_create_user_command
-- local command = vim.api.nvim_command
-- local buffer_delete = vim.api.nvim_buf_delete

-- table of helper functions
local M = {}

-- delete all buffers but the current one lua function

M.kill_buffers = function()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current_buf then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end
end

-- delete empty buffers

M.kill_empty = function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_name(buf) == "" then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end
end

-- run commands in tmux pane

M.run_tmux_pane_commands = function(input)
	if not os.getenv("TMUX") then
		print("Not inside a tmux session")
		return
	end

	if input == "" then
		return
	end

	local panes = tonumber(vim.fn.system("tmux list-panes | wc -l"))
	local active_pane = vim.fn.trim(vim.fn.system("tmux display -p '#{pane_index}'"))
	local current_dir = vim.loop.cwd()

	if panes < 2 then
		os.execute("tmux kill-pane -a -t " .. active_pane)
		os.execute("tmux split-window -h")
		os.execute("tmux last-pane")
	end

	vim.cmd([[silent VtrAttachToPane]])
	vim.cmd("VtrSendCommandToRunner cd " .. current_dir)
	vim.cmd("VtrSendCommandToRunner " .. input)
end

vim.api.nvim_create_user_command(
	"RunTmux", -- Command name
	function(opts)
		M.run_tmux_pane_commands(opts.args)
	end, -- Command callback
	{
		nargs = "*", -- Number of arguments (0 or 1 in this case)
		complete = "shellcmd", -- Completion type (e.g., 'file' for file paths)
		desc = "Say hello to someone!", -- Command description
	}
)

-- run current line in tmux pane

M.run_tmux_pane_lines = function()
	if not os.getenv("TMUX") then
		print("Not inside a tmux session")
		return
	end

	local total_panes = tonumber(vim.fn.system("tmux list-panes | wc -l"))
	if total_panes and total_panes < 2 then
		os.execute("tmux split-window -h")
		os.execute("tmux last-pane")
	end

	vim.cmd([[silent VtrAttachToPane]])
	vim.cmd("VtrSendLinesToRunner")
end

-- oil function to toggle oil window

M.toggle_oil = function()
	for _, buf in ipairs(vim.fn.tabpagebuflist()) do
		if vim.bo[buf].filetype == "oil" then
			vim.cmd("bd! " .. buf)
			return
		end
	end
	vim.cmd("vsplit | wincmd H")
	require("oil").open()
end

-- move to next buffer while updating oil

M.next_buffer = function()
	vim.cmd("bnext")
	for _, buf in ipairs(vim.fn.tabpagebuflist()) do
		if vim.bo[buf].filetype == "oil" then
			vim.cmd("bd! " .. buf)
			M.toggle_oil()
			vim.cmd("wincmd l")
			break
		end
	end
end

-- move to previous buffer while updating oil

M.previous_buffer = function()
	vim.cmd("bprevious")
	for _, buf in ipairs(vim.fn.tabpagebuflist()) do
		if vim.bo[buf].filetype == "oil" then
			vim.cmd("bd! " .. buf)
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

-- search files in stdpath for plugins
M.search_plugins = function()
	require("telescope.builtin").find_files({
		file_ignore_patterns = { "%.git", "node_modules/.*", "BraveSoftware/" },
		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
		prompt_title = "<--PLUGINS-->",
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
	local selected_file = require("telescope.actions.state").get_selected_entry().value
	actions.close(prompt_bufnr)
	vim.cmd("Oil " .. selected_file)
	vim.cmd("cd " .. selected_file)
end

M.open_dir_telescope = function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("n", "<cr>", open_oil_telescope)
			map("i", "<cr>", open_oil_telescope)
			return true
		end,
		search_dirs = { "$HOME" },
		wrap_results = true,
		find_command = { "fd", "--type", "d", "--hidden", "--max-depth", "10" },
	})
end

-- search for dotfiles
M.open_dotfiles_fzf = function()
	require("fzf-lua").fzf_exec("fd . ~/.dotfiles ~/.cache/tmux/ -H -t f", {
		prompt = "search dotfiles: ",
		actions = {
			-- Use fzf-lua builtin actions or your own handler
			["default"] = require("fzf-lua").actions.file_edit,
			["ctrl-y"] = function(selected, opts)
				print("selected item:", selected[1])
			end,
		},
	})
end

-- search for arch-pull and ansible_sync
M.open_ansible_fzf = function()
	require("fzf-lua").fzf_exec("fd . ~/arch-pull ~/.ansible_sync -H -t f", {
		prompt = "search ansible: ",
		actions = {
			-- Use fzf-lua builtin actions or your own handler
			["default"] = require("fzf-lua").actions.file_edit,
			["ctrl-y"] = function(selected, opts)
				print("selected item:", selected[1])
			end,
		},
	})
end

M.open_plugins_fzf = function()
	local cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
	require("fzf-lua").fzf_exec("fd . " .. cwd .. " -t d -H -d 11", {
		prompt = "search plugins: ",
		actions = {
			-- Use fzf-lua builtin actions or your own handler
			["default"] = require("fzf-lua").actions.file_edit,
			["ctrl-y"] = function(selected, opts)
				print("selected item:", selected[1])
			end,
		},
	})
end

-- open oil via fzf lua in choosen directory
M.open_dir_fzf = function()
	require("fzf-lua").fzf_exec("fd . ~ -t d -H -d 11", {
		prompt = "goto directory: ",
		actions = {
			-- Use fzf-lua builtin actions or your own handler
			["default"] = function(selected)
				vim.cmd("e " .. selected[1])
				vim.cmd("cd " .. selected[1])
			end,
			["ctrl-y"] = function(selected, opts)
				vim.cmd("e " .. selected[1])
				vim.cmd("cd " .. selected[1])
			end,
		},
	})
end

-- get total buffers opened in session

M.total_buffers = function()
	return #vim.tbl_filter(function(bufnr)
		return vim.api.nvim_buf_get_option(bufnr, "buflisted")
	end, vim.api.nvim_list_bufs())
end

-- get current buffer number
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

-- functions for oil mapping to open buffer

M.open_buffer = function()
	local oil = require("oil")
	local file_name = oil.get_current_dir() .. oil.get_cursor_entry().name
	if vim.fn.isdirectory(file_name) == 1 then
		require("oil.actions").select.callback()
	else
		vim.cmd("edit " .. file_name)
		vim.cmd("wincmd o")
	end
end

-- function to create a flaoting terminal with a command

M.make_term = function(command, orientation, callback, width, height)
	local ui = vim.api.nvim_list_uis()[1]
	local ui_width, ui_height = ui.width, ui.height
	local title_text = vim.split(command, " ")[1]

	-- Set default width and height if not provided
	width = width or 0.7
	height = height or 0.7

	-- Calculate floating window dimensions and position
	local win_width = math.floor(ui_width * width)
	local win_height = math.floor(ui_height * height)
	local col = math.floor((ui_width - win_width) / 2)
	local row = math.floor((ui_height - win_height) / 3)

	-- Create a buffer for the terminal window
	local buf = vim.api.nvim_create_buf(false, true)

	-- Set window options based on orientation
	local win_opts = {}

	if orientation == "split" then
		win_opts = { split = "right", win = 0 }
	elseif orientation == "vert" then
		win_opts = { vertical = "false", win = 0 }
	elseif orientation == "float" then
		win_opts = {
			relative = "editor",
			width = win_width,
			height = win_height,
			title = title_text,
			title_pos = "center",
			col = col,
			row = row,
			style = "minimal",
			border = "rounded",
		}
	else
		error("Unknown orientation option")
	end

	-- Open the terminal window
	vim.api.nvim_open_win(buf, true, win_opts)
	vim.fn.termopen(command or vim.o.shell)

	-- Call callback if provided
	if callback then
		callback()
	end
end

-- function that runs current file in terminal accoding to its type
M.code_runner = function(orientation)
	local file_path = vim.fn.expand("%:p")
	local file_name = vim.fn.expand("%")
	local language_table = {
		["python"] = "python3 " .. file_path,
		["typescript"] = "deno run " .. file_path,
		["javascript"] = "node " .. file_path,
		["markdown"] = "glow " .. file_path,
		["python"] = "python3 " .. file_path,
		-- ["rust"] = "rustc " .. file_path .. " && " .. " ./ && rm $fileBase",
		["cpp"] = "g++ " .. file_path .. " -o " .. file_name .. ".out" .. "  && " .. "./" .. file_name .. ".out",
		["c"] = "gcc " .. file_path .. " -o " .. file_name .. ".out" .. "  && " .. "./" .. file_name .. ".out",
		["go"] = "go run " .. file_path,
		["sh"] = "sh " .. file_path,
		["lua"] = "lua5.3 " .. file_path,
		["sh"] = "bash " .. file_path,
		["bash"] = "bash " .. file_path,
		["zsh"] = "zsh " .. file_path,
		["java"] = "java " .. file_path,
	}
	local file_type = vim.bo.filetype
	M.make_term(language_table[file_type] or "exit", orientation, function()
		vim.cmd("stopinsert")
	end, 0.7, 0.7)
end

-- delete buffers from telescope builtin buffer

M.delete_buffers_telescope = function()
	local actions_state = require("telescope.actions.state")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	require("telescope.builtin").buffers({
		sort_mru = true,
		layout_strategy = "vertical",
		layout_config = { width = 0.4, height = 0.5, anchor = "SE" },
		attach_mappings = function(prompt_bufnr, map)
			local delete_buf = function()
				local current_picker = action_state.get_current_picker(prompt_bufnr)
				current_picker:delete_selection(function(selection)
					vim.cmd("bd! " .. tostring(selection.bufnr))
				end)
			end

			map("n", "<c-d>", actions.delete_buffer)
			map("i", "<c-d>", actions.delete_buffer)
			-- map("i", "<c-d>", delete_buf)

			return true
		end,
	})
end

-- return functions
return M
