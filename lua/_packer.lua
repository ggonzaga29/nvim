
-- should have been plugins.lua but too lazy.

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        use "andweeb/presence.nvim"

        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons" -- optional, for file icons
            },
            tag = "nightly" -- optional, updated every week. (see issue #1193)
        }

        -- use "ellisonleao/gruvbox.nvim"

        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
                require("catppuccin").setup()
                vim.api.nvim_command "colorscheme catppuccin"
            end
        }

        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true}
        }

        use "lukas-reineke/indent-blankline.nvim"
        use {
            "romgrk/barbar.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        }
        
        use "tpope/vim-commentary"

--        use "jiangmiao/auto-pairs"
        use {
            "akinsho/toggleterm.nvim",
            tag = "*",
            config = function()
                require("toggleterm").setup()
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }

        use "neovim/nvim-lspconfig"

        use {"williamboman/mason.nvim"}

        use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
        use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

        use {
            "VonHeikemen/lsp-zero.nvim",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                -- Autocompletion
                {"hrsh7th/nvim-cmp"},
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-cmdline"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-nvim-lua"},
                -- Snippets
                {"L3MON4D3/LuaSnip"},
                {"rafamadriz/friendly-snippets"}
            },

            config = [[ require('plugins/lsp-zero')]]
        }

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        use 'mattn/emmet-vim'

        use 'tpope/vim-surround'
        
       -- use {
        --   'gorbit99/codewindow.nvim',
        --   config = function()
        --     local codewindow = require('codewindow')
        --     codewindow.setup()
        --     codewindow.apply_default_keybinds()
        --   end,
        -- }

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
