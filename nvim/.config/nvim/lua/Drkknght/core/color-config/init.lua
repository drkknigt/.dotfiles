-----------------------------------------color-config----------------------------------------------

local api = vim.api

local sign_define = vim.fn.sign_define

vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.api.nvim_command("colorscheme gruvbox-baby")

---------------------------------------------Editor highlights-------------------------------------

api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
api.nvim_set_hl(0, "LineNr", { fg = "#ed9f2b" })
api.nvim_set_hl(0, "WinBar", { fg = "#B16283" })
api.nvim_set_hl(0, "CursorLineNr", { fg = "#b8afae" })
api.nvim_set_hl(0, "SignColumn", { bg = "None" })
api.nvim_set_hl(0, "ColorColumn", { bg = "#ed9f2b" })
api.nvim_set_hl(0, "Visual", { bg = "#264F78", ctermbg = 242 })
api.nvim_set_hl(0, "Normal", { bg = "None", fg = "None" })
api.nvim_set_hl(0, "FloatBorder", { fg = "Orange", bg = "None" })
api.nvim_set_hl(0, "DiagnosticError", { fg = "#ed9f2b", ctermfg = 1 })
api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bg = "None" })
api.nvim_set_hl(0, "LineHighlight", { bg = "darkgray", ctermbg = "darkgray" })
api.nvim_set_hl(0, "QuickFixLine", { bg = "#b5820c", fg = "Black" })
api.nvim_set_hl(0, "LineHighlight", { bg = "#264F78", ctermbg = 242 })
api.nvim_set_hl(0, "Statusline", { bg = "Black", fg = "gray" })
api.nvim_set_hl(0, "StatusLineTerm", { bg = "Black", fg = "gray" })
api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "green" })

---------------------------------------------plugins highlights------------------------------------

-- flash word hop highlights

api.nvim_set_hl(0, "FlashLabel", { fg = "None", bg = "None" })
api.nvim_set_hl(0, "FlashMatch", { fg = "None", bg = "None" })
api.nvim_set_hl(0, "FlashCurrent", { fg = "None", bg = "None" })
vim.cmd("hi link FlashMatch None")
vim.cmd("hi link FlashCurrent None")
vim.cmd("hi link FlashLabel None")

-- telescope highlights

api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePromptCounter", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "None", fg = "white" })
api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "None", fg = "white" })

-- git signs highlights

api.nvim_set_hl(0, "GitSignsAdd", { fg = "green" })
api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangedeleteLn" })
api.nvim_set_hl(0, "GitSignsChangedelelteLn", { link = "GitSignsChangedeleteLn" })
api.nvim_set_hl(0, "GitSignsChangedelelteNr", { link = "GitSignsChangedeleteNr" })
api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteLn" })
api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteNr" })
api.nvim_set_hl(0, "GitSignsChange", { fg = "blue" })
api.nvim_set_hl(0, "GitSignsDelete", { fg = "red" })
api.nvim_set_hl(0, "GitSignsAddstatus", { fg = "green", bg = "black" })
api.nvim_set_hl(0, "GitSignsChangestatus", { fg = "blue", bg = "black" })
api.nvim_set_hl(0, "GitSignsDeletestatus", { fg = "red", bg = "black" })

-- cmp highlights

api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6", bg = "None" })
api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C586C0", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE", bg = "None" })
api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4", bg = "None" })

-- matchit highlights

api.nvim_set_hl(0, "MatchParenCur", { bg = bg, fg = "white" })
api.nvim_set_hl(0, "MatchParen", { bg = "lightblue", fg = "Black" })

-- indentblankline highlights

api.nvim_set_hl(0, "IndentBlankLineSpaceChar", { fg = "gray" })
api.nvim_set_hl(0, "IndentBlankLineChar", { fg = "gray" })

-- which key highlights

api.nvim_set_hl(0, "WhichKeyFloat", { fg = "None", bg = "None" })

-- colorscheme highlights

api.nvim_set_hl(0, "GruvboxYellowSign", { fg = "#fabb2f", bg = "None" })
api.nvim_set_hl(0, "GruvboxRedSign", { fg = "#fb4934", bg = "None" })
api.nvim_set_hl(0, "GruvboxAquaSign", { fg = "#8ec07c", bg = "None" })
api.nvim_set_hl(0, "GruvboxBlueSign", { fg = "#83a598", bg = "None" })


-- highlights for lsp warn, hint , info , error


vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "Orange" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "Blue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "Green" })


-- blink.cmp highlights

api.nvim_set_hl(0, "PmenuKind", { bg = "None" })
api.nvim_set_hl(0, "Pmenu", { bg = "None" })
