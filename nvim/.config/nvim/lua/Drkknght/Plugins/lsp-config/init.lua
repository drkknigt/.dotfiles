--------------------------------------------- lsp-config ----------------------------------------

-- setup mason
require("Drkknght.Plugins.lsp-config.mason").mason_setup(servers)

-- setup lsp-config

require("Drkknght.Plugins.lsp-config.utils").set_handlers()

local lsp_config = require("lspconfig")
function lsp_config.common_on_attach(client, bufnr)
	require("Drkknght.Plugins.lsp-config.utils").documentHighlight(client, bufnr)
end

local on_attach = require("Drkknght.Plugins.lsp-config.utils").attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- emmet
require("Drkknght.Plugins.lsp-config.web").emmet(capabilities, on_attach)

-- lua_ls
require("Drkknght.Plugins.lsp-config.lua").lua_ls(capabilities, on_attach)

-- html
require("Drkknght.Plugins.lsp-config.web").html(capabilities, on_attach)

-- typescript
require("Drkknght.Plugins.lsp-config.web").typescript(capabilities, on_attach)

-- gopls
require("Drkknght.Plugins.lsp-config.gopls").gopls(capabilities, on_attach)

-- ansible
require("Drkknght.Plugins.lsp-config.misc").ansible(capabilities, on_attach)

-- pyright
require("Drkknght.Plugins.lsp-config.pyright").pyright(capabilities, on_attach)

-- clangd
require("Drkknght.Plugins.lsp-config.clangd").clangd(capabilities, on_attach)

-- cssls
require("Drkknght.Plugins.lsp-config.web").cssls(capabilities, on_attach)

-- vimls
require("Drkknght.Plugins.lsp-config.misc").vimls(capabilities, on_attach)

-- bashls
require("Drkknght.Plugins.lsp-config.misc").bashls(capabilities, on_attach)

-- yamlls
require("Drkknght.Plugins.lsp-config.misc").yamlls(capabilities, on_attach)
