-- If you want to see what colorschemes are already installed,
--  you can use `:Telescope colorscheme`.
return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    opts = {},
    init = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
