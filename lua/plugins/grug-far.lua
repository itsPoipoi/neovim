return {
  -- Search & replace in current file
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
      {
        "<leader>r",
        function()
          local grug = require("grug-far")
          grug.open({
            transient = true,
            prefills = {
              paths = vim.fn.expand("%"),
            },
          })
        end,
        mode = { "n", "x" },
        desc = "Replace in File",
      },
    },
  },
}
