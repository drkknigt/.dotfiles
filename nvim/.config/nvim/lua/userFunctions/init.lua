local cmd = vim.api.nvim_create_user_command
local command = vim.api.nvim_command

-- delete buffers lua function

local function kill_buffers(value)
	local buf_list = vim.api.nvim_list_bufs()
	local current_buf_no = vim.api.nvim_get_current_buf()
	for i, v in pairs(buf_list) do
		if v ~= current_buf_no then
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
			pcall(vim.api.nvim_command, "bd! " .. v)
		end
	end
end

cmd("Be", kill_empty, { desc = "kill empty buffers" })

cmd("Docs", "e ~/neovim/doc.txt", { desc = "load custom docs for neovim" })

local function set_abb()
	local file_type = vim.bo.file_type
	command("abb py! #!/usr/bin/env " .. file_type)
end
