return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- [[ Better Around/Inside textobjects ]]
      --
      -- Examples:
      -- n :va)  - V.isually A.round ).parens, select
      -- n :yinq - Y.ank I.nside N.ext '.quotes
      -- n :ci'  - C.hange I.nside '.quotes
      require('mini.ai').setup { n_lines = 500 }
      --

      -- [[ Add/delete/replace surroundings ]]
      --
      -- Examples:
      -- n :saiw) - A.dd I.nner W.ord ).parens
      -- n :sd'   - D.elete '.quotes
      -- n :sr)'  - R.eplace ).parens '.quotes
      require('mini.surround').setup()
      --

      -- [[ Simple and easy statusline ]]
      --
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- Set the section for cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
      --

      -- [[ Align Text Visually ]]
      --
      require('mini.align').setup()
      --

      -- [[ Create pairs of brackets, parens, braces ]]
      --
      -- todo keymaps:
      -- n :L'tp - toggle auto-pairs
      -- require('mini.pairs').setup()
      --

      -- TODO
      -- require('mini.bufremove').setup()
      -- require('mini.comment').setup()
      -- require('mini.indentscope').setup()
      --
      -- require('mini.animate').setup()
      -- require('mini.base16').setup()
      -- require('mini.basics').setup()
      -- require('mini.bracketed').setup()
      -- require('mini.clue').setup()
      -- require('mini.colors').setup()
      -- require('mini.completion').setup()
      -- require('mini.cursorword').setup()
      -- require('mini.deps').setup()
      -- require('mini.diff').setup()
      -- require('mini.doc').setup()
      -- require('mini.extra').setup()
      -- require('mini.files').setup()
      -- require('mini.fuzzy').setup()
      -- require('mini.git').setup()
      -- require('mini.hipatterns').setup()
      -- require('mini.hues').setup()
      -- require('mini.jump').setup()
      -- require('mini.jump2d').setup()
      -- require('mini.map').setup()
      -- require('mini.misc').setup()
      -- require('mini.move').setup()
      -- require('mini.notify').setup()
      -- require('mini.operators').setup()
      -- require('mini.pick').setup()
      -- require('mini.splitjoin').setup()
      -- require('mini.starter').setup()
      -- require('mini.tabline').setup()
      -- require('mini.test').setup()
      -- require('mini.trailspace').setup()
      -- require('mini.visits').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
