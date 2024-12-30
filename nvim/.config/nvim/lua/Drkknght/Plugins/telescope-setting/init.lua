--------------------------------- telescope-config -----------------------------

-- setup telescope for genearl use
local project_actions = require("telescope._extensions.project.actions")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
local _actions = require("telescope._extensions.project.actions")
local fb_actions = require("telescope").extensions.file_browser.actions
local action_state = require("telescope.actions.state")
local fb_utils = require("telescope._extensions.file_browser.utils")
local _git = require("telescope._extensions.project.git")
local _utils = require("telescope._extensions.project.utils")
-- vim.api.nvim_set_keymap('i','<C-p>',_actions.change_working_directory,{noremap = true,silent = true})
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<c-o>"] = action_layout.toggle_preview,
				["<c-e>"] = actions.close,
				["<c-l>"] = actions.select_all,
				["<c-q>"] = actions.drop_all,
				["<c-j>"] = actions.toggle_selection + actions.move_selection_next,
				["<c-k>"] = actions.toggle_selection + actions.move_selection_previous,
				["<c-i>"] = actions.toggle_selection,
			},
			i = {
				["<c-j>"] = actions.toggle_selection + actions.move_selection_next,
				["<c-k>"] = actions.toggle_selection + actions.move_selection_previous,
				["<c-o>"] = action_layout.toggle_preview,
				["<c-l>"] = actions.select_all,
				["<c-q>"] = actions.drop_all,
				["<c-e>"] = actions.close,
				["<C-s>"] = actions.smart_send_to_qflist,
				["<c-i>"] = actions.toggle_selection,
				["<C-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
		layout_config = {
			-- width = 0.75,
			height = 0.6,
			prompt_position = "top",
			preview_cutoff = 80,
			-- horizontal = {mirror = false,width=0.7},
			vertical = { mirror = true, width = 0.8 },
		},
		shorten_path = true,
		vimgrep_arguments = {
			"rg",
			-- "--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		prompt_position = "top",
		-- debounce = 100,
		prompt_prefix = " ",
		border = true,
		preview = {
			hide_on_startup = true,
		},
		selection_caret = " ",
		hl_result_eol = true,
		color_devicons = true,
		path_display = { "truncate" },
		file_ignore_patterns = { "%.git", "node_modules/.*" },
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
		-- layout_strategy = "flex",
		previewer = true,
		-- file_sorter = require("telescope.sorters").get_fzf_sorter,
		-- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_cursor({}),
		},
		file_browser = {
			depth = false,
			files = false,
			grouped = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					["<C-d>"] = fb_actions.create,
					["<C-y>"] = function()
						local path = function(prompt_bufnr)
							return action_state.get_selected_entry(prompt_bufnr).value
						end
						local path = path()
						local projects = _utils.get_project_objects()
						local path_not_in_projects = true

						local file = io.open(_utils.telescope_projects_file, "w")
						for _, project in pairs(projects) do
							if project.path == path then
								project.activated = 1
								path_not_in_projects = false
							end
							_utils.store_project(file, project)
						end

						if path_not_in_projects then
							local new_project = _utils.get_project_from_path(path)
							_utils.store_project(file, new_project)
						end

						io.close(file)
						print("Project added: " .. path)
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

-- load telescope helper extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("ui-select")

-- telescope browser bookmarks
require("browser_bookmarks").setup({
	selected_browser = "brave",
	url_open_command = "xdg-open >file.txt",
})
