return {
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>f+",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Yazi: Current",
      },
      {
        -- Open in the current working directory
        "<leader>f-",
        "<cmd>Yazi cwd<cr>",
        desc = "Yazi: CWD",
      },
      {
        "<c-=>",
        "<cmd>Yazi toggle<cr>",
        desc = "Last Yazi Session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      keymaps = {
        show_help = "<f2>",
        open_file_in_tab = "<s-m-c-t>",
        cycle_open_buffers = "<s-tab>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
