return {
  -- Mason for LSP/DAP installs
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP auto-setup
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "tsserver",      -- JavaScript/TypeScript
        "solargraph",    -- Ruby
        "html",          -- HTML
        "lua_ls",        -- Lua
        "bashls",        -- Bash
        "pyright",       -- Python
        "terraformls",   -- Terraform
        "gopls",         -- Golang
        "rust_analyzer", -- Rust
      },
    },
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(client, bufnr)
              lsp_keymaps(bufnr) -- Attach keymaps
            end,
          })
        end,
      })
    end
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua LSP optimizations (for Neovim development)
      lspconfig.lua_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      })

      -- Golang LSP
      lspconfig.gopls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          gopls = {
            staticcheck = true, -- Enable static analysis
            gofumpt = true, -- Use gofumpt formatting
          },
        },
      })

      -- Rust LSP
      lspconfig.rust_analyzer.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" }, -- Use Clippy for linting
          },
        },
      })

      -- Terraform LSP
      lspconfig.terraformls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = { source = "always", border = "rounded" },
      })
    end,
  },
}
