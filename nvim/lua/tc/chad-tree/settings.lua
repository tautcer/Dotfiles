local chadtree_settings = {
  ignore = {
    name_glob = {
      '.*',
      '.git',
      'node_modules',
      '.cache',
      '.routify',
      'dist',
      '.cache',
    },
  },
  theme = {text_colour_set = 'nord'},
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)
