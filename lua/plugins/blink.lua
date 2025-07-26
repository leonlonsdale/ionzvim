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

		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				menu = {
					auto_show = true,
				},
			},
		},

		signature = { enabled = true },

		completion = {
			documentation = { auto_show = false },
			list = {
				selection = {
					-- stops it auto-selecting first option
					-- since enter selects with my settings, this is needed
					-- otherwise you can accidentally select an option when trying to move to a new line.
					preselect = false,
					auto_insert = false,
				},
			},
			ghost_text = {
				enabled = true,
			},
			menu = {
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
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
