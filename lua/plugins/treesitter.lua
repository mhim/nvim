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

		-- Backward compatibility shim for telescope.nvim and other plugins
		-- that still expect the old v0.9 parsers.ft_to_lang API.
		-- This needs to be in init to be available when other plugins load.
		local ok, parsers = pcall(require, "nvim-treesitter.parsers")
		if ok then
			parsers.ft_to_lang = function(ft)
				return vim.treesitter.language.get_lang(ft) or ft
			end
			-- Some plugins also expect is_enabled on the parsers module
			parsers.is_enabled = function()
				return true
			end
			-- telescope.nvim expects get_parser to exist on this module
			parsers.get_parser = vim.treesitter.get_parser
		end

		-- v0.9 had a "configs" module (plural) which is now gone.
		-- Many plugins still try to require it.
		package.preload["nvim-treesitter.configs"] = function()
			return {
				is_enabled = function(module_name, _lang)
					-- Telescope typically checks if 'highlight' is enabled.
					if module_name == "highlight" then
						return true
					end
					return false
				end,
				-- Add other commonly used v0.9 functions if necessary
				get_module = function(_)
					return { enable = true }
				end,
			}
		end
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
			highlight = {
				enable = true,
				-- Disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
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
