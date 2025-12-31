return {
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
        {
          "<A-a>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():prev()
          end,
          desc = "Harpoon to Prev File",
        },
        {
          "<A-n>",
          function()
            local harpoon = require("harpoon")
            harpoon:list():next()
          end,
          desc = "Harpoon to Next File",
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
}
