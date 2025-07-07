---@diagnostic disable-next-line: deprecated
local unpack = unpack or table.unpack -- unpack is depracated. table.unpack is the new standard

return function()
	ionzvim.lsp.add_config("lua_ls", {
		settings = {
			Lua = {
				runtime = { version = "Lua 5.4" },
				workspace = {
					checkThirdParty = false,
					-- Tells lua_ls where to find all the Lua files that you have loaded
					-- for your neovim configuration.
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
				},
				telemetry = { enabled = false },
			},
		},
	})

	ionzvim.formatters.add_formatter("lua", { "stylua" })
end
