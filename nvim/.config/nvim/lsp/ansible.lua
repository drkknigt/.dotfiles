return {
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml.ansible" },
		settings = {
			ansible = {
				ansible = {
					path = "ansible",
				},
				executionEnvironment = {
					enabled = false,
				},
				python = {
					interpreterPath = "python",
				},
				validation = {
					enabled = true,
					lint = {
						enabled = true,
						path = "ansible-lint",
					},
				},
			},
		},
		flags = { debounce_text_changes = 150 },
	}
