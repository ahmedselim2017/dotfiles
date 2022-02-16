vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use({
	    "catppuccin/nvim",
	    as = "catppuccin"
    })

    -- A File Explorer For Neovim Written In Lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }
    
    -- LSPconfig
    use 'neovim/nvim-lspconfig'

    -- LSPSage
    use 'glepnir/lspsaga.nvim'

    -- A snazzy bufferline for Neovim
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp'
        }
    }

    -- LuaSnip
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    }
    
    -- The fastest Neovim colorizer.
    use 'norcalli/nvim-colorizer.lua'

    -- Lightning fast left-right movement in Vim
    use 'unblevable/quick-scope'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- TODO: Find, Filter, Preview, Pick. All lua, all the time.
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- TODO: Git integration for buffers
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- TODO: magit for neovim
    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim' 
        }
    }
    
    -- A super powerful autopair plugin for Neovim that supports multiple
    -- characters.
    use 'windwp/nvim-autopairs'

    -- Neovim commenting plugin, written in lua.
    use 'b3nj5m1n/kommentary'

    -- Pandoc integration and utilities for vim
    use {
        'vim-pandoc/vim-pandoc',
        require = {
            'vim-pandoc/vim-pandoc-syntax'
        }
    }
    
    -- An asynchronous linter
    use 'mfussenegger/nvim-lint'

    -- A format runner for neovim, written in lua.
    use 'mhartington/formatter.nvim'

end)
