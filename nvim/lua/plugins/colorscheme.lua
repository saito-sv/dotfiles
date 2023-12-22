return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		setup = function()
			return {
				variant = "main",
				dark_variant = "main",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,
				groups = {
					background = "base",
					background_nc = "_experimental_nc",
					panel = "surface",
					panel_nc = "base",
					border = "highlight_med",
					comment = "muted",
					link = "iris",
					punctuation = "subtle",

					error = "love",
					hint = "iris",
					info = "foam",
					warn = "gold",

					headings = {
						h1 = "iris",
						h2 = "foam",
						h3 = "rose",
						h4 = "gold",
						h5 = "pine",
						h6 = "foam",
					},
					-- or set all headings at once
					-- headings = 'subtle'
				},
				highlight_groups = {
					-- Blend colours against the "base" background
					CursorLine = { bg = "love", blend = 10 },
					StatusLine = { fg = "love", bg = "iris", blend = 10 },
					-- By default each group adds to the existing config.
					-- If you only want to set what is written in this config exactly,
					-- you can set the inherit option:
					Search = { bg = "gold", inherit = false },
				},
			}
		end,
	},
}
