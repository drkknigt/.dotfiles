local autocmd = vim.api.nvim_create_autocmd
local api = vim.api
-- Highlight on yank
autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 440 })
	end,
})

-- set formatting options and remove comments while using 'o' and <Enter> in insert mode
autocmd("BufEnter", {
	desc = "set formatting options and remove comments while using 'o' and <enter> in insert mode",
	group = api.nvim_create_augroup("FoldGrp", { clear = true }),
	command = "set fo-=c fo-=r fo-=o",
})

-- set current directory for current window only
autocmd("BufEnter", {
	desc = "set current directory for current window only",
	command = "silent! lcd %:p:h",
	group = api.nvim_create_augroup("ChngeDir", { clear = true }),
})

-- set keymaps to browse lsp symbols  in quickfix and copies '/' register to 'x' register
autocmd("BufReadPost", {
	desc = "set keymaps to browse lsp symbols  in quickfix",
	group = api.nvim_create_augroup("lsp_details", { clear = true }),
	pattern = { "quickfix" },
	callback = function()
		local search_reg_content = vim.fn.getreg("/")
		vim.fn.setreg("x", search_reg_content)
		vim.api.nvim_buf_set_keymap(0, "n", "F", "<leader>sl'function ", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "V", "<leader>sl'variable ", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "M", "<leader>sl'module ", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "C", "<leader>sl'class ", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "f", "/function<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "v", "/variable<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "m", "/module<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "c", "/class<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>d", ":cclose<CR>", { silent = true, noremap = true })
	end,
})

-- preserve serach register value on exiting the quickfix list by copying value of 'x' reg to '/' reg
autocmd("BufLeave", {
	desc = "preserve serach register value on exiting the quickfix list",
	group = api.nvim_create_augroup("paste_search", { clear = true }),
	callback = function()
		if vim.bo.filetype == "qf" then
			local search_reg_content = vim.fn.getreg("x")
			vim.fn.setreg("/", search_reg_content)
		end
	end,
})

-- preserver the window view after changing the buffer

-- vim.cmd([[autocmd! BufWinLeave * let b:winview = winsaveview()
-- autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview]])

-- autocmd("TermOpen", {
-- 	desc = "preserve the window view after chaning the buffer ,
-- 	command = "autocmd! BufWinLeave * let b:winview = winsaveview() autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview",
-- 	group = api.nvim_create_augroup("winSaveView", { clear = true }),
-- })

-- no relative numbers and number line in terminal mode
autocmd("TermOpen", {
	desc = "remove relative numbers and number line in terminal mode",
	command = "setlocal nonumber norelativenumber",
	group = api.nvim_create_augroup("TermNoLine", { clear = true }),
})

-- autocmd to restore cursor position after yank
local augroups = {}

augroups.yankpost = {

	save_cursor_position = {
		event = { "VimEnter", "CursorMoved" },
		pattern = "*",
		callback = function()
			cursor_pos = vim.fn.getpos(".")
		end,
	},

	yank_restore_cursor = {
		event = "TextYankPost",
		pattern = "*",
		callback = function()
			local cursor = vim.fn.getpos(".")
			if vim.v.event.operator == "y" then
				vim.fn.setpos(".", cursor_pos)
			end
		end,
	},
}

for group, commands in pairs(augroups) do
	local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

	for _, opts in pairs(commands) do
		local event = opts.event
		opts.event = nil
		opts.group = augroup
		autocmd(event, opts)
	end
end

-- autocmd to set height for oil.nvim
autocmd("BufEnter", {
	desc = "autocmd to set height for oil.nvim",
	group = api.nvim_create_augroup("OilRelPathFix", { clear = true }),
	pattern = "oil:///*",
	callback = function()
		vim.cmd("vert resize 35%")
	end,
})

-- autocmd to make backup of lazy-lock-json on each lazy update
local snapshot_dir = vim.fn.stdpath("config") .. "/snapshots"
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"

vim.api.nvim_create_user_command("BrowseSnapshots", "edit " .. snapshot_dir, {})

autocmd("User", {
	group = api.nvim_create_augroup("lazy_cmds", { clear = true }),
	pattern = "LazyUpdatePre",
	desc = "Backup lazy.nvim lockfile",
	callback = function(event)
		if vim.fn.isdirectory(snapshot_dir) == 0 then
			vim.fn.mkdir(snapshot_dir, "p")
		end
		local snapshot = snapshot_dir .. os.date("/%B-%d-%Y-Time-%H:%M:%S-lazy.json")
		vim.uv.fs_copyfile(lockfile, snapshot)
	end,
})

-- autocmd to change the directory after entering oil buffer
autocmd("BufEnter", {
	group = api.nvim_create_augroup("OilEnterBuf", { clear = true }),
	pattern = "oil:///*",
	desc = "change main directory to oil directory",
	callback = function()
		local oil_directory = vim.fn.expand("%")
		local true_directory = oil_directory:sub(7, #oil_directory)
		vim.cmd("cd " .. true_directory)
	end,
})

-- autocmd to start terminal mode in insert mode
autocmd("TermOpen", {
	group = api.nvim_create_augroup("TerminalMode", { clear = true }),
	pattern = "*",
	desc = "enter insert mode in terminal mode",
	callback = function()
		vim.cmd("startinsert")
		-- require("Drkknght.core.userFunctions").get_winbar("local")
	end,
})
