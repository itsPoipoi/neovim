return {
  {
    "folke/which-key.nvim",
    opts = { preset = "modern" },
  },

  {
    "ThePrimeagen/harpoon",
    keys = function()
      local keys = {
        {
          "<leader>a",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Menu",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<A-" .. i .. ">",
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
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

        components = {
          harpoon_index = function(config, node, _)
            local harpoon_list = require("harpoon"):list()
            local path = node:get_id()
            local harpoon_key = vim.uv.cwd()

            for i, item in ipairs(harpoon_list.items) do
              local value = item.value
              if string.sub(item.value, 1, 1) ~= "/" then
                value = harpoon_key .. "/" .. item.value
              end

              if value == path then
                vim.print(path)
                return {
                  text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
                  highlight = config.highlight or "NeoTreeDirectoryIcon",
                }
              end
            end
            return {}
          end,
        },

        renderers = {
          file = {
            { "icon" },
            { "name", use_git_status_colors = true },
            { "harpoon_index" }, --> This is what actually adds the component in where you want it
            { "diagnostics" },
            { "git_status", highlight = "NeoTreeDimText" },
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
