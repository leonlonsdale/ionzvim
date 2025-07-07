return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	build = "cargo +nightly build --release",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = false },
			list = {
				selection = {
					-- stops it auto-selecting first option
					-- since enter selects with my settings, this is needed
					-- otherwise you can accidentally select an option when trying to move to a new line.
					preselect = false,
					auto_insert = true,
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust" },
	},
	opts_extend = { "sources.default" },
}
