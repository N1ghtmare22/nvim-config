return {
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
