return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local neotree = require("neo-tree")

    neotree.setup({
      source_selector = {
        winbar = true,
        statusline = true,
      },
    })
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<S-e>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree explorer" })
    keymap.set("n", "<S-b>", "<cmd>Neotree buffers<CR>", { desc = "Move buffers tab in Neotree" })
    -- keymap.set("n", "<leader>en", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree explorer" })
    -- keymap.set("n", "<leader>eb", "<cmd>Neotree buffers<CR>", { desc = "Move buffers tab in Neotree" })
  end,
}
