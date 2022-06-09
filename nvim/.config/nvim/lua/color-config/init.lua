local api = vim.api
--vim.g.gruvbox_baby_function_style = "NONE"
--vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
--vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.api.nvim_command("colorscheme gruvbox-baby")
api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
api.nvim_set_hl(0, "LineNr", { fg = "#ed9f2b" })
api.nvim_set_hl(0, "WhichKeyFloat", { fg = "None" })
-- api.nvim_set_hl(0,'Search',{bg='#ed9f2b'})
api.nvim_set_hl(0, "Cursor", { bg = bg })
api.nvim_set_hl(0, "CursorLineNr", { fg = "#b8afae" })
api.nvim_set_hl(0, "SignColumn", { bg = "None" })
api.nvim_set_hl(0, "ColorColumn", { bg = "#ed9f2b" })
api.nvim_set_hl(0, "HopNextKey", { bg = "None", fg = "#ff007c", bold = true, ctermfg = 198, cterm = bold })
api.nvim_set_hl(0, "HopNextKey1", { bg = "None", fg = "#00dfff", bold = true, ctermfg = 45, cterm = bold })
api.nvim_set_hl(0, "HopNextKey2", { bg = "None", fg = "#2b8db3", bold = true, ctermfg = 33 })
api.nvim_set_hl(0, "HopUnmatched", { bg = bg, sp = "#666666", fg = "#666666", bold = true, ctermfg = 242 })
api.nvim_set_hl(0, "GitSignsAdd", { fg = "green" })
api.nvim_set_hl(0, "GitSignsChange", { fg = "blue" })
api.nvim_set_hl(0, "GitSignsDelete", { fg = "red" })
api.nvim_set_hl(0, "Visual", { bg = "#264F78", ctermbg = 242 })
api.nvim_set_hl(0, "IndentBlankLineSpaceChar", { fg = "gray" })
api.nvim_set_hl(0, "IndentBlankLineChar", { fg = "gray" })
api.nvim_set_hl(0, "Normal", { bg = "None", fg = "None" })
api.nvim_set_hl(0, "FloatBorder", { fg = "Orange", bg = "None" })
api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6", bg = "None" })
api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C586C0", bg = "None" })
api.nvim_set_hl(0, "DiagnosticError", { fg = "#335fcb", ctermfg = 1 })
api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4", bg = "None" })
api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#D4D4D4" })
api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#79491D" })
api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#4F6752" })
api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#8B8B8B" })
api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#4F3552" })
api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#F70067" })
api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#F79000" })
api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#A9FF68" })
api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#8B8B8B" })
api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#D484FF" })
api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#F70067" })
api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#F79000" })
api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#A9FF68" })
api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#8B8B8B" })
api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#D484FF" })
api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bg = "None" })
api.nvim_set_hl(0, "NotifyTRACEBody", { bg = "None", fg = "#ff007c", bold = true, ctermfg = 198, cterm = bold })
api.nvim_set_hl(0, "NotifyWARNBody", { bg = "None", fg = "#ff007c", bold = true, ctermfg = 198, cterm = bold })
api.nvim_set_hl(0, "NotifyINFOBody", { bg = "None", fg = "#ff007c", bold = true, ctermfg = 198, cterm = bold })
api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = "None", fg = "#ff007c", bold = true, ctermfg = 198, cterm = bold })
--api.nvim_set_hl(0,'NotifyERRORBody',)
api.nvim_set_hl(0, "LineHighlight", { bg = "darkgray", ctermbg = "darkgray" })
api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptCounter", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "QuickFixLine", { bg = "#b5820c", fg = "Black" })
api.nvim_set_hl(0, "MatchParenCur", { bg = bg, fg = "white" })
api.nvim_set_hl(0, "MatchParen", { bg = "red", fg = "Black" })
api.nvim_set_hl(0, "LineHighlight", { bg = "#264F78", ctermbg = 242 })
api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#ed9f2b" })
api.nvim_set_hl(0, "NvimTreeOpenedFile", { bg = "#773347" })
api.nvim_set_hl(0, "lualine_b_insert", { bg = None })
-- api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "red", gui = undercurl, cterm = undercurl })
