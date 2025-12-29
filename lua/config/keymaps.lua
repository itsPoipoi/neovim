-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Remap for Ergo-L
map({ "n", "x", "v" }, "+", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x", "v" }, "-", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x", "v" }, ",", ";")
map("n", ";", ",")
map("n", "U", "<C-r>")

-- Create empty lines
map("n", "<A-o>", '@="m`o<C-V><Esc>``"<CR>', { desc = "Create Empty Line Below", silent = true })
map("n", "<A-O>", '@="m`O<C-V><Esc>``"<CR>', { desc = "Create Empty Line Above", silent = true })

-- Center vertical jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-c>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")

-- Static cursor on J's
map("n", "J", "mzJ`z")

-- Controlled edits
map("x", "<leader>p", [["_dP]], { desc = "Safe Paste" }) -- Keep paste buffer when replacing selected text
map({ "n", "v" }, "<leader>dd", '"_d', { desc = "Safe Delete" }) -- Same for delete
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank EoL to System" })

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Make file executable
map("n", "<leader>fx", "<cmd>silent !chmod +x %<CR>", { desc = "Make File Executable" })

-- Move to window using the <ctrl> arrow keys
map({ "n", "t" }, "<C-Up>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window", remap = true })
map({ "n", "t" }, "<C-Down>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window", remap = true })
map({ "n", "t" }, "<C-Left>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window", remap = true })
map({ "n", "t" }, "<C-Right>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl+shift> arrow keys
map({ "n", "t" }, "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map({ "n", "t" }, "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map({ "n", "t" }, "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map({ "n", "t" }, "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down", silent = true })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up", silent = true })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up", silent = true })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down", silent = true })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up", silent = true })
