-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then return end

  local directory = string.format(
    '%s/site/pack/packer/opt/', vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(
    string.format(
      'git clone %s %s', 'https://github.com/wbthomason/packer.nvim',
      directory .. '/packer.nvim'
    )
  )

  print(out)
  print('Downloading packer.nvim...')

  return
end

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- use 'itchyny/lightline.vim'
    use 'edkolev/tmuxline.vim'
    use 'windwp/nvim-autopairs'
    use 'simnalamburt/vim-mundo'
    use 'b3nj5m1n/kommentary'

    -- Markdown
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    -- Navigation
    use {'kyazdani42/nvim-tree.lua'}

    -- Git
    use {'lewis6991/gitsigns.nvim'}
    use {'tpope/vim-fugitive'}

    -- Theme
    use 'kyazdani42/nvim-web-devicons'
    use 'gruvbox-community/gruvbox'
    use 'nvim-treesitter/nvim-treesitter'
    use 'ghifarit53/tokyonight-vim'
    use 'projekt0n/github-nvim-theme'

    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }

    -- Find and replace
    use 'brooth/far.vim'

    -- JS, TS, HTML and CSS plugins
    use 'mattn/emmet-vim'

    -- Fzf
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'} -- to enable preview (optional)

    -- Lsp
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/lsp-status.nvim'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'RishabhRD/popfix'}
    use {'RishabhRD/nvim-lsputils'}
    use {'hrsh7th/nvim-compe'}
    use {
      "folke/lsp-trouble.nvim",
      config = function()
        -- Can use P to toggle auto movement
        require("trouble").setup {
          auto_preview = false,
          auto_fold = true,
        }
      end,
    }

    -- Snippets
    use {'honza/vim-snippets'}
    use {'SirVer/ultisnips'}
    use {'voldikss/vim-floaterm'}

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {'camspiers/snap'}

    -- Misc
    use {'matze/vim-move'}
    use {'zhimsel/vim-stay'}
    -- Documentation builder, really useful for TS and Python
    use {'kkoomen/vim-doge'}
    use {'plasticboy/vim-markdown'}
    use {'airblade/vim-rooter'}
    use {'bling/vim-bufferline'}
    use {'tversteeg/registers.nvim'}
    use {
      'tpope/vim-scriptease',
      cmd = {
        'Messages', -- view messages in quickfix list
        'Verbose', -- view verbose output in preview window.
        'Time', -- measure how long it takes to run some stuff.
      },
    }
  end,
}
