return function()
	ionzvim.lsp.add_config("gopls", {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					unreachable = true,
				},
				staticcheck = true,
				usePlaceholders = true,
				completeUnimported = true,
			},
		},
	})

	-- Configure golangci_lint_ls
	ionzvim.lsp.add_config("golangci_lint_ls", {})

	-- Formatter: goimports
	ionzvim.formatters.add_formatter("go", { "goimports" })
end
