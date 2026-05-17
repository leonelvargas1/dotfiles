vim.g.mapleader = " "

-- opciones básicas
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"

--------------------------------------------------
-- lazy.nvim bootstrap
--------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- Plugins
--------------------------------------------------

require("lazy").setup({

-- Theme
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end
},

-- File explorer
{
  "nvim-tree/nvim-tree.lua",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end
},

-- Telescope
{
  "nvim-telescope/telescope.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
  end
},

-- Statusline
{
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
  end
},

-- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua",
        "python",
        "bash",
        "json",
        "markdown"
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    })
  end,
},
{
  "neovim/nvim-lspconfig",
},
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
},
},
})
