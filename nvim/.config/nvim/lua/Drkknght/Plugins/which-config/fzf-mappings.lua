local FZF_MAPPINGS = {
    -- fzf
    { "<leader>s",  group = "Fzf" },
    {
        "<leader>st",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").lsp_document_symbols({
                fzf_opts = {
                    ["--border-label"] = " LSP Document symbols ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "show lsp symbols in fzf ",
    },
    {
        "<leader>sd",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            vim.cmd("set noshowmode")
            require("Drkknght.core.userFunctions").open_dir_fzf(math.floor(vim.api.nvim_win_get_height(0) / 2.3))
            vim.cmd("set showmode")
        end,
        desc = "open directory via fzf in oil",
    },
    {
        "<leader>so",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").oldfiles({
                fzf_opts   = {
                    ["--border-label"] = " Oldfiles ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt     = "  ",
                file_icons = true,
            })
        end,
        desc = "find old files fzf",
    },
    { "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "resume fzflua" },
    {
        "<leader>sm",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").helptags({
                fzf_opts = {
                    ["--border-label"] = " Help ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "help",
    },
    {
        "<leader>sk",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").keymaps({
                fzf_opts = {
                    ["--border-label"] = " key maps ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "search keymaps",
    },
    {
        "<leader>sC",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").commands({
                fzf_opts = {
                    ["--border-label"] = " Commands ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "Search Commands",
    },
    {
        "<leader>sp",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").files({
                fzf_opts = {
                    ["--border-label"] = " Search files from Tmux Project Root ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
                cwd = "$PROJECT_ROOT"
            })
        end,
        desc = "Search files in Project_Root of tmux",
    },
    {
        "<leader>sg",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").live_grep({
                fzf_opts = {
                    ["--border-label"] = " Live grep from Project root ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
                cwd = "$PROJECT_ROOT"
            })
        end,
        desc = "Search Commands",
    },
    {
        "<leader>sr",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            vim.cmd("cd $PROJECT_ROOT")
            local project_dir = vim.fn.expand("$PROJECT_ROOT")
            vim.cmd("Oil" .. project_dir)
        end,
        desc = "Open tmux project root directory",
    },
    {
        "<leader>sq",
        -- "<cmd>FzfLua git_files fzf_opts.--border-label=git-files prompt=<Space><Space><cr>",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").quickfix({
                fzf_opts = {
                    ["--border-label"] = " quickfx list ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "Search quickfix list entries",
    },
    {
        "<leader>ss",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").live_grep({
                fzf_opts = {
                    ["--border-label"] = " live grep ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "live grep",
    },
    {
        "<leader>sc",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").colorschemes({
                fzf_opts = {
                    ["--border-label"] = " colorscheme ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "colorschemes",
    },
    {
        "<leader>sb",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").blines({
                fzf_opts = {
                    ["--border-label"] = " lines ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "fzf lines buffers",
    },
    {
        "<leader>sl",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("fzf-lua").lines({
                fzf_opts = {
                    ["--border-label"] = " buffer-lines ",
                    ["--border"] = "top",
                    ["--no-separator"] = "",
                },
                prompt = "  ",
            })
        end,
        desc = "fzf lines search on all buffers",
    },
    {
        "<leader>sh",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").open_dotfiles_fzf()
        end,
        desc = "find files fzf from dotfiles directory",
    },
    {
        "<leader>sa",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").open_ansible_fzf()
        end,
        desc = "find files fzf from dotfiles directory",
    },
    {
        "<leader>sn",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").open_plugins_fzf()
        end,
        desc = "find files in plugins dir",
    },
    {
        "<leader>sf",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").fzf_search_files("current")
        end,
        -- ":lua require('fzf-lua').files({cwd = '~'})<CR>",
        desc = "find files fzf from current directory",
    },
    {
        "<leader>se",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").fzf_search_files("Home")
        end,
        -- ":lua require('fzf-lua').files({cwd = '~'})<CR>",
        desc = "find files fzf from home directory",
    },
    {
        "<leader>o",
        function()
            vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { silent = true })
            require("Drkknght.core.userFunctions").delete_buffers_fzf()
        end,
        desc = "search Buffers",
    },
}

return FZF_MAPPINGS
