return {
  "j-hui/fidget.nvim",
  -- tag = "legacy",
  -- event = "LspAttach",
  opts = {
    -- text = {
    --   spinner = "dots_negative",
    -- },
    -- progress = {
    --   poll_rate = 0,                -- How and when to poll for progress messages
    --   suppress_on_insert = false,   -- Suppress new messages while in insert mode
    --   ignore_done_already = false,  -- Ignore new tasks that are already complete
    --   ignore_empty_message = false, -- Ignore new tasks that don't contain a message
    --   notification_group =          -- How to get a progress message's notification group key
    --     function(msg) return msg.lsp_client.name end,
    --   ignore = {},                  -- List of LSP servers to ignore
    --   display = {
    --     progress_icon = { pattern = "dots", period = 1 },
    --     skip_history = true,        -- Whether progress notifications should be omitted from history
    --     -- format_message =            -- How to format a progress message
    --     --   require("fidget.progress.display").default_format_message,
    --     format_annote =             -- How to format a progress annotation
    --       function(msg) return msg.title end,
    --     format_group_name =         -- How to format a progress notification group's name
    --       function(group) return tostring(group) end,
    --   },
    -- },
    -- notification = {
    --   window = {
    --     winblend = 0, -- 투명도 제거 (테스트용으로 명확히 보이게)
    --     border = "rounded",
    --   },
    -- },
    -- Options related to integrating with other plugins
    -- integration = {
    --   ["nvim-tree"] = { enable = false, }, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
    -- },
  -- Options related to logging
    logger = {
      level = vim.log.levels.WARN,  -- Minimum logging level
      max_size = 10000,             -- Maximum log file size, in KB
      float_precision = 0.01,       -- Limit the number of decimals displayed for floats
      path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")), -- Where Fidget writes its logs to
      -- path = vim.fn.stdpath("cache") .. "/fidget.nvim.log",
    },
  },
}
