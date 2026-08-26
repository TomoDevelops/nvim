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
-- WSL has no native clipboard provider; bridge to Windows via clip.exe / powershell
if vim.fn.has("wsl") == 1 then
  -- Windows stores clipboard text with CRLF, so strip the \r before handing
  -- lines back to Neovim; otherwise every paste ends in a literal ^M.
  local function wsl_paste()
    local text = vim.fn.system({
      "powershell.exe",
      "-NoProfile",
      "-Command",
      "[Console]::Out.Write($(Get-Clipboard -Raw).ToString())",
    })
    text = text:gsub("\r\n", "\n")
    -- A trailing newline means the text was yanked linewise.
    local regtype = vim.endswith(text, "\n") and "V" or "v"
    local body = text:gsub("\n$", "")
    return { vim.split(body, "\n"), regtype }
  end

  vim.g.clipboard = {
    name = "WslClipboard",
    copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
    paste = { ["+"] = wsl_paste, ["*"] = wsl_paste },
    cache_enabled = 0,
  }
end
opt.clipboard = "unnamedplus"

-- Styled borders on LSP floating windows
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "LspFloatBorder", { fg = "#05C3DE" })
  end,
})
vim.api.nvim_set_hl(0, "LspFloatBorder", { fg = "#05C3DE" })

local float_border = {
  { "╭", "LspFloatBorder" },
  { "─", "LspFloatBorder" },
  { "╮", "LspFloatBorder" },
  { "│", "LspFloatBorder" },
  { "╯", "LspFloatBorder" },
  { "─", "LspFloatBorder" },
  { "╰", "LspFloatBorder" },
  { "│", "LspFloatBorder" },
}

local float_opts = { border = float_border, pad_top = 1, pad_bottom = 1 }

vim.diagnostic.config({ float = float_opts })

return { float_border = float_border }
