return {
  -- Colorscheme: Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- Tùy chọn: "latte", "frappe", "macchiato", "mocha"
        transparent_background = true, -- Đổi thành true nếu muốn nền trong suốt
        integrations = {
          neotree = true,
          treesitter = true,
          cmp = true,
          telescope = {
            enabled = true,
          },
          mason = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- File Explorer: Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Bật/Tắt Neo-tree" },
    },
  },
}
