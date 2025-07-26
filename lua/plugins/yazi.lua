return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("yazi").setup({
			open_for_directories = true,
		})
	end,
}
