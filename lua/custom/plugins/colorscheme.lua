return {
  { -- You can easily change to a different colorscheme.
    'tiagovla/tokyodark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyodark'
    end,
  },
}
