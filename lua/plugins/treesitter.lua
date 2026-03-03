return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	tag = "v0.9.3",  -- last stable release with pre-compiled binary downloads
	event = { "BufReadPost", "BufNewFile" },
	-- lazy = false,
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"python",
				"json",
				"javascript",
				"yaml",
				"html",
				"css",
				-- "graphql",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"vimdoc",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-Space>",
					node_incremental = "<TAB>",
					scope_incremental = false,
					node_decremental = "<S-TAB>",
				},
			},
		})
		-- Register bash parser for zsh since no dedicated zsh parser exists
		vim.treesitter.language.register("bash", "zsh")
	end,
}
