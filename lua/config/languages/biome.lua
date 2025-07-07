return function()
	ionzvim.lsp.add_config("biome", {})
	ionzvim.formatters.add_formatter_config("biome", {
		prepend_args = {
			"check",
			"--unsafe",
			"--write",
		},
	})
end
