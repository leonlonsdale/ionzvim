return function()
	ionzvim.lsp.add_config("marksman", {})
	ionzvim.linters.add_linter("markdown", { "markdownlint-cli2" })
	ionzvim.formatters.add_formatter("markdown", { "markdown-toc" })
end
