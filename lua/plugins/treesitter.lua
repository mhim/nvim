return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- event = "VeryLazy",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		-- configure treesitter
		require("nvim-treesitter.configs").setup({
			sync_install = false,
      auto_install = true,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
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
    -- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
	end,
}
