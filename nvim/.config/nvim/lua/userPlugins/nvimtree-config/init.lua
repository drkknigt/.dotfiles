-- require'nvim-tree'.setup({
--
--   update_focused_file = {
--     enable = true,
--     update_cwd = true,
--   },
-- })
-- require'nvim-tree'.setup {
--   disable_netrw       = true,
--   hijack_netrw        = true,
--   open_on_setup       = true,
--   ignore_ft_on_setup  = {},
--   auto_close          = true,
--   auto_open           = true,
--   open_on_tab         = 1,
--   hijack_cursor       = true,
--   update_cwd          = false,
--   indent_markers      = true,
--   update_to_buf_dir   = {
--     enable = true,
--     auto_open = false,
--   },
--   diagnostics = {
--     enable = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
--   update_focused_file = {
--     enable      = true,
--     update_cwd  = false,
--     ignore_list = {}
--   },
--   system_open = {
--     cmd  = nil,
--     args = {}
--   },
--   filters = {
--     dotfiles = false,
--     custom = {}
--   },
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     auto_resize = false,
--     mappings = {
--       custom_only = false,
--       list = {}
--     }
--   }
-- }
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons =

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	respect_buf_cwd = true,
	hijack_netrw = true,
	sort_by = "name",
	-- open_on_setup = false,
	-- ignore_ft_on_setup = {
	-- 	"startify",
	-- 	"dashboard",
	-- 	"alpha",
	--        "telescope",
	-- },
	-- auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	-- enable = true,
	-- auto_open = true,
	-- },
	--   error
	--   info
	--   question
	--   warning
	--   lightbulb
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
		show_on_dirs = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		signcolumn = "yes",
		-- height = 30,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "u", cb = tree_cb("dir_up") },
				{ key = "e", cb = tree_cb("cd") },
				{ key = "z", cb = tree_cb("split") },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	-- quit_on_open = 0,
	-- git_hl = 1,
	-- disable_window_picker = 0,
	-- root_folder_modifier = ":t",
	-- show_icons = {
	--   git = 1,
	--   folders = 1,
	--   files = 1,
	--   folder_arrows = 1,
	--   tree_width = 30,
	-- },
})
