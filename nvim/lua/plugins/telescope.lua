return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Tìm file" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Tìm text (grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Xem buffer đang mở" },
  },
}