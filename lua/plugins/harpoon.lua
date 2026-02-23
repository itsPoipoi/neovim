return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>hh",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Menu",
        },
        {
          "<leader>hn",
          function()
            local harpoon = require("harpoon")
            harpoon:list():prev()
          end,
          desc = "Go to Prev Harpoon",
        },
        {
          "<leader>hr",
          function()
            local harpoon = require("harpoon")
            harpoon:list():next()
          end,
          desc = "Go to Next Harpoon",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Go to Harpoon " .. i,
        })
      end
      return keys
    end,
  },
}
