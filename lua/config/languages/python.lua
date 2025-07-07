return function()
	ionzvim.lsp.add_config("basedpyright", {
		settings = {
			basedpyright = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "basic",
				},
				autoImportCompletions = true,
				disableOrganizeImports = true,
			},
		},
	})

	ionzvim.lsp.add_config("ruff", {
		init_options = {
			settings = {
				configuration = "~/.config/ruff/ruff.toml",
				logLevel = "debug",
			},
		},
	})
end
