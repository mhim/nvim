-- Shared exclude list for indent-related plugins.
local exclude_ft = {
  "help",
  "alpha",
  "dashboard",
  "neo-tree",
  "NvimTree",
  "Trouble",
  "trouble",
  "lazy",
  "mason",
  "notify",
  "toggleterm",
  "lazyterm",
  "lspinfo",
  "checkhealth",
}

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { enabled = false },
      exclude = { filetypes = exclude_ft },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1E2D3D" })
      require("ibl").setup(opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = exclude_ft,
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = function()
      return {
        symbol = "▏",
        draw = {
          delay = 50,
          animation = require("mini.indentscope").gen_animation.quadratic({
            easing = "out",
            duration = 150,
            unit = "total",
          }),
        },
        options = { try_as_border = true },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#7aa2f7" })
      require("mini.indentscope").setup(opts)
    end,
  },
}
