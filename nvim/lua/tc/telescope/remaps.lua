local utils = require('tc.telescope.utils')

--- Telescope config
--- Using lua functions
nnoremap('<leader>f', utils.find_files)
nnoremap('<C-f>', utils.live_grep)
nnoremap('<leader>m', utils.grep_string)
nnoremap('<leader>b', utils.buffers)
nnoremap(
  '<leader>gc', '<cmd>lua require(\'telescope.builtin\').git_commits()<cr>'
)
nnoremap(
  '<leader>gb', 'require(\'telescope.builtin\').git_branches()'
)
nnoremap(
  '<leader>gs', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>'
)
nnoremap(
  '<leader>gp', '<cmd>lua require(\'telescope.builtin\').git_bcommits()<cr>'
)
nnoremap(
  '<leader>p', '<cmd>Telescope projects<cr>'
)
nnoremap(
  '<leader>sc', "<cmd>lua require('telescope.builtin').spell_suggest()<cr>"
)
