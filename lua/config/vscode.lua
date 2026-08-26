local vscode = require("vscode")
local map = vim.keymap.set

vim.g.mapleader = " "

local function action(command)
  return function()
    vscode.action(command)
  end
end

-- Find file by name
map("n", "<leader>pf", action("workbench.action.quickOpen"), {
  desc = "Find files",
})

-- Search text across project
map("n", "<leader>ps", action("workbench.action.findInFiles"), {
  desc = "Search project",
})

-- Toggle explorer/sidebar
map("n", "<leader>pv", action("workbench.action.toggleSidebarVisibility"), {
  desc = "Toggle explorer",
})

-- Save
map("n", "<leader>w", action("workbench.action.files.save"), {
  desc = "Save",
})

-- Close current tab
map("n", "<leader>x", action("workbench.action.closeActiveEditor"), {
  desc = "Close editor",
})

-- Rename symbol
map("n", "<leader>rn", action("editor.action.rename"), {
  desc = "Rename symbol",
})

-- Code action / quick fix
map({ "n", "x" }, "<leader>ca", function()
  vscode.with_insert(function()
    vscode.action("editor.action.quickFix")
  end)
end, {
  desc = "Code action",
})

-- Toggle terminal
map("n", "<leader>tt", action("workbench.action.terminal.toggleTerminal"), {
  desc = "Toggle terminal",
})

-- Go back / forward after gd, file navigation, etc.
map("n", "<leader>h", action("workbench.action.navigateBack"), {
  desc = "Navigate back",
})

map("n", "<leader>l", action("workbench.action.navigateForward"), {
  desc = "Navigate forward",
})
