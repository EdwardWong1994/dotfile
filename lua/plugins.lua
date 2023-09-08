-- 插件管理文件
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- 主题配置
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/vscode.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'glepnir/dashboard-nvim',
        event = "VimEnter",
        config = function()
            require("dashboard").setup{
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        {desc = "Find File", group ="find files", key = "Leader f f", action="Telescope find_files"},
                        {desc = "Find Browser", group ="find files", key = "Leader f b", action="Telescope find_browser"},
                        {desc = "Find Word", group ="find files", key = "Leader g g", action="Telescope live_grep"},
                        {desc = "Open Personal Dotfile", group ="find files", key = "Leader e e", action="edit $MYVIMRC"},
                    },
                    packages= {enable=true},
                    footer = {
                        "To Be a Hacker!"
                    },
                },
            }
        end,
        requires = {"nvim-tree/nvim-web-devicons"}
    }
    use {"gbprod/yanky.nvim"}
    use {"folke/which-key.nvim"}
    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} , {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                require('nvim-treesitter.install').update({ with_sync = true })
            end,
        }}
    }
    use {"nvim-telescope/telescope-file-browser.nvim"}
    use {'rmagatti/auto-session'}
    use {"williamboman/mason.nvim"}
    use {"williamboman/mason-lspconfig.nvim"}
    use {"neovim/nvim-lspconfig"}
    -- nvim-cmp
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    -- vsnip   这是用来进行支持代码片段的操作
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    -- lspkind
    use {'onsails/lspkind-nvim'}
    -- lspsaga
    use {'glepnir/lspsaga.nvim'}
    use {'simrat39/symbols-outline.nvim'}

    -- dap
    -- 用于设置代码调试等相关内容
    use {'mfussenegger/nvim-dap'}
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {"theHamsta/nvim-dap-virtual-text", requires = {"nvim-treesitter/nvim-treesitter" , "mfussenegger/nvim-dap"}}
    use {"sakhnik/nvim-gdb", run = "./install.sh"}
    --git
    use {'lewis6991/gitsigns.nvim'}
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    --use {"lervag/vimtex"}
    use {'j178/leetgo'}
    -- latex plugin
    use {'lervag/vimtex'}   -- essential for LaTex; vimscript
    use {'kdheepak/cmp-latex-symbols'}
    use {'jbyuki/nabla.nvim'}   -- show symbols in editor
    use {'nvim-telescope/telescope-bibtex.nvim',
        config=function()
            require 'telescope'.load_extension('bibtex')
        end,
    }
    use {'numToStr/Comment.nvim'}
    use {'kylechui/nvim-surround'}
    use {"mbbill/undotree"} -- Vimscript
end)

