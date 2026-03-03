return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- tag = "v0.9.3",  -- last stable release with pre-compiled binary downloads
	event = { "BufReadPost", "BufNewFile" },
	-- lazy = false,
	dependencies = { "windwp/nvim-ts-autotag" },
	init = function()
		-- Register bash parser for zsh BEFORE the plugin loads.
		vim.treesitter.language.register("bash", "zsh")

		-- Manually start treesitter for zsh buffers since the alias doesn't auto-attach.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "zsh",
			callback = function()
				-- Silently skip if the bash parser is not yet compiled/installed.
				pcall(vim.treesitter.start)
			end,
		})
	end,
	config = function()
		local ensure_installed = {
			"c",
			"cpp",
			"lua",
			"python",
			"json",
			"javascript",
			"yaml",
			"html",
			"css",
			"bash",
			"vim",
			"dockerfile",
			"gitignore",
			"vimdoc",
		}

		-- v1.x API: `setup` is minimal. We manually trigger installation of missing parsers.
		require("nvim-treesitter").setup({
			-- install_dir = ..., -- only field supported in v1.x setup
		})

		-- Manually install defined parsers if they are missing.
		require("nvim-treesitter.install").install(ensure_installed)

		-- Implement basic "auto_install" behavior for new filetypes.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local bufnr = args.buf
				local ft = vim.bo[bufnr].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft
				local parsers = require("nvim-treesitter.parsers")
				if not pcall(vim.treesitter.get_parser, bufnr, lang) then
					-- If parser is not found, attempt auto-install if we have a valid treesitter parser for it
					if parsers[lang] then
						require("nvim-treesitter.install").install({ lang })
					end
				end
			end,
		})
	end,

}
