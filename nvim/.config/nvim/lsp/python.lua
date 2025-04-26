return {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
		settings = {
			python = {
				analysis = {
					autoSearchPaths = false,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "strict",
					-- loglevel = { "Error" },
					extraPaths = { "$HOME/.local/lib/python3.10/site-packages/" },
				},
			},
		},
		single_file_support = true,
	}


