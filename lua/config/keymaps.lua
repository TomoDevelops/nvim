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

-- Toggle Claude terminal
local claude_buf = nil
map("n", "<leader>cc", function()
  if claude_buf and vim.api.nvim_buf_is_valid(claude_buf) then
    local wins = vim.fn.win_findbuf(claude_buf)
    if #wins > 0 then
      vim.api.nvim_win_close(wins[1], true)
      return
    end
    vim.cmd("vsplit")
    vim.api.nvim_win_set_buf(0, claude_buf)
    vim.cmd("startinsert")
    return
  end
  vim.cmd("vsplit | terminal claude")
  claude_buf = vim.api.nvim_get_current_buf()
end, { desc = "Toggle Claude terminal" })

-- Easy exit from terminal mode
map("t", "<C-\\><C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Yank file name
map("n", "yfn", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Yank file name" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })
