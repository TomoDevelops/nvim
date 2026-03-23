local opt = vim.opt

-- Leader keys (set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 500

-- Persistent undo
opt.undofile = true

-- Disable netrw (if using a file explorer plugin)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- System clipboard
opt.clipboard = "unnamedplus"

-- Native LSP server configs (nvim 0.11+)
vim.lsp.config("vue_ls", {
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
    },
  },
  root_markers = { "nuxt.config.ts", "nuxt.config.js", "tsconfig.json" },
})
vim.lsp.config("ts_ls", {
  root_markers = { "tsconfig.json", "package.json" },
})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})
vim.lsp.enable({ "ts_ls", "vue_ls", "lua_ls" })
