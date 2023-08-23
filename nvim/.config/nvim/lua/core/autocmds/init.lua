local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({timeout = 440})",
	group = yankGrp,
})

-- reload packer

-- set folds
local foldGrp = api.nvim_create_augroup("FoldGrp", { clear = true })
api.nvim_create_autocmd("BufEnter", { command = "set fo-=c fo-=r fo-=o" })

-- set current directory for current window only
local chngeDir = api.nvim_create_augroup("ChngeDir", { clear = true })
api.nvim_create_autocmd("BufEnter", { command = "silent! lcd %:p:h", group = chngeDir })

-- set bufhidden to defautl
-- local chngeDir = api.nvim_create_augroup("WindowClose", { clear = true })
-- api.nvim_create_autocmd("WinClosed", { command = "set bufhidden&", group = WindowClose })

local function set_abb()
	local file_type = vim.bo.file_type
	command("abb py! #!/usr/bin/env " .. file_type)
end

-- local file_type = vim.bo.file_type
-- camd = "lua print(" .. vim.bo.filetype .. ")"
-- local setABB = api.nvim_create_augroup("setAbb", { clear = true })
-- api.nvim_create_autocmd("BufEnter", { command = camd, group = setAbb })
-- nvim lsp action symbols
--lsp actions bulb symbol
-- local lspAction = api.nvim_create_augroup("LspAction",{clear = true})
-- api.nvim_create_autocmd({"CursorHold","CursorHoldI"}, { command = "lua require'nvim-lightbulb'.update_lightbulb({virtual_text = {enabled = true,text = '💡'}})", group = lspAction,})
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
-- vim.cmd([[:autocmd BufReadPost quickfix nnoremap <buffer> f /function<cr>]])

-- preserver the window view after changing the buffer
vim.cmd([[autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview]])

-- no relative numbers and number line in terminal mode
local TermNoLine = api.nvim_create_augroup("TermNoLine", { clear = true })
api.nvim_create_autocmd("TermOpen", { command = "setlocal nonumber norelativenumber", group = TermNoLine })
