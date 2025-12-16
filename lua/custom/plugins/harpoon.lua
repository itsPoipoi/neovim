return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  'ThePrimeagen/harpoon',
  enabled = true,
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        enter_on_sendcmd = false,
        excluded_filetypes = { 'harpoon', 'alpha', 'dashboard', 'gitcommit' },
        mark_branch = false,
        save_on_change = true,
        save_on_toggle = true,
        sync_on_ui_close = true,
        tmux_autoclose_windows = false,
      },
    }

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- List mappings
    vim.keymap.set('n', '<leader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon' })
    vim.keymap.set('n', '<leader>E', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open Tele-Harpoon' })
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add to Harpoon' })
    -- vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end, { desc = "Remove from Harpoon" })

    -- Selection mappings
    vim.keymap.set('n', '<A-r>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<A-t>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<A-i>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<A-u>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<A-a>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<A-n>', function()
      harpoon:list():next()
    end)
  end,
}
