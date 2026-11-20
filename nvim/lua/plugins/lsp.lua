return {
  -- Mason quản lý LSP Server / Formatter
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",        -- TypeScript/JavaScript
        "html",         -- HTML
        "cssls",        -- CSS
        "tailwindcss",  -- Tailwind CSS
        "emmet_ls",     -- Emmet HTML/CSS
      },
    },
  },
  -- Nvim LSP config (Chuẩn Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Keymap gắn qua autocmd LspAttach chuẩn thay vì on_attach cũ
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- Nhảy tới định nghĩa
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- Xem docs/popup
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)    -- Quick fix/Code action
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Đổi tên biến
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { "ts_ls", "html", "cssls", "tailwindcss", "emmet_ls" }

      -- Tương thích cả Neovim 0.11+ lẫn các bản cũ hơn
      if vim.lsp.config then
        for _, server in ipairs(servers) do
          vim.lsp.config(server, {
            capabilities = capabilities,
          })
          vim.lsp.enable(server)
        end
      else
        local lspconfig = require("lspconfig")
        for _, server in ipairs(servers) do
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end
      end
    end,
  },
  -- Tự động gợi ý code (Completion)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
