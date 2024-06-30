-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded: config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      key_labels = { --  FIX: waiting for a fix from repo
        ['<space>'] = "S'",
        ['<cr>'] = "R'",
        ['<tab>'] = "T'",
        ['<leader>'] = "L'",
      },
    },
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing/core key chains
      require('which-key').register({ -- Normal Mode
        -- [[ KICKSTART ]]
        --
        ['<leader>c'] = { name = 'C_ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = 'D_ocument', _ = 'which_key_ignore' },
        ['<leader>R'] = { name = 'R_ename', _ = 'which_key_ignore' }, -- REMAP
        ['<leader>s'] = { name = 'S_earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = 'W_orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = 'T_oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'H_unk, Git', _ = 'which_key_ignore' },
        --

        -- [[ PERSONAL ]]
        --
        ['<leader>g'] = { name = 'G_PT Tools', _ = 'which_key_ignore' },
        ['<leader>q'] = { name = 'Q_aptor', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = 'R_occo', _ = 'which_key_ignore' },
        ['<leader>p'] = { name = 'P_icker', _ = 'which_key_ignore' },
        ['<leader>o'] = { name = 'O_rgmode', _ = 'which_key_ignore' },
        --

        -- [[  TODO: ]]
        --
        -- ['<leader>b']
        -- ['<leader>B']
        -- ['<leader>D']
        -- ['<leader>f']
        -- ['<leader>v'] = { name = '', _ = 'which_key_ignore' }, -- can't be 'visual' because that's a mode-specific
      }, { mode = 'n' })

      require('which-key').register({ -- Visual Mode
        ['<leader>h'] = { 'H_unk, Git' },
        ['<leader>g'] = { 'G_PT Tools' },
        ['<leader>s'] = { 'S_ubstitute' },
      }, { mode = 'v' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
