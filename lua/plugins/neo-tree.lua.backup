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

    keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<CR>", { desc = "Toggle Neotree explorer" })
    keymap.set("n", "<C-S-e>", "<cmd>Neotree float toggle filesystem<CR>", { desc = "Float Neotree explorer" })
    -- keymap.set("n", "<A-b>", "<cmd>Neotree float toggle buffers<CR>", { desc = "Float Neotree buffers" })
    -- keymap.set("n", "<A-g>", "<cmd>Neotree float toggle git_status<CR>", { desc = "Float Neotree git" })
  end,
}
