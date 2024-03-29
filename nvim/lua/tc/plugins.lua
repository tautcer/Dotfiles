-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then
    return
  end

  local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data'))

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
  )

  print(out)
  print('Downloading packer.nvim...')

  return
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself as an optional plugin
    use({ 'wbthomason/packer.nvim', opt = true })

    use('edkolev/tmuxline.vim')
    use('windwp/nvim-autopairs')
    use('numToStr/Comment.nvim')
    use('JoosepAlviste/nvim-ts-context-commentstring')

    -- Markdown
    use({ 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' })
    use('vim-pandoc/vim-pandoc')
    use('vim-pandoc/vim-pandoc-syntax')

    -- Navigation
    use('kyazdani42/nvim-tree.lua')

    -- Git
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-fugitive')
    use('sindrets/diffview.nvim')

    -- Theme
    use('kyazdani42/nvim-web-devicons')
    use('gruvbox-community/gruvbox')
    use('nvim-treesitter/nvim-treesitter')
    use('ghifarit53/tokyonight-vim')
    use('projekt0n/github-nvim-theme')

    use({
      'hoob3rt/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })

    -- Lsp
    use('neovim/nvim-lspconfig')
    use('nvim-lua/lsp-status.nvim')
    use('norcalli/nvim-colorizer.lua')
    use('RishabhRD/popfix')
    use('RishabhRD/nvim-lsputils')
    use('L3MON4D3/LuaSnip') -- Snippets plugin
    use('rafamadriz/friendly-snippets')
    use('jose-elias-alvarez/null-ls.nvim')

    -- nvim-cmp
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
      },
    })

    -- Telescope
    use({
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- Speed up nvim
    use('nathom/filetype.nvim')

    -- Misc
    use('lukas-reineke/indent-blankline.nvim')
    use('voldikss/vim-floaterm')
    use('matze/vim-move')
    use('zhimsel/vim-stay')
    -- Documentation builder, really useful for TS and Python
    use({
      'danymat/neogen',
      config = require('neogen').setup({ enabled = true }),
    })
    use('airblade/vim-rooter')
    use('bling/vim-bufferline')
    use('tversteeg/registers.nvim')
    use('tpope/vim-scriptease')
    -- Better TODO behavior
    use({ 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' })

    -- Org mode
    use({ 'kristijanhusak/orgmode.nvim' })
    use('mickael-menu/zk-nvim')

    -- Dap
    use('mfussenegger/nvim-dap')

    -- Hop
    use({
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
    })
    -- Scala support
    use({ 'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim' } })
  end,
})
