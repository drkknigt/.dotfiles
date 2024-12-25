-- hightlight colors for bufferline

local highlight = {
	fill = {
		fg = "#1C1C1C",
		bg = "#1C1C1C",
	},
	background = {
		fg = "#585858",
		bg = "#1C1C1C",
	},
	--        tab = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        tab_selected = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        tab_separator = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        tab_separator_selected = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--            sp = '<colour-value-here>',
	--            underline = '<colour-value-here>',
	--        },
	--        tab_close = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	close_button = {
		fg = "#1C1C1C",
		bg = "#313131",
	},
	close_button_visible = {
		fg = "#313131",
		bg = "green",
	},
	close_button_selected = {
		fg = "white",
		bg = "#313131",
	},
	buffer_visible = {
		fg = "white",
		bg = "#313131",
	},
	buffer_selected = {
		fg = "white",
		bg = "#313131",
		bold = true,
		italic = true,
	},
	numbers = {
		fg = "#585858",
		bg = "#1C1C1C",
	},
	numbers_visible = {
		fg = "white",
		bg = "#313131",
	},
	numbers_selected = {
		--fg = '#313131',
		bg = "#313131",
		bold = true,
		italic = true,
	},
	diagnostic = {
		--fg = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	diagnostic_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	diagnostic_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		bold = true,
		italic = true,
	},
	hint = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	hint_visible = {
		----fg = '<colour-value-here>',
		bg = "#313131",
	},
	hint_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	hint_diagnostic = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	hint_diagnostic_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	hint_diagnostic_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	info = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	info_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	info_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	info_diagnostic = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	info_diagnostic_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	info_diagnostic_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	warning = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	warning_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	warning_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	warning_diagnostic = {
		--fg = '<colour-value-here>',
		--sp = '<colour-value-here>',
		bg = "#1C1C1C",
	},
	warning_diagnostic_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	warning_diagnostic_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	error = {
		--fg = '<colour-value-here>',
		bg = "#1C1C1C",
		--sp = '<colour-value-here>',
	},
	error_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	error_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	error_diagnostic = {
		--fg = '<colour-value-here>',
		bg = "#1C1C1C",
		--sp = '<colour-value-here>',
	},
	error_diagnostic_visible = {
		--fg = '<colour-value-here>',
		bg = "#313131",
	},
	error_diagnostic_selected = {
		--fg = '<colour-value-here>',
		bg = "#313131",
		--sp = '<colour-value-here>',
		bold = true,
		italic = true,
	},
	modified = {
		fg = "white",
		bg = "#1C1C1C",
	},
	modified_visible = {
		fg = "white",
		bg = "#313131",
	},
	modified_selected = {
		--fg = 'orange',
		bg = "#313131",
	},
	duplicate_selected = {
		fg = "white",
		bg = "#313131",
		italic = true,
	},
	duplicate_visible = {
		fg = "white",
		bg = "#313131",
		italic = true,
	},
	duplicate = {
		fg = "white",
		bg = "#1C1C1C",
		italic = true,
	},
	separator_selected = {
		fg = "#1C1C1C",
		bg = "#313131",
	},
	separator_visible = {
		fg = "#1C1C1C",
		bg = "#313131",
	},
	separator = {
		fg = "#1C1C1C",
		bg = "#1C1C1C",
	},
	--        indicator_visible = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        indicator_selected = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        pick_selected = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--            bold = true,
	--            italic = true,
	--        },
	--        pick_visible = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--            bold = true,
	--            italic = true,
	--        },
	--        pick = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--            bold = true,
	--            italic = true,
	--        },
	--        offset_separator = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--        },
	--        trunc_marker = {
	--            fg = '<colour-value-here>',
	--            bg = '<colour-value-here>',
	--    }
}

-- bufferline setup

local bufferline = require("bufferline")
bufferline.setup({
	highlights = highlight,
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
		--themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
		--numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		numbers = "both",
		close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			--style = 'icon' | 'underline' | 'none',
			style = "icon",
		},
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		name_formatter = function(buf) -- buf contains:
			-- name                | str        | the basename of the active file
			-- path                | str        | the full path of the active file
			-- bufnr (buffer only) | int        | the number of the active buffer
			-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
			-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		--diagnostics = false | "nvim_lsp" | "coc",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				--text_align = "left" | "center" | "right",
				text_align = "left",
				separator = true,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "insert_after_current",
	},
})
