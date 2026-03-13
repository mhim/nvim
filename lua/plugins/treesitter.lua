return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "windwp/nvim-ts-autotag" },
  init = function()
    -- Register bash parser for zsh BEFORE the plugin loads.
    vim.treesitter.language.register("bash", "zsh")
    -- Manually start treesitter for zsh buffers since the alias doesn't auto-attach.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "zsh",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- v0.9 had a "configs" module (plural) which is now gone.
    package.preload["nvim-treesitter.configs"] = function()
      return {
				is_enabled = function(module_name, _)
          return module_name == "highlight"
        end,
        -- Add other commonly used v0.9 functions if necessary
        get_module = function(_)
          return { enable = true }
        end,
        ft_to_lang = function(ft)
          local get_lang = vim.treesitter.language.get_lang
          return get_lang and get_lang(ft) or ft
        end,
      }
    end
  end,

  config = function()
    -- Backward compatibility shim for telescope.nvim and other plugins
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok then
      parsers.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
      end
      parsers.is_enabled = function() return true end
      parsers.get_parser = vim.treesitter.get_parser
    end

    local ensure_installed = {
      "c",
      "cpp",
      "lua",
      "python",
      "toml",
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

    -- v1.x API: setup() only accepts install_dir. highlight/indent/etc are NOT supported.
    require("nvim-treesitter").setup({})

    local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
    if autotag_ok then autotag.setup() end

    -- Disable treesitter for large files to prevent performance issues.
    vim.api.nvim_create_autocmd("BufReadPost", {
      group = vim.api.nvim_create_augroup("TreesitterLargeFileGuard", { clear = true }),
      callback = function(args)
        local buf_name = vim.api.nvim_buf_get_name(args.buf)
        if buf_name == "" then return end
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, buf_name)
        if ok and stats and stats.size > max_filesize then
          vim.treesitter.stop(args.buf)
        end
      end,
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
        -- If parser is not found, attempt auto-install if we have a valid treesitter parser for it
        if not pcall(vim.treesitter.get_parser, bufnr, lang) then
          local ts_parsers = require("nvim-treesitter.parsers")
          if ts_parsers[lang] then
            require("nvim-treesitter.install").install({ lang })
          end
        end
      end,
    })
  end,
}
