-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<S-A-a>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<S-A-n>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<S-A-r>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<S-A-t>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status' })
vim.keymap.set('n', '<leader>gn', "<cmd>diffget //2<CR>", { desc = 'Choose Left Diff' })
vim.keymap.set('n', '<leader>gr', "<cmd>diffget //3<CR>", { desc = 'Choose Right Diff' })

-- Remap for Ergo-L:
vim.keymap.set({ 'n', 'v' }, '+', 'gj')
vim.keymap.set({ 'n', 'v' }, '-', 'gk')
vim.keymap.set('n', ',', ';')
vim.keymap.set('n', ';', ',')
vim.keymap.set('n', 'U', '<C-r>')
-- Command history
vim.keymap.set('n', 'Q', 'q:')

-- (Shift+) Enter to create empty lines
vim.keymap.set('n', '<A-o>', '@="m`o<C-V><Esc>``"<CR>')
vim.keymap.set('n', '<A-O>', '@="m`O<C-V><Esc>``"<CR>')

-- Center vertical jumps:
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-c>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zzzv')
vim.keymap.set('n', '#', '#zzzv')

-- Blazingly Fast!
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Directory Tree' })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open Undo Tree' })

vim.keymap.set('v', '±', ":m '>+1<CR>gv=gv", { desc = 'Transpose Selected Text Down' })
vim.keymap.set('v', '¯', ":m '<-2<CR>gv=gv", { desc = 'Transpose Selected Text Up' })

vim.keymap.set('n', 'J', 'mzJ`z') -- Static cursor on J's

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Safe Paste' }) -- Keep paste buffer when replacing selected text
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = 'Safe Delete' }) -- Same for delete
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank EoL to System' })

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace current word in file' })
vim.keymap.set("n", "<leader>x", "<cmd>silent !chmod +x %<CR>", { desc = 'Make file executable' })
