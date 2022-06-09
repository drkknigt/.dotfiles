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
local chngeDir = api.nvim_create_augroup("WindowClose", { clear = true })
api.nvim_create_autocmd("WinClosed", { command = "set bufhidden&", group = WindowClose })

local function set_abb()
	local file_type = vim.bo.file_type
	command("abb py! #!/usr/bin/env " .. file_type)
end

-- local file_type = vim.bo.file_type
camd = "lua print(" ..vim.bo.filetype .. ")"
local setABB = api.nvim_create_augroup("setAbb", { clear = true })
api.nvim_create_autocmd("BufEnter", { command = camd, group = setAbb })
-- nvim lsp action symbols
--lsp actions bulb symbol
-- local lspAction = api.nvim_create_augroup("LspAction",{clear = true})
-- api.nvim_create_autocmd({"CursorHold","CursorHoldI"}, { command = "lua require'nvim-lightbulb'.update_lightbulb({virtual_text = {enabled = true,text = '💡'}})", group = lspAction,})
