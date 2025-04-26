--------------------------------------------- lsp-config ----------------------------------------

local servers = {
    "ansiblels",
    "bashls",
    "clangd",
    "cssls",
    "emmet_ls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "ts_ls",
    "vimls",
    "yamlls",
}

-- setup mason
require("Drkknght.Plugins.lsp-config.mason").mason_setup(servers)

local servers_to_start = { "clangd", "lua", "python", "go", "ansible", "vimls", "bash", "yaml", "typescript", "html",
    "emmet", "css" }

vim.lsp.enable(servers_to_start)
