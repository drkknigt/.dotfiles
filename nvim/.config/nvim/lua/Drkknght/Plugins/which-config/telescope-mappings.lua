TELESCOPE_MAPPINGS = {
    -- Telescope
    { "<leader>s",  group = "Telescope" },
    {
        "<leader>st",
        function()
            require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Symbols outline",
    },
    {
        "<leader>sm",
        function()
            require("telescope.builtin").help_tags(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "help tags",
    },
    {
        "<leader>sd",
        require("Drkknght.core.userFunctions").open_dir_telescope,
        desc = "open directory in oil via telescope",
    },
    {
        "<leader>so",
        function()
            require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Open Recent File",
    },
    {
        "<leader>sf",
        function()
            require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "find files",
    },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    {
        "<leader>sk",
        function()
            require("telescope.builtin").keymaps(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Keymaps",
    },
    {
        "<leader>sC",
        function()
            require("telescope.builtin").commands(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Commands",
    },
    {
        "<leader>sp",
        function()
            require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
                prompt_title = "Search files from Tmux Project Root",
                cwd = "$PROJECT_ROOT",
                hidden = true,
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Search files from Tmux project root",
    },
    {
        "<leader>sg",
        function()
            require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({
                prompt_title = "Live Grep Project Root",
                cwd = "$PROJECT_ROOT",
                hidden = true,
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "live grep from Tmux project root",
    },
    {
        "<leader>sr",
        function()
            vim.cmd("cd $PROJECT_ROOT")
            local project_dir = vim.fn.expand("$PROJECT_ROOT")
            vim.cmd("Oil" .. project_dir)
        end,
        desc = "Open tmux project root directory",
    },
    {
        "<leader>sq",
        function()
            require("telescope.builtin").quickfix(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Quickfix",
    },
    {
        "<leader>si",
        function()
            require("telescope").extensions.bookmarks.bookmarks(require("telescope.themes").get_ivy({
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Bookmarks",
    },
    {
        "<leader>se",
        function()
            require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_ivy({
                prompt_title = "Explorer",
                files = true,
                grouped = true,
                depth = 1,
                hidden = true,
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "file-browser-current",
    },
    {
        "<leader>ss",
        function()
            require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({
                hidden = true,
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Grep",
    },
    {
        "<leader>sb",
        function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
                prompt_title = "lines",
                hidden = true,
                layout_config = {
                    height = 0.6,
                },
            }))
        end,
        desc = "Buffer lines",
    },
    { "<leader>sh", require("Drkknght.core.userFunctions").search_dotfiles, desc = "search dotfiles" },
    { "<leader>sa", require("Drkknght.core.userFunctions").search_ansible,  desc = "search ansible-sync" },
    { "<leader>sw", require("Drkknght.core.userFunctions").search_plugins,  desc = "search ansible-sync" },
    {
        "<leader>sc",
        function()
            require("fzf-lua").blines({
                fzf_opts = {
                    ["--query"] = vim.fn.expand("<cword>"),
                    ["--exact"] = "",
                    ["--border-label"] = " lines ",
                },
                cmd = "rg --fixed-strings --word-regexp", -- Exact match options for ripgrep
                search = vim.fn.expand("<cword>"),        -- Default search term (current word under cursor)
                previewer = "bat",                        -- Previewer for files (optional)
            })
        end,
        desc = "paste",
    },
}
return TELESCOPE_MAPPINGS
