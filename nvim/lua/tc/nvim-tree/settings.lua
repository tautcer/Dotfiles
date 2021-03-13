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
vim.g.nvim_tree_bindings = {['<CR>'] = tree_cb('edit'), ['o'] = tree_cb('edit')}

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
