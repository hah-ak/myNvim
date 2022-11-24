vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- luahellper
    use 'nvim-lua/plenary.nvim'
    -- 컬러스키마
    use 'folke/lsp-colors.nvim'
    -- ui테마 
    use { "ellisonleao/gruvbox.nvim" }
    -- 안내문구 테마
    use {
      "folke/trouble.nvim",
    }
    -- 자동완성
    use {'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rcarriga/cmp-dap'
        }
    }
    -- snippets
    use "rafamadriz/friendly-snippets"
    -- 단어 키워드 및 용도 별로 색지정
    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    -- lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'mfussenegger/nvim-jdtls'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'simrat39/rust-tools.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main"
    })
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use {'nvim-telescope/telescope-dap.nvim'}
    --nvimtree
    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- tab bar
    use {
        'romgrk/barbar.nvim'
    }
    --status bar
    use {
        'nvim-lualine/lualine.nvim'
    }
    -- icons
    use 'kyazdani42/nvim-web-devicons'
    --comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- autosave
    -- use{
        -- "Pocco81/auto-save.nvim",
        -- config = function()
        --      require("auto-save").setup {
        --         -- your config goes here
        --         -- or just leave it empty :)
        --      }
        -- end,
    -- }
    -- autopair
    use {
	    "windwp/nvim-autopairs",
    }
    --indent
    use {
        'nmac427/guess-indent.nvim',
    }
    use {"lukas-reineke/indent-blankline.nvim"}
    --git
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    }
    -- debug 
    use {"mfussenegger/nvim-dap"}
    use {"rcarriga/nvim-dap-ui"}
    -- database
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'
end)


