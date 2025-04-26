-- local cmd = vim.api.nvim_create_user_command
-- local command = vim.api.nvim_command
-- local buffer_delete = vim.api.nvim_buf_delete

-- table of helper functions
local M = {}

-- delete all buffers but the current one lua function

M.kill_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current_buf then
            pcall(vim.api.nvim_buf_delete, buf, { force = true })
        end
    end
end

-- delete empty buffers

M.kill_empty = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf) == "" then
            pcall(vim.api.nvim_buf_delete, buf, { force = true })
        end
    end
end

-- run commands in tmux pane

M.run_tmux_pane_commands = function(input)
    if not os.getenv("TMUX") then
        print("Not inside a tmux session")
        return
    end

    if input == "" then
        return
    end

    local panes = tonumber(vim.fn.system("tmux list-panes | wc -l"))
    local active_pane = vim.fn.trim(vim.fn.system("tmux display -p '#{pane_index}'"))
    local current_dir = vim.loop.cwd()

    if panes < 2 then
        os.execute("tmux kill-pane -a -t " .. active_pane)
        os.execute("tmux split-window -h")
        os.execute("tmux last-pane")
    end

    vim.cmd([[silent VtrAttachToPane]])
    vim.cmd("VtrSendCommandToRunner cd " .. current_dir)
    vim.cmd("VtrSendCommandToRunner " .. input)
end

vim.api.nvim_create_user_command(
    "RunTmux", -- Command name
    function(opts)
        M.run_tmux_pane_commands(opts.args)
    end,                                -- Command callback
    {
        nargs = "*",                    -- Number of arguments (0 or 1 in this case)
        complete = "shellcmdline",      -- Completion type (e.g., 'file' for file paths)
        desc = "Say hello to someone!", -- Command description
    }
)

-- run current line in tmux pane

M.run_tmux_pane_lines = function()
    if not os.getenv("TMUX") then
        print("Not inside a tmux session")
        return
    end

    local total_panes = tonumber(vim.fn.system("tmux list-panes | wc -l"))
    if total_panes and total_panes < 2 then
        os.execute("tmux split-window -h")
        os.execute("tmux last-pane")
    end

    vim.cmd([[silent VtrAttachToPane]])
    vim.cmd("VtrSendLinesToRunner")
end

-- oil function to toggle oil window

M.toggle_oil = function()
    for _, buf in ipairs(vim.fn.tabpagebuflist()) do
        if vim.bo[buf].filetype == "oil" then
            vim.cmd("bd! " .. buf)
            return
        end
    end
    vim.cmd("vsplit | wincmd H")
    require("oil").open()
end

-- change buffer while updating oil

M.change_buffer = function(cmd)
    vim.cmd(cmd)
    for _, buf in ipairs(vim.fn.tabpagebuflist()) do
        if vim.bo[buf].filetype == "oil" then
            vim.cmd("bd! " .. buf)
            M.toggle_oil()
            vim.cmd("wincmd l")
            break
        end
    end
end


-- open previously saved session
M.open_previous_session = function()
    vim.cmd("source $HOME/.textedit/nvim/early.vim")
    M.kill_empty()
end

-- search files in dotfiles with telescope
M.search_dotfiles = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
        file_ignore_patterns = { "%.git", "node_modules/.*", "BraveSoftware/" },
        layout_config = {
            height = 0.6,
        },
        prompt_title = "Dotfiles",
        search_dirs = { "~/.dotfiles", "~/.cache/tmux" },
        hidden = true,
    }))
end

-- search files in stdpath for plugins with telescope
M.search_plugins = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
        file_ignore_patterns = { "%.git", "node_modules/.*", "BraveSoftware/" },
        layout_config = {
            height = 0.6,
        },
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        prompt_title = "Search Plugins",
        hidden = true,
    }))
end

-- search files in arch and mint ansible bootstrap with telescope
M.search_ansible = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
        file_ignore_patterns = { "%.git" },
        layout_config = {
            height = 0.6,
        },
        prompt_title = "Arch-Mint-ansible",
        search_dirs = { "~/.ansible_sync", "~/arch-pull" },
        hidden = true,
    }))
end

-- make backup of lazy snapshots with telescope
local function copy_lazy_to_snapshots()
    local snapshot_dir = vim.fn.stdpath("config") .. "/snapshots"
    local snapshot = snapshot_dir .. os.date("/%B-%d-%Y-Time-%H:%M:%S-lazy.json")
    local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
    vim.loop.fs_copyfile(lockfile, snapshot)
end

local back_up_lazy = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local selected_file = action_state.get_selected_entry()
    local actions = require("telescope.actions")
    actions.close(prompt_bufnr)
    copy_lazy_to_snapshots()
    local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
    vim.loop.fs_copyfile(selected_file[1], lockfile)
    vim.cmd("Lazy restore")
end

M.backup_lazy = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
        prompt_title = "Lazy Snapshots",
        attach_mappings = function(_, map)
            map("n", "<cr>", back_up_lazy)
            map("i", "<cr>", back_up_lazy)
            return true
        end,
        search_dirs = { "~/.dotfiles/nvim/.config/nvim/snapshots" },
        layout_config = {
            height = 0.6,
        },
        path_display = { "tail" },
        wrap_results = true,
    }))
end

--- open oil via telescope in choosen directory with telescope
local function open_oil_telescope(prompt_bufnr)
    local actions = require("telescope.actions")
    local selected_file = require("telescope.actions.state").get_selected_entry().value
    actions.close(prompt_bufnr)
    vim.cmd("Oil " .. selected_file)
    vim.cmd("cd " .. selected_file)
end

M.open_dir_telescope = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
        prompt_title = "Goto Directory",
        attach_mappings = function(_, map)
            map("n", "<cr>", open_oil_telescope)
            map("i", "<cr>", open_oil_telescope)
            return true
        end,
        search_dirs = { "$HOME" },
        layout_config = {
            height = 0.6,
        },
        wrap_results = true,
        find_command = { "fd", "--type", "d", "--hidden", "--max-depth", "11" },
    }))
end

-- search for dotfiles with fzf
M.open_dotfiles_fzf = function()
    require("fzf-lua").files({
        prompt      = "  ",
        fzf_opts    = {
            ["--border-label"] = " Dotfiles ",
            ["--border"] = "top",
            ["--no-separator"] = "",
        },
        file_icons  = true,
        cmd         =
        "fdfind . $HOME/.dotfiles --type f --absolute-path -H --exclude .git --exclude .wine",
        fdfind_opts = "--absolute-path",
        actions     = {
            -- Use fzf-lua builtin actions or your own handler
            ["default"] = require("fzf-lua").actions.file_edit,
            ["ctrl-y"] = function(selected, opts)
                print("selected item:", selected[1])
            end,
        },
    })
end

-- search for arch-pull and ansible_sync with fzf
M.open_ansible_fzf = function()
    require("fzf-lua").files({
        prompt = "  ",
        fzf_opts = {
            ["--border-label"] = " Arch-Mint-ansible ",
            ["--border"] = "top",
            ["--no-separator"] = "",
        },
        cmd =
        "fdfind . $HOME/.ansible_sync/ $HOME/arch-pull/ --type f --absolute-path -H --exclude .git --exclude .wine",
        actions = {
            -- Use fzf-lua builtin actions or your own handler
            ["default"] = require("fzf-lua").actions.file_edit,
            ["ctrl-y"] = function(selected, opts)
                print("selected item:", selected[1])
            end,
        },
    })
end

-- search from installed plugins via fzf
M.open_plugins_fzf = function()
    local cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
    require("fzf-lua").files({
        prompt = "  ",
        cmd = "fdfind . " .. cwd .. " --type f --absolute-path -H -d 11",
        fzf_opts = {
            ["--border-label"] = " Search Plugins ",
            ["--border"] = "top",
            ["--no-separator"] = "",
        },
        actions = {
            -- Use fzf-lua builtin actions or your own handler
            ["default"] = require("fzf-lua").actions.file_edit,
            ["ctrl-y"] = function(selected, opts)
                print("selected item:", selected[1])
            end,
        },
    })
end


-- open oil via fzf lua in choosen directory
M.open_dir_fzf = function()
    local fzf = require("fzf-lua")
    require("fzf-lua").files({
        prompt   = "  ",
        fzf_opts = {
            ["--border-label"] = " Goto Directory ",
            ["--border"] = "top",
            ["--no-separator"] = "",
        },
        cmd      = "fdfind . $HOME --type d --absolute-path -H --exclude .git --exclude .wine",
        actions  = {
            -- ["default"] = function(selected)
            --     local current_dir = string.sub(selected[1], 7)
            --     -- vim.cmd("echo " .. current_dir)
            --     vim.cmd("e " .. current_dir)
            --     vim.cmd("cd " .. current_dir)
            -- end,
            ["ctrl-y"] = function(selected, opts)
                vim.cmd("e " .. selected[1])
                vim.cmd("cd " .. selected[1])
            end,
        },
    })
end

-- search files with fzf

M.fzf_search_files = function(dir)
    local current_dir = vim.loop.cwd()
    local label = " find-files "
    if dir == "Home" then
        current_dir = "~"
        label = " find-files-home "
    end
    require("fzf-lua").fzf_exec("fd . " .. current_dir .. " -t f -H -a", {
        prompt = "  ",
        fzf_opts = {
            ["--border-label"] = label,
        },
        actions = {
            -- Use fzf-lua builtin actions or your own handler
            ["default"] = function(selected)
                vim.cmd("e " .. selected[1])
                -- vim.cmd("cd " .. selected[1])
            end,
        },
    })
end

-- get total buffers opened in session

M.total_buffers = function()
    return #vim.tbl_filter(function(bufnr)
        -- return vim.api.nvim_buf_get_option(bufnr, "buflisted")
        return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
    end, vim.api.nvim_list_bufs())
end

-- get current buffer number
M.buffer_number = function()
    local current_buf_no = vim.api.nvim_get_current_buf()
    local buffer_table = vim.tbl_filter(function(bufnr)
        -- return vim.api.nvim_buf_get_option(bufnr, "buflisted")
        return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
    end, vim.api.nvim_list_bufs())
    for i, j in pairs(buffer_table) do
        if j == current_buf_no then
            return string.format("Buffer No: " .. tostring(i))
        end
    end
end

-- functions for oil mapping to open buffer

M.open_buffer = function()
    local oil = require("oil")
    local file_name = oil.get_current_dir() .. oil.get_cursor_entry().name
    if vim.fn.isdirectory(file_name) == 1 then
        require("oil.actions").select.callback()
    else
        vim.cmd("edit " .. file_name)
        vim.cmd("wincmd o")
    end
end

-- function to create a flaoting terminal with a command

M.make_term = function(command, orientation, callback, width, height)
    local ui = vim.api.nvim_list_uis()[1]
    local ui_width, ui_height = ui.width, ui.height
    local title_text = vim.split(command, " ")[1]

    -- Set default width and height if not provided
    width = width or 0.7
    height = height or 0.7

    -- Calculate floating window dimensions and position
    local win_width = math.floor(ui_width * width)
    local win_height = math.floor(ui_height * height)
    local col = math.floor((ui_width - win_width) / 2)
    local row = math.floor((ui_height - win_height) / 3)

    -- Create a buffer for the terminal window
    local buf = vim.api.nvim_create_buf(false, true)

    -- Set window options based on orientation
    local win_opts = {}

    if orientation == "split" then
        win_opts = { vertical = false, win = 0 }
    elseif orientation == "vert" then
        win_opts = { vertical = true, win = 0 }
    elseif orientation == "float" then
        win_opts = {
            relative = "editor",
            width = win_width,
            height = win_height,
            title = title_text,
            title_pos = "center",
            col = col,
            row = row,
            style = "minimal",
            border = "rounded",
        }
    else
        error("Unknown orientation option")
    end

    -- Open the terminal window
    vim.api.nvim_open_win(buf, true, win_opts)
    vim.fn.jobstart(command or vim.o.shell, { term = true })

    -- Call callback if provided
    if callback then
        callback()
    end
end

-- function that runs current file in terminal accoding to its type
M.code_runner = function(orientation)
    local file_path = vim.fn.expand("%:p")
    local file_name = vim.fn.expand("%")
    local language_table = {
        ["python"] = "python3 " .. file_path,
        ["typescript"] = "deno run " .. file_path,
        ["javascript"] = "node " .. file_path,
        ["markdown"] = "glow " .. file_path,
        ["python"] = "python3 " .. file_path,
        -- ["rust"] = "rustc " .. file_path .. " && " .. " ./ && rm $fileBase",
        ["cpp"] = "g++ " .. file_path .. " -o " .. file_name .. ".out" .. "  && " .. "./" .. file_name .. ".out",
        ["c"] = "gcc " .. file_path .. " -o " .. file_name .. ".out" .. "  && " .. "./" .. file_name .. ".out",
        ["go"] = "go run " .. file_path,
        ["sh"] = "sh " .. file_path,
        ["lua"] = "lua5.3 " .. file_path,
        ["sh"] = "bash " .. file_path,
        ["bash"] = "bash " .. file_path,
        ["zsh"] = "zsh " .. file_path,
        ["java"] = "java " .. file_path,
    }
    local file_type = vim.bo.filetype
    M.make_term(language_table[file_type] or "exit", orientation, function()
        vim.cmd("stopinsert")
    end, 0.7, 0.7)
end

-- delete buffers from telescope builtin buffer

M.list_buffers_telescope = function()
    local actions_state = require("telescope.actions.state")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
        sort_mru = true,
        layout_config = {
            width = 1,
            height = 0.6,
            anchor = "SE",
        },
        attach_mappings = function(prompt_bufnr, map)
            local delete_buf = function()
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                current_picker:delete_selection(function(selection)
                    vim.cmd("bd! " .. tostring(selection.bufnr))
                end)
            end

            map("n", "<c-d>", actions.delete_buffer)
            map("i", "<c-d>", actions.delete_buffer)
            -- map("i", "<c-d>", delete_buf)

            return true
        end,
    }))
end

M.list_buffers = function()
    local actions_state = require("telescope.actions.state")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    require("telescope.builtin").buffers(require("telescope.themes").get_ivy({
        sort_mru = true,
        layout_config = {
            width = 1,
            height = 0.6,
            anchor = "SE",
        },
        attach_mappings = function(prompt_bufnr, map)
            local delete_buf = function()
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                current_picker:delete_selection(function(selection)
                    vim.cmd("bd! " .. tostring(selection.bufnr))
                end)
            end

            map("n", "<c-d>", actions.delete_buffer)
            map("i", "<c-d>", actions.delete_buffer)
            -- map("i", "<c-d>", delete_buf)

            return true
        end,
    }))
end

-- make winbar
M.get_winbar = function(global)
    if global == "global" then
        return
        ": %F   󱕱  %{%v:lua.require('Drkknght.core.userFunctions').buffer_number()%} 󰉻 Total buffers:%{%v:lua.require('Drkknght.core.userFunctions').total_buffers()%}"
    elseif global == "status" then
        return "%{%v:lua.require('Drkknght.core.statusline').current()%}"
    else
        local string_value = " "
        vim.api.nvim_set_option_value("winbar", string_value, { scope = "local" })
    end
end

-- singature pop up

M.ToggleSignatureHelp = function()
    for _, win in pairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.zindex == 1002 then
            vim.api.nvim_win_close(win, true)
            return
        end
    end
    vim.lsp.buf.signature_help({ border = "single", width = 80, zindex = 1002 })
end


-- list current listed buffers with fzf

M.delete_buffers_fzf = function()
    -- split string on space
    local function split_on_space(input)
        local words = {}
        for word in string.gmatch(input, "%S+") do
            table.insert(words, word)
        end
        return words
    end

    -- make buffers table filled with listed buffers
    local current_buf = vim.api.nvim_get_current_buf()
    local current_name = vim.api.nvim_buf_get_name(current_buf)

    local buffers = {}
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) then
            local name = vim.api.nvim_buf_get_name(bufnr)
            if name == "" then
                table.insert(buffers, string.format("%s%5s%s", "[no_name]", "", bufnr))
            else
                table.insert(buffers, string.format("%s%5s%s", name, "", bufnr))
            end
        end
    end

    -- Reorder so that current buffer is first
    table.sort(buffers, function(a, b)
        if a == string.format("%s%5s%s", current_name, "", current_buf) then return true end
        if b == string.format("%s%5s%s", current_name, "", current_buf) then return false end
        return false -- preserve relative order otherwise
    end)


    -- fzf-lua buffer picker
    require 'fzf-lua'.fzf_exec(buffers, {
        prompt  = "buffers ",
        winopts = {
            title = "buffer-picker",
            title_pos = "center", -- options: left, center, right
        },
        actions = {
            -- Use fzf-lua builtin actions or your own handler
            ["default"] = function(selected)
                local table_string = split_on_space(selected[1])
                vim.cmd("b " .. table_string[2])
            end,
            ["ctrl-x"] = function(selected)
                local table_string = split_on_space(selected[1])
                vim.cmd("bd! " .. table_string[2])
                require("Drkknght.core.userFunctions").delete_buffers_fzf()
            end,
        },
    })
end


-- return functions
return M
