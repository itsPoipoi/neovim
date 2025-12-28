return {
  -- Load all theme plugins but don't apply them
  -- This ensures all colorschemes are available for hot-reloading
  {
    "bjarneo/aether.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    priority = 1000,
  },
  {
    "ficcdaf/ashen.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_bg = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = true,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "tahayvr/sunset-drive.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/ethereal.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
  },
  {
    "tahayvr/matteblack.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
  },
}
