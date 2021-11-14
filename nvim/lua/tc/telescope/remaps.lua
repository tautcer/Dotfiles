--- Telescope config
--- Using lua functions
nnoremap('<leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
nnoremap('<C-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
nnoremap('<leader>m', '<cmd>lua require(\'telescope.builtin\').grep_string()<cr>')
nnoremap('<leader>b', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
nnoremap(
  '<leader>gc', '<cmd>lua require(\'telescope.builtin\').git_commits()<cr>'
)
nnoremap(
  '<leader>gb', '<cmd>lua require(\'telescope.builtin\').git_branches()<cr>'
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
