return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Go adapter
      {
        'leoluz/nvim-dap-go',
        config = function()
          require('dap-go').setup()
        end,
      },
      -- A UI for DAP
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        },
        config = function()
          local dapui = require 'dapui'
          dapui.setup()

          local dap = require 'dap'
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
      -- Virtual text for showing variable values
      { 'theHamsta/nvim-dap-virtual-text', config = true },
      -- This plugin bridges mason and nvim-dap
    },
    -- All keymaps can be defined in one place
    config = function()
      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end, { desc = 'DAP: Continue/Start' })
      vim.keymap.set('n', '<F6>', function()
        require('dap').step_over()
      end, { desc = 'DAP: Step Over' })
      vim.keymap.set('n', '<F7>', function()
        require('dap').step_out()
      end, { desc = 'DAP: Step Out' })
      vim.keymap.set('n', '<F8>', function()
        require('dap').step_into()
      end, { desc = 'DAP: Step Into' })
      vim.keymap.set('n', '<leader>db', function()
        require('dap').toggle_breakpoint()
      end, { desc = 'DAP: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dT', function()
        require('dap').terminate()
      end, { desc = 'DAP: Terminate' })
      vim.keymap.set('n', '<leader>du', function()
        require('dapui').toggle()
      end, { desc = 'DAP: Toggle UI' })
      vim.keymap.set('n', '<leader>dt', function()
        require('dap-go').debug_test()
      end, { desc = 'DAP: Debug Go Test' })
    end,
  },
}
