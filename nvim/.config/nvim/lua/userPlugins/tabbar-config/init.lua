require('bufferline').setup{
    options = {
diagnostics = "nvim_lsp",},
numbers = function(opts)
    return string.format('%s|%s.)', opts.id, opts.raise(opts.ordinal))
  end,
offsets = {
    {filetype = "NvimTree",
    text = "File Explorer",
    highlight = "Directory",
    text_align = "center"
        }
},
    show_buffer_icons = false,
highlights = {
    fill = {
        guibg = "#2A2A2A",},
  },
  separator_style = "slant",
 

}
