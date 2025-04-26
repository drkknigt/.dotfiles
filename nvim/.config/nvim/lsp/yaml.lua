return {
        cmd = {"yaml-language-server","--stdio"},
    filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
    settings  = {
  redhat = {
    telemetry = {
      enabled = false
    }
  }
},
    single_file_support = true,
		flags = { debounce_text_changes = 150 },
}
