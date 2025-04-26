LSP_MAPPINGS = {
    -- lsp
    { "<leader>l",  group = "lsp" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {
        "<leader>ld",
        "<cmd>lua vim.diagnostic.setloclist()<cr>",
        desc = "list Document Diagnostics in quickfix list",
    },
    -- c = { "<cmd>Codeium Enable<cr>", "enable codeium" },
    -- b = { "<cmd>Codeium Disable<cr>", "disable codeium" },
    { "<leader>lx", "<cmd>silent !chmod +x %<cr>",                                    desc = "make current file executable" },
    {
        "<leader>lw",
        "<cmd>lua vim.diagnostic.setqflist()<cr>",
        desc = "list Workspace Diagnostics in quickfix list",
    },
    -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    { "<leader>li", "<cmd>checkhealth lsp<cr>",                                       desc = "lsp Info" },
    { "<leader>lI", "<cmd>Mason<cr>",                                                 desc = "Mason-Installer Info" },
    -- j = {
    -- "<cmd>lua vim.diagnostic.goto_next({scope='line',float={border='single'}})<CR>",
    -- "Next Diagnostic",
    -- },
    { "<leader>lk", "<cmd>pwd<cr>",                                                   desc = "current directory name" },
    { "<leader>lh", "<cmd>cd $PROJECT_ROOT<cr>",                                      desc = "change director to root directory of tmux session" },
    { "<leader>lp", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "goto-preview" },
    { "<leader>ll", "<cmd>LspStart<CR>",                                              desc = "Start lsp" },
    { "<leader>lq", "<cmd>LspStop<CR>",                                               desc = "Stop lsp" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>",                          desc = "document references" },
    { "<leader>lg", "<cmd>lua vim.lsp.buf.implementation()<cr>",                      desc = "document implementation" },
    -- r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    -- f = { "<cmd>Lspsaga lsp_finder<cr>", "lsp finder" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<cr>",                     desc = "list Document Symbols in quickfix list" },
    {
        "<leader>le",
        "<cmd>lua vim.diagnostic.open_float(0,{scope='line',border='single'})<cr>",
        desc = "list document errors in quickfix list",
    },
    {
        "<leader>lS",
        "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
        desc = "list workspace Symbols in quickfix list",
    },
    { "<leader>lu", "<cmd>UndotreeToggle<cr>",                                  desc = "show undo tree log" },
    { "<C-s>",      require("Drkknght.core.userFunctions").ToggleSignatureHelp, desc = "toggle signature_help", mode = { "n", "i" } },
    { "gd",         function() vim.lsp.buf.definition() end,                    desc = "goto definition",       mode = { "n" } },
    { "gD",         function() vim.lsp.buf.type_definition() end,               desc = "goto type definition",  mode = { "n" } },
    { "K",          function() vim.lsp.buf.hover({ border = "single" }) end,    desc = "hover lsp float",       mode = { "n" } },
    -- S = {
    --   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --   "Workspace Symbols",
    -- },
}

return LSP_MAPPINGS
