vim.o.completeopt = "menuone,noselect"
local cmp = require("cmp")
local lspkind = require("lspkind")
local types = require("cmp.types")

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
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		}),
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
		["<C-q>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-v>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-n>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behaviour = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		["<C-p>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behaviour = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-b>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-Space>"] = cmp.mapping({
			i = function()
				if cmp.visible() then
					-- require("notify")("visible")
					cmp.abort()
				else
					-- require("notify")("not visible")
					cmp.complete()
				end
			end,
			c = function()
				if cmp.visible() then
					-- require("notify")("visible")
					cmp.close()
				else
					-- require("notify")("not visible")
					cmp.complete()
				end
			end,
		}),
		["<C-f>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		-- {name = 'cmp_tabnine'},
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "treesitter" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		debounce = 2,
	}, {
		{ name = "cmdline", keyword_pattern = [=[[^[:blank:]\!]*]=] },
		debounce = 2,
	}),
})
require("luasnip.loaders.from_vscode").lazy_load()
