-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

return require('packer').startup {
  function(use)
        -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use 'itchyny/lightline.vim'
    use 'edkolev/tmuxline.vim'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'simnalamburt/vim-mundo'
    -- Markdown
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use {'ms-jpq/chadtree'}

    -- Git
    use 'airblade/vim-gitgutter'

    -- Theme
    use 'kyazdani42/nvim-web-devicons'
    use 'gruvbox-community/gruvbox'
    use 'nvim-treesitter/nvim-treesitter'

    -- Find and replace
    use 'brooth/far.vim'

    -- JS, TS, HTML and CSS plugins
    use { 'prettier/vim-prettier', run = 'yarn install' }
    use 'mattn/emmet-vim'

    -- Fzf
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}  -- to enable preview (optional)

    -- Lsp
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'steelsojka/completion-buffers'}
    use {'nvim-lua/lsp-status.nvim'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'RishabhRD/popfix'}
    use {'RishabhRD/nvim-lsputils'}

    -- Snippets
    use {'honza/vim-snippets'}
    use {'SirVer/ultisnips'}
    use {'voldikss/vim-floaterm'}
    use {'tpope/vim-fugitive'}

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Misc
    use {'unblevable/quick-scope'}
    use {'matze/vim-move'}
    use {'zhimsel/vim-stay'}
    -- Documentation builder, really useful for TS and Python
    use {'kkoomen/vim-doge'}
    use {'plasticboy/vim-markdown'}
    use {'airblade/vim-rooter'}
    use {'bling/vim-bufferline'}
  end
}
