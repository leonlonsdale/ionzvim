return function()
	local inlay_hints = {
		includeInlayEnumMemberValueHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayParameterNameHints = "all",
		includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayVariableTypeHintsWhenTypeMatchesName = true,
	}

	ionzvim.lsp.add_config("vtsls", {
		settings = {
			complete_function_calls = true,
			vtsls = {
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
			},
			typescript = {
				updateImportOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
				},
				tsserver = {
					maxTsServerMemory = 12288,
				},
				inlayHints = inlay_hints,
			},
			javascript = { inlayHints = inlay_hints },
		},
	})

	ionzvim.formatters.add_formatter("typescript", { "biome" })
	ionzvim.formatters.add_formatter("typescriptreact", { "biome" })
	ionzvim.formatters.add_formatter("javascript", { "biome" })
	ionzvim.formatters.add_formatter("javascriptreact", { "biome" })

	ionzvim.formatters.add_formatter_config("biome", { prepend_args = { "check", "--unsafe", "--write" } })

	ionzvim.linters.add_linter("typescript", { "biome", "eslint_d" })
	ionzvim.linters.add_linter("javascrypt", { "biome", "eslint_d" })
	ionzvim.linters.add_linter("typescriptreact", { "biome", "eslint_d" })
	ionzvim.linters.add_linter("javacriptreact", { "biome", "eslint_d" })
end
