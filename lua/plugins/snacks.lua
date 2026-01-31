return {
  "folke/snacks.nvim",
  -- Global keymaps
  keys = {
    { "<leader>/", LazyVim.pick("grep", { hidden = true }), desc = "Grep (Root Dir)" },
    { "<leader><space>", LazyVim.pick("files", { hidden = true }), desc = "Find Files (Root Dir)" },
    { "<leader>ff", LazyVim.pick("files", { hidden = true }), desc = "Find Files (Root Dir)" },
    { "<leader>fF", LazyVim.pick("files", { root = false, hidden = true }), desc = "Find Files (cwd)" },
  },

  opts = {
    dashboard = {
      preset = {
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files', { hidden = true })",
          },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep', { hidden = true })",
          },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },

    -- Smooth scrolling default state
    scroll = {
      enabled = false,
    },

    -- Indent line animations
    indent = {
      animate = {
        duration = {
          step = 10,
          total = 250,
        },
      },
    },
  },
}
