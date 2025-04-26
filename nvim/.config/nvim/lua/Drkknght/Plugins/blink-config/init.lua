local blink_cmp = require("blink.cmp")

local toggle_cmp = function()
    if blink_cmp.is_visible() then
        blink_cmp.hide()
        vim.b.completion = false
    else
        vim.b.completion = true
        blink_cmp.show()
    end
end


blink_cmp.setup({

    keymap = {
        preset = "none",
        ["<C-f>"] = { "accept" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-v>"] = { "scroll_documentation_down", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    },
    appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
        trigger = {
            show_on_keyword = true,
        },
        keyword = { range = 'full' },
        menu = {
            enabled = true,
            min_width = 20,
            max_height = 20,
            border = "single",
            auto_show = true,
            winblend = 0,
            draw = {
                treesitter = {
                    'lsp', 'buffer', 'path'
                },
                columns = {
                    { "kind_icon",  gap = 1 },
                    { "label",      "label_description", gap = 1 },
                    { "source_name" },
                },
            },
        },
        list = {
            cycle = { from_bottom = true, from_top = true },
            selection = {
                auto_insert = false,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 10,
            window = {
                border = "single",
                winblend = 0,
            },
        },
        ghost_text = { enabled = true },
    },
    signature = { window = { border = "single" } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { "lsp", "path", "snippets", "buffer", },
        min_keyword_length = 1,
    },
    cmdline = {
        keymap = {
            --   -- recommended, as the default keymap will only show and select the next item
            -- preset = "inherit",
            ['<C-n>'] = {
                'show_and_insert',
                'select_next',
            },
            ["<Backspace>"] = {
                function(cmp)
                    if not cmp.is_visible() then
                        cmp.show()
                    end
                end,
                "fallback"
            },
            ["<C-h>"] = {
                function(cmp)
                    if not cmp.is_visible() then
                        cmp.show()
                    end
                end,
                "fallback"
            },
            ['<C-space'] = { 'show', 'hide', },
        },
        completion = {
            menu = { auto_show = true },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
        },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
})

vim.keymap.set("i", "<C-space>", function()
    toggle_cmp()
end, { desc = "disable blink" })
