return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules/", ".git/", "dist/", "build/", ".next/" },
        mappings = {
          i = {
            ["<C-d>"] = "delete_buffer",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          },
          n = {
            ["dd"] = "delete_buffer",
          },
        },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
        },
      },
    },
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>pv", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    opts = {},
  },

  -- Treesitter (syntax highlighting + textobjects)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "vue", "typescript", "tsx", "javascript", "json", "html", "css", "yaml", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Emmet (HTML/CSS expansion)
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "vue", "javascriptreact", "typescriptreact" },
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Toggle comment" },
      { "gc", mode = "v", desc = "Toggle comment" },
    },
    opts = {},
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- TODO/FIXME/HACK highlights
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
    },
    opts = {},
  },

  -- Git (fugitive + diffview)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gblame", "Gdiffsplit", "Glog" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gu", "<cmd>Git push -u origin HEAD<CR>", desc = "Git push (set upstream)" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
      {
        "<leader>gr",
        function()
          local pr_base = vim.trim(vim.fn.system("gh pr view --json baseRefName --jq .baseRefName 2>/dev/null"))
          if vim.v.shell_error ~= 0 or pr_base == "" then
            vim.notify("No open PR found for this branch", vim.log.levels.WARN)
            return
          end
          vim.cmd("DiffviewOpen origin/" .. pr_base .. "...HEAD")
        end,
        desc = "PR review diff",
      },
      {
        "<leader>gl",
        function()
          local base = vim.trim(vim.fn.system("git rev-parse --abbrev-ref origin/HEAD"))
          vim.cmd("DiffviewFileHistory --range=" .. base .. "...HEAD")
        end,
        desc = "PR commit log",
      },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
    },
    opts = {},
  },

  -- Better UI for select/input prompts
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Format on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d", "prettierd" },
        typescript = { "eslint_d", "prettierd" },
        javascriptreact = { "eslint_d", "prettierd" },
        typescriptreact = { "eslint_d", "prettierd" },
        vue = { "eslint_d", "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    },
  },

  -- Harpoon (quick file bookmarks)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
      vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
      vim.keymap.set("n", "<M-j>", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
      vim.keymap.set("n", "<M-k>", function() harpoon:list():next() end, { desc = "Harpoon next" })
    end,
  },
}
