return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html", "css", "javascript", "typescript", "tsx",
        "json", "vue", "svelte", "lua", "markdown",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}