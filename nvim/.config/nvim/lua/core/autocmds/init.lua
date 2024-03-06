local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({timeout = 440})",
	group = yankGrp,
})

-- set folds
local foldGrp = api.nvim_create_augroup("FoldGrp", { clear = true })
api.nvim_create_autocmd("BufEnter", { command = "set fo-=c fo-=r fo-=o" })

-- set current directory for current window only
local chngeDir = api.nvim_create_augroup("ChngeDir", { clear = true })
api.nvim_create_autocmd("BufEnter", { command = "silent! lcd %:p:h", group = chngeDir })

-- set keymaps to browse lsp symbols  in quickfix
local lsp_details = api.nvim_create_augroup("lsp_details", { clear = true })
api.nvim_create_autocmd("BufReadPost", {
	group = "lsp_details",
	pattern = { "quickfix" },
	callback = function()
		local search_reg_content = vim.fn.getreg("/")
		vim.fn.setreg("x", search_reg_content)
		vim.api.nvim_buf_set_keymap(0, "n", "F", "zffunction", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "V", "zfvariable", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "M", "zfmodule", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "C", "zfclass", { silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "f", "/function<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "v", "/variable<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "m", "/module<CR>", { silent = true, noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "c", "/class<CR>", { silent = true, noremap = true })
	end,
})

-- preserve serach register value on exiting the quickfix list
local paste_search = api.nvim_create_augroup("paste_search", { clear = true })
api.nvim_create_autocmd("BufLeave", {
	group = "paste_search",
	callback = function()
		if vim.bo.filetype == "qf" then
			local search_reg_content = vim.fn.getreg("x")
			vim.fn.setreg("/", search_reg_content)
		end
	end,
})

-- preserver the window view after changing the buffer or after yanking from textobject
vim.cmd([[autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview]])

-- no relative numbers and number line in terminal mode
local TermNoLine = api.nvim_create_augroup("TermNoLine", { clear = true })
api.nvim_create_autocmd("TermOpen", { command = "setlocal nonumber norelativenumber", group = TermNoLine })

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
		vim.api.nvim_create_autocmd(event, opts)
	end
end

-- autocmd to set height for oil.nvim
api.nvim_create_augroup("OilRelPathFix", {})
api.nvim_create_autocmd("BufEnter", {
	group = "OilRelPathFix",
	pattern = "oil:///*",
	callback = function()
		vim.cmd("vert resize 35%")
	end,
})

-- autocmd to make backup of lazy-lock-json on each lazy update
local lazy_cmds = vim.api.nvim_create_augroup("lazy_cmds", { clear = true })
local snapshot_dir = vim.fn.stdpath("config") .. "/snapshots"
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"

vim.api.nvim_create_user_command("BrowseSnapshots", "edit " .. snapshot_dir, {})

vim.api.nvim_create_autocmd("User", {
	group = lazy_cmds,
	pattern = "LazyUpdatePre",
	desc = "Backup lazy.nvim lockfile",
	callback = function(event)
		if vim.fn.isdirectory(snapshot_dir) == 0 then
			vim.fn.mkdir(snapshot_dir, "p")
		end
		local snapshot = snapshot_dir .. os.date("/%B-%d-%Y-Time-%H:%M:%S-lazy.json")
		vim.loop.fs_copyfile(lockfile, snapshot)
	end,
})
