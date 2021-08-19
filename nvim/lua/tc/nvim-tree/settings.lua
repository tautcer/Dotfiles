-- Set some variables
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_ignore = {
  '.git',
  'node_modules',
  '.cache',
  '.routify',
  'dist',
  '.cache',
}
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 1}

-- Mappings for nvimtree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  {key = {'<CR>', 'o', 'l'}, cb = tree_cb('edit')},
  {key = {'<2-RightMouse>', '<C-]>'}, cb = tree_cb('cd')},
  {key = '<C-v>', cb = tree_cb('vsplit')},
  {key = '<C-x>', cb = tree_cb('split')},
  -- {key = "<C-t>", cb = tree_cb("tabnew")},
  {key = '<', cb = tree_cb('prev_sibling')},
  {key = '>', cb = tree_cb('next_sibling')},
  {key = 'P', cb = tree_cb('parent_node')},
  {key = '<BS>', cb = tree_cb('close_node')},
  {key = '<S-CR>', cb = tree_cb('close_node')},
  {key = '<Tab>', cb = tree_cb('preview')},
  {key = 'K', cb = tree_cb('first_sibling')},
  {key = 'J', cb = tree_cb('last_sibling')},
  {key = 'I', cb = tree_cb('toggle_ignored')},
  {key = 'H', cb = tree_cb('toggle_dotfiles')},
  {key = 'R', cb = tree_cb('refresh')},
  {key = 'a', cb = tree_cb('create')},
  {key = 'd', cb = tree_cb('remove')},
  {key = 'r', cb = tree_cb('rename')},
  -- {key = "<C->", cb = tree_cb("full_rename")},
  {key = 'x', cb = tree_cb('cut')},
  {key = 'c', cb = tree_cb('copy')},
  {key = 'p', cb = tree_cb('paste')},
  {key = 'y', cb = tree_cb('copy_name')},
  {key = 'Y', cb = tree_cb('copy_path')},
  {key = 'gy', cb = tree_cb('copy_absolute_path')},
  {key = '[c', cb = tree_cb('prev_git_item')},
  {key = '}c', cb = tree_cb('next_git_item')},
  {key = '-', cb = tree_cb('dir_up')},
  {key = 'q', cb = tree_cb('close')},
  {key = 'g?', cb = tree_cb('toggle_help')},
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',

  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
  },

  folder = {default = '', open = ' '},
}
