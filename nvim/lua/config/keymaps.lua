vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Lưu file nhanh
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Lưu file" })
-- Thoát file
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Thoát" })
-- Bỏ highlight sau khi tìm kiếm
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Xóa highlight search" })


