local plugins = {
	{
		"ellisonleao/carbon-now.nvim",
		lazy = true,
		cmd = "CarbonNow",
		opts = {},
		keys = {
			{
				"z",
				"<cmd>CarbonNow<CR>",
				desc = "Carbon Now (Visual)",
				mode = "v", -- Visual mode
				silent = true, -- Suppress command output
			},
		},
	},
}
return plugins
