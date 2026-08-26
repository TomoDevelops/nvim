local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better paste (don't overwrite register)
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- Quick save
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Close current buffer
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Toggle a terminal running `cmd` (empty string = default shell) in a vertical split
local function terminal_toggle(cmd)
  local term_buf = nil
  return function()
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      local wins = vim.fn.win_findbuf(term_buf)
      if #wins > 0 then
        vim.api.nvim_win_close(wins[1], true)
        return
      end
      vim.cmd("vsplit")
      vim.api.nvim_win_set_buf(0, term_buf)
      vim.cmd("startinsert")
      return
    end
    vim.cmd(vim.trim("vsplit | terminal " .. cmd))
    term_buf = vim.api.nvim_get_current_buf()
    vim.cmd("startinsert")
  end
end

map("n", "<leader>cc", terminal_toggle("claude"), { desc = "Toggle Claude terminal" })
map("n", "<leader>tt", terminal_toggle(""), { desc = "Toggle terminal" })

-- Terminal workspace, replacing the current window layout:
--   +-----------------------+
--   |         shell         |
--   +-----------------------+
--   |        claude         |
--   +-----------------------+
local workspace_wins = {}
local function workspace_is_live()
  if #workspace_wins == 0 then
    return false
  end
  for _, win in ipairs(workspace_wins) do
    if not vim.api.nvim_win_is_valid(win) then
      return false
    end
  end
  return true
end

map("n", "<leader>tw", function()
  -- Already open: focus the Claude pane instead of spawning a second instance
  if workspace_is_live() then
    vim.api.nvim_set_current_win(workspace_wins[2])
    return
  end

  vim.cmd("only")

  local top = vim.api.nvim_get_current_win()
  vim.cmd("belowright split")
  local bottom = vim.api.nvim_get_current_win()

  -- Tagged so lualine can skip these panes (see disabled_filetypes in plugins/ui.lua);
  -- winhighlight blends the now-empty statusline row into the background
  local function start(win, cmd)
    vim.api.nvim_set_current_win(win)
    vim.cmd(vim.trim("terminal " .. cmd))
    vim.bo.filetype = "twterm"
    vim.wo.winhighlight = "StatusLine:Normal,StatusLineNC:Normal"
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
  end

  start(top, "")
  start(bottom, "claude")

  workspace_wins = { top, bottom }
  vim.api.nvim_set_current_win(bottom)
end, { desc = "Open terminal workspace" })

-- Easy exit from terminal mode
map("t", "<C-\\><C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Yank file name
map("n", "yfn", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Yank file name" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })
