
--- 提供代码高亮功能
-- ：TSInstallInfo --> 查看当前安装了哪些模块
-- ： TSUpdte《语言》 --> 更新指定语言模块
--  TSInstall <语言>  --> 安装指定语言的模块
--  同时也提供了代码格式化的功能
--  =  --> 会格式化代码
--
--  <CR> 代码增量选择
--  退格键 减少增量代码的选择
--  zc--> 折叠代码
--  zo --> 展开代码
--  % --> 成块的代码跳转
require('nvim-treesitter.configs').setup({
    -- 支持的语言
    ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "c", "cpp", "python"},
    -- 启用代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },

    -- 启用基于 Treesitter 的代码格式化(=)
    indent = {
        enable = true
    },
})

-- 开启代码折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- 默认不折叠
vim.wo.foldlevel = 99
