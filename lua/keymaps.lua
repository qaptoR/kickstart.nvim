-- [[ Basic Keymaps ]]
--
-- Keymaps that are tied to Neovim itself,
-- ie. not a particular plugin, etc.
--
--  See `:help vim.keymap.set()`
--

-- [[ Modes Reference ]]
--
-- n :normal,  i :insert,  v :visual,  t :terminal
-- s :something?,  o :text object?,  x :command?
--

-- [[ Clear search highlight on pressing <Esc> in normal mode
--
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--

-- [[ Diagnostic keymaps ]]
--
-- n :[w - previous warning
-- n :]w - next warning
--
-- n :[b - previous buffer
-- n :]b - next buffer
--
-- n :[q - previous quickfix
-- n :]q - next quickfix
-- n: L'xq - quickfix list -- update below keymap?
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Q/uickfix list' })
--
-- n :[e - previous error
-- n :]e - next error
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic E/rror messages' })
--
-- n: L'xl - location list
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous D/iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next D/iagnostic message' })
--

-- [[ Exit Terminal Mode ]]
--
-- Normally need to press <C-\><C-n>, which is not easily guessable without experience.
-- This won't work in all terminal emulators/tmux/etc.
-- Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--

-- [[ Split Navigation ]]
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-l>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-j>', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-k>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-w><C-h>', '<C-w>H', { desc = 'Move window to left' })
vim.keymap.set('n', '<C-w><C-l>', '<C-w>L', { desc = 'Move window to right' })
vim.keymap.set('n', '<C-w><C-j>', '<C-w>J', { desc = 'Move window to above' })
vim.keymap.set('n', '<C-w><C-k>', '<C-w>k', { desc = 'Move window to below' })
--

-- [[ Line Manipulation ]]
--
vim.keymap.set({ 'n', 'v' }, '<A-h>', '<<', { desc = 'Decrease indentation' })
vim.keymap.set({ 'n', 'v' }, '<A-l>', '>>', { desc = 'Increase indentation' })
vim.keymap.set('n', '<A-j>', '<cmd>m +1<cr>', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', '<cmd>m -2<cr>', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move lines down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move lines up' })
vim.keymap.set('v', '<A-S-j>', '<cmd>m +1<cr>', { desc = 'Move line down, update selection' })
vim.keymap.set('v', '<A-S-k>', '<cmd>m -2<cr>', { desc = 'Move line up, update selection' })
--

-- [[ TODO Keymaps]]
--
-- n :L'l - open Lazy
-- n :L'L - Lazy changelog?
--
-- buffer manipulation
-- n :L'bd - delete buffer, keep window
-- n :L'bD - delete buffer and window
-- n :L'bb - switch to other buffer
-- n :L'bB - switch to other buffer
--
-- n :L'ur - redraw / clear hlsearch / diff update
-- n :L'ui - inspect pos
-- n :L'uI - inspect tree
--
-- format / diagnostics
-- n,v :L'cf - format
-- n :L'cd - line diagnostics
--
-- file/terminal
-- n :L'fn - new file
-- n :L'ft - Terminal (root)
-- n :L'fT - Terminal (cwd)
--
-- commenting
-- n :gco - comment line below
-- n :gcO - comment line above
-- n :L'qq - quit all - verify action? force quit?
--
-- Toggles
-- n :L'tf - toggle auto-format (buffer)
-- n :L'tF - toggle auto-format (global
-- n :L'tl - toggle line numbers
-- n :L'tL - toggle relative line numbers
-- n :L'tb - toggle background
-- n :L'tc - toggle conceal
-- n :L'td - toggle diagnostics
-- n :L'th - toggle inlay hints
-- n :L'ts - toggle spelling
-- n :L'tT - toggle Treesitter highlight
-- n :L'tw - toggle word wrap
--
-- Lazygit -- or any git tool
-- n :L'gg - Lazygit (root dir)
-- n :L'gG - Lazygit (current dir)
-- n :L'gb - git blame line
-- n :L'gB - git browse
-- n :L'gf - Lazygit current file history
-- n :L'gl - Lazygit log
-- n :L'gL - Lazygit log (cwd)
--
-- tabs
-- n :LT'l - last tab
-- n :LT'd - close tab
-- n :LT'n - new tab
-- n :LT'o - close other tabs
-- n :LTT' - list tabs (workspaces)
-- -- have to create a tab/workspace picker/renamer
--
--
-- [[ TBD Keymaps]]
--
-- n: L'-
-- n: L'|
-- n: L'w-
-- n: L'w|
--

-- [[ Disable arrow keys in normal mode ]]
--
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- vim: ts=2 sts=2 sw=2 et
