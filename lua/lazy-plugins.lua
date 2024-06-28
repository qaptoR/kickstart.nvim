-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run `:Lazy`
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run `:Lazy update`

--    [[ ITERATION ]]
-- Iterate over a directory of plugin files
local plugin_dirs = {
  'kickstart/plugins',
  'custom/plugins',
  'themes',
}
local plugins = {}
local basedir = vim.fn.expand '<sfile>:h' .. '/lua'

for i, dirname in pairs(plugin_dirs) do
  local dirpath = basedir .. '/' .. dirname
  for j, filename in pairs(vim.fn.readdir(dirpath)) do
    local file = vim.fn.fnamemodify(filename, ':r')
    local filepath = dirpath .. '/' .. filename
    if vim.fn.isdirectory(filepath) == 0 then
      table.insert(plugins, require(dirname .. '/' .. file))
    end
  end
end

--    [[ EXPLICIT ]]
-- Exhaustively list plugin repo's or setup files
require('lazy').setup({
  -- Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Use `opts = {}` to force a plugin to be loaded.
  --  This is equivalent to: require('Comment').setup({})
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  -- optionally, require plugin setup tables from another file (no extension)
  -- require 'kickstart/plugins/orgmode',
  -- require 'kickstart/plugins/gruvbox',

  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },

  unpack(plugins), -- must be the last line to concatentate tables
}, {
  ui = { icons = {} },
})

-- vim: ts=2 sts=2 sw=2 et
