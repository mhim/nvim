---@diagnostic disable: missing-fields
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
      -- ignores empty lines
      ignore = "^$",
      toggler = {
        ---Line-comment toggle keymap override '//'
        line = "//",
        ---Block-comment toggle keymap
        block = "gbc",
      },
    })
  end,

  -- Default Keymap
  -- 'gcc' - Line-comment toggle keymap
  -- 'gbc' - Block-comment toggle keymap
  -- 'gcO' - Add comment on the line above
  -- 'gco' - Add comment on the line below
  -- 'gcA' - Add comment at the end of line

  -- # Linewise
  --
  -- `gcw` - Toggle from the current cursor position to the next word
  -- `gc$` - Toggle from the current cursor position to the end of line
  -- `gc}` - Toggle until the next blank line
  -- `gc5j` - Toggle 5 lines after the current cursor position
  -- `gc8k` - Toggle 8 lines before the current cursor position
  -- `gcip` - Toggle inside of paragraph
  -- `gca}` - Toggle around curly brackets
  --
  -- # Blockwise
  --
  -- `gb2}` - Toggle until the 2 next blank line
  -- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
  -- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)
  --
}
