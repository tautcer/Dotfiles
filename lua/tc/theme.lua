local set_hl = require"tc.utils.util".set_hl
vim.cmd('syntax on')

-- colorscheme
vim.api.nvim_command [[ colorscheme gruvbox ]]
vim.cmd(
  [[
    filetype plugin indent on
  ]]
)

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_sign_column = 'dark0_hard'
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_number_column = 'dark0_hard'

vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')
vim.cmd('highlight SignColumn guibg=#282828')
-- italicize comments
set_hl('Comment', { gui = 'italic' })
