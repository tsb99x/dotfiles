local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:▸ ,trail:·,precedes:◀,extends:▶,nbsp:␣"
vim.o.wrap = false

require("lazy").setup({
  spec = {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "master",
      lazy = false,
      build = ":TSUpdate",
      opts = {
        highlight = { enable = true },
        ensure_installed = {
          "vimdoc",
          "lua",
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
    },
    { "lewis6991/gitsigns.nvim" },
    {
      "nvim-telescope/telescope.nvim",
      tag = "v0.2.0",
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Telescope find files" },
        { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
        { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
        { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Telescope help_tags" },
      },
    },
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          }
        }
      }
    },
    {
      "neovim/nvim-lspconfig",
      version = "2.5.0",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.basedpyright.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.clangd.setup({})
      end,
    },
    {
      "mfussenegger/nvim-lint",
      config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
          html = { "htmlhint" },
          dockerfile = { "hadolint" },
          sh = { "shellcheck" },
          bash = { "shellcheck" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
          callback = function()
            lint.try_lint()
          end,
        })
      end,
    },
    {
      "saghen/blink.cmp",
      dependencies = { "rafamadriz/friendly-snippets" },
      version = "1.*",
      opts = {
        keymap = { preset = "enter" },
        appearance = { nerd_font_variant = "mono" },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            }
          },
          documentation = { auto_show = true },
        },
        signature = { enabled = true },
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      },
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
