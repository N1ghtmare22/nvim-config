return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      keymaps = {
        ['<C-c>'] = false,
        ['q'] = 'actions.close',
      },
      delete_to_trash = true,
      view_options = { show_hidden = true },
      skip_confirm_for_simple_edits = true,
    }

    local map = vim.keymap.set
    local toggle = require('oil').toggle_float
    map('n', '-', '<CMD>Oil<CR>', { desc = 'open oil buffer' })
    map('n', '<leader>-', toggle, { desc = 'open float oil' })
  end,
}
