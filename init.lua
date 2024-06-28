--[[
-- <insert ascii art here>
--]]

--  NOTE:
--  If you experience any errors, run `:checkhealth` for more info
--  For a reference about how Neovim integrates Lua, run `:help lua-guide`
--  MOST IMPORTANTLY, the keymap "<space>sh" will [s]earch the [h]elp documentation
--  For a refresher on the vim methodology, run `:Tutor`

-- Set <space> as the leader key
-- See `:help mapleader`
-- !! Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Simple Options ]]
require 'options'

-- [[ General Settings ]]
require 'settings'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
