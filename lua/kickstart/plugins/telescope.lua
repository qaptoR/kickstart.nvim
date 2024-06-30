return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
      },
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
      },
      { -- Useful for getting pretty icons, but requires a Nerd Font.
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font,
      },
      {
        'nvim-telescope/telescope-project.nvim',
      },
      {
        'nvim-telescope/telescope-file-browser.nvim',
        -- dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
      },
    },
    config = function()
      -- Start by doing something like: `:Telescope help_tags`
      --
      -- Show relative keymaps while in Telescope are:
      -- i :<c-/>
      -- n :?
      --

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'file_browser')
      pcall(require('telescope').load_extension, 'project')

      -- [[ Personal ]]
      --
      vim.keymap.set('n', '<leader>pp', function()
        require('telescope').extensions.project.project {}
      end, { desc = 'P_roject P_icker' })
      --

      -- [[ Telescope Builtin ]]
      --
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'H_elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'K_eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'F_iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'S_elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'current W_ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'by G_rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'D_iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'R_esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = "recent, '.'_repeatable" })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'List buffers' })
      --

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzy, current buffer' })
      --

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = "'/' in Open Files" })
      --

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'N_eovim files' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
