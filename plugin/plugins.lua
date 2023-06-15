vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- luahellper
    use 'nvim-lua/plenary.nvim'
    use 'folke/lsp-colors.nvim'
    -- 컬러스키마
    use {'EdenEast/nightfox.nvim'}
    use {'dracula/vim', as='dracula'}
    use {'sainnhe/everforest'}
    -- 안내문구 테마
    use {"folke/trouble.nvim",}
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
    -- code action icon
    use "onsails/lspkind.nvim"
    -- snippets
    use "rafamadriz/friendly-snippets"
    -- 단어 키워드 및 용도 별로 색지정
    use 'm-demare/hlargs.nvim'
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
    use({"glepnir/lspsaga.nvim",branch = "main",opt = true, event="LspAttach",config = function ()
      require("lspsaga").setup({})
    end,
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }})
    -- telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    use {'nvim-telescope/telescope-dap.nvim'}
    --nvimtree
    use {'kyazdani42/nvim-tree.lua',tag = 'nightly'}
    -- tab bar
    use {'romgrk/barbar.nvim',requires = {{"nvim-tree/nvim-web-devicons"}}}
    --status bar
    use {'nvim-lualine/lualine.nvim'}
    -- icons
    use 'nvim-tree/nvim-web-devicons'
    --comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    } 
    -- autopair
    use {"windwp/nvim-autopairs"}
    --indent
    use {'nmac427/guess-indent.nvim'}
    use {"lukas-reineke/indent-blankline.nvim"}
    --git
    use {'lewis6991/gitsigns.nvim',tag = 'release'}
    --whichkey
    use "folke/which-key.nvim"
    -- debug 
    use {"mfussenegger/nvim-dap"}
    use {"rcarriga/nvim-dap-ui"}
    -- database
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'
end)


