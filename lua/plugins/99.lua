return {
  {
    "ThePrimeagen/99",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
      local _99 = require("99")

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        provider = _99.Providers.ClaudeCodeProvider,
        model = "claude-opus-4-7",

        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },

        -- Keep tmp inside cwd so Claude Code permissions allow read/write
        tmp_dir = "./tmp",

        completion = {
          source = "native",
        },

        -- Auto-attach AGENT.md walking up from the active file to project root
        md_files = {
          "AGENT.md",
          "CLAUDE.md",
        },
      })

      local map = vim.keymap.set

      -- Visual selection -> send + replace with result (visual mode only on purpose)
      map("v", "<leader>9v", function()
        _99.visual()
      end, { desc = "99: rewrite visual selection" })

      -- Project search -> results land in quickfix
      map("n", "<leader>9s", function()
        _99.search()
      end, { desc = "99: agentic search" })

      -- Open last interaction
      map("n", "<leader>9o", function()
        _99.open()
      end, { desc = "99: open last interaction" })

      -- View logs of last run
      map("n", "<leader>9l", function()
        _99.view_logs()
      end, { desc = "99: view logs" })

      -- Cancel everything in flight
      map("n", "<leader>9x", function()
        _99.stop_all_requests()
      end, { desc = "99: stop all requests" })

      -- Clear cached previous requests
      map("n", "<leader>9c", function()
        _99.clear_previous_requests()
      end, { desc = "99: clear previous requests" })

      -- Telescope: switch model on the fly (session-only)
      map("n", "<leader>9m", function()
        require("99.extensions.telescope").select_model()
      end, { desc = "99: select model" })

      -- Telescope: switch provider on the fly
      map("n", "<leader>9p", function()
        require("99.extensions.telescope").select_provider()
      end, { desc = "99: select provider" })
    end,
  },
}
