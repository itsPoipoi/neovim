return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>o", group = "opencode" },
          { "<leader>p", group = "paste" },
          { "<leader>h", group = "harpoon" },
        },
      },
    },
  },
}
