-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Genarated by lightline to lualine theme converter
-- https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- stylua: ignore
local colors = {
  color9   = '#3b0825',
  -- color9   =None,
  color8   = 'white',
}

return {
  visual = {
    a = { fg = colors.color8, bg = colors.color9, gui = 'bold' },
    b = { fg = colors.color8, bg = colors.color9 },
  },
  replace = {
    a = { fg = colors.color8, bg = colors.color9, gui = 'bold' },
    b = { fg = colors.color8, bg = colors.color9 },
  },
  inactive = {
    c = { fg = colors.color8, bg = colors.color9 },
    a = { fg = colors.color8, bg = colors.color9, gui = 'bold' },
    b = { fg = colors.color8, bg = colors.color9 },
  },
  normal = {
    c = { fg = colors.color8, bg = colors.color9 },
    a = { fg = colors.color8, bg = 'black', gui = 'bold' },
    b = { fg = colors.color8, bg = colors.color9 },
  },
  insert = {
    a = { fg = colors.color8, bg = colors.color9, gui = 'bold' },
    b = { fg = colors.color8, bg = colors.color9 },
  },
}
