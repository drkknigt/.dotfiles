------------------------------------------cmp-config-----------------------------------------------

vim.o.completeopt = "menuone,noselect"

-- setup cmp
local cmp = require("cmp")
local lspkind = require("lspkind")
local types = require("cmp.types")
local prefered_sources = {
	{ name = "nvim_lsp" },
	{ name = "luasnip" }, -- For luasnip users.
	{ name = "treesitter" },
	{ name = "buffer" },
	{ name = "buffer-lines" },
}

-- toggle cmp function
local cmp_enabled = true
local cmp_toggle = function()
	if cmp_enabled then
		-- Disable cmp by setting the sources to an empty table
		cmp.setup({ enabled = false })
		cmp.abort()
	else
		-- Enable cmp by restoring the default behavior
		cmp.setup({ enabled = true })
		cmp.complete()
	end
	cmp_enabled = not cmp_enabled
end

cmp.setup({
	completion = {
		-- The minimum length of a word to complete on
		keyword_length = 1,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
	-- view = {
	--     -- entries = 'native'
	-- },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			menu = { -- showing type in menu
				nvim_lsp = "(LSP)",
				path = "(Path)",
				treesitter = "(Treesitter)",
				buffer = "(Buffer)",
				["buffer-lines"] = "(Buffer-lines)",
				luasnip = "(LuaSnip)",
			},
			mode = "symbol", -- show only symbol annotations
			maxwidth = 20, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = true,

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		}),
		-- duplicates = {
		-- 	buffer = 1,
		-- 	path = 1,
		-- 	nvim_lsp = 0,
		-- 	luasnip = 1,
		-- },
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		["<C-v>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }), { "i", "c" }),
		-- disable cmp or enable cmp
		["<C-space>"] = cmp.mapping({
			i = cmp_toggle,
			c = cmp_toggle,
		}),

		["<C-b>"] = cmp.mapping({
			i = cmp.mapping.abort(),
		}),
		["<C-f>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = prefered_sources,
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		debounce = 2,
	}, {
		{ name = "cmdline", debounce = 2 },
	}, {
		{ name = "buffer-lines" },
		debounce = 2,
	}),
})

require("luasnip.loaders.from_vscode").lazy_load()
