-- NOTE: Debugging
return {
  "rcarriga/nvim-dap-ui",
  init = function()
    local dap = require "dap"
    local dapui = require "dapui" vim.keymap.set(
      "n",
      "<leader>dc",
      "<cmd>lua require'dap'.continue()<cr>",
      { desc = "DAP | Continue", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>do",
      "<cmd>lua require'dap'.step_over()<cr>",
      { desc = "DAP | Step Over", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>di",
      "<cmd>lua require'dap'.step_into()<cr>",
      { desc = "DAP | Step Into", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>du",
      "<cmd>lua require'dap'.step_out()<cr>",
      { desc = "DAP | Step Out", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>db",
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      { desc = "DAP | Breakpoint", silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>dB",
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      { desc = "DAP | Breakpoint Condition", silent = true }
    )

    vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "DAP | Dap UI", silent = true })

    vim.keymap.set(
      "n",
      "<leader>dl",
      "<cmd>lua require'dap'.run_last()<cr>",
      { desc = "DAP | Run Last", silent = true }
    )

    -- Close debugger and clear breakpoints
      vim.keymap.set("n", "<localleader>de", function()
      dap.clear_breakpoints()
      dapui.toggle({})
      dap.terminate()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
      -- require("notify")("Debugger session ended", "warn")
    end)

        -- SETUP UI --
        dapui.setup({
          icons = { expanded = "▾", collapsed = "▸" },
          mappings = {
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          expand_lines = vim.fn.has("nvim-0.7"),
          layouts = {
            {
              elements = {
                "scopes",
              },
              size = 0.3,
              position = "right"
            },
            {
              elements = {
                "repl",
                "breakpoints"
              },
              size = 0.3,
              position = "bottom",
            },
          },
          floating = {
            max_height = nil,
            max_width = nil,
            border = "single",
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil,
          },
        })
  end,
  dependencies = {
    { "nvim-neotest/nvim-nio" },
    {
      "mfussenegger/nvim-dap",
      config = function()
        -- NOTE: Check out this for guide
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        local dap = require "dap"
        local dapui = require "dapui"
        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

        dap.listeners.after.event_initialized["dapui_config"] = function()

          dapui.open()
        end

          dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            -- command = "~/.config/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
            command = "OpenDebugAD7",
          }

          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "cppdbg",
              request = "launch",
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = '${workspaceFolder}',
              stopAtEntry = true,
            },
            {
              name = 'Attach to gdbserver :1234',
              type = 'cppdbg',
              request = 'launch',
              MIMode = 'gdb',
              miDebuggerServerAddress = 'localhost:1234',
              miDebuggerPath = '/usr/bin/gdb',
              cwd = '${workspaceFolder}',
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
            },
          }

          -- If you want to use this for Rust and C, add something like this:
          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
      end,
    },
  },
  opts = {
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
  },
}
