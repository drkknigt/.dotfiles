return {
        cmd = { "bash-language-server", "start" },
    filetypes = {"bash","sh","zshrc"},
		flags = { debounce_text_changes = 150 },
    settings = {
  bashIde = {
    globPattern = "*@(.sh|.inc|.bash|.command)"
  }
},
    single_file_support = true
}
