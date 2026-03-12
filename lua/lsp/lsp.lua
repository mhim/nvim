return {
  {
    "hrsh7th/cmp-nvim-lsp",
    -- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
      {
        "folke/lazydev.nvim", ft = "lua", -- only load on lua files
        opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
      },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  },
}
