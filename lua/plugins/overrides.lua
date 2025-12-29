return {
  {
    "folke/which-key.nvim",
    opts = { preset = "classic" },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sort_case_insensitive = true,

      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            -- vim.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },

      filesystem = {
        window = {
          mappings = {
            ["o"] = "system_open",
          },
        },
      },

      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- Linux: open file in default application
          vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
      },
    },
  },
}
