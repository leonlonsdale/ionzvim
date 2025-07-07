return function()
	ionzvim.lsp.add_config("jsonls", {})
	ionzvim.formatters.add_formatter("json", { "prettier" })
end
