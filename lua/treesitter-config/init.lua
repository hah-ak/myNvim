require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"css",
		"dockerfile",
		"hcl",
		"html",
		"http",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"regex",
		"ruby",
		"rust",
		"toml",
		"vim",
		"yaml",
		"zig",
		"java",
		"typescript",
		"tsx",
        "markdown_inline"
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
require("hlargs").setup()
