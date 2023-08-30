--- 这段代码提供了显示关键词的作用
local wk = require("which-key")

-- wk.register({
--     f = {
--         name = "myvimrc", -- 指定该快捷键组的名称
--         f = {":edit $MYVIMRC<CR>", "Open vimrc"}, -- 创建新的快捷键绑定
--         s = {":source $MYVIMRC<CR>", "reload vimrc", noremap = true},
--         -- 也可以只显示一个标签而不绑定到具体的快捷键
--         e = {"New File"}
--     }
-- }, {prefix = "<leader>"})


--wk.register({
--    ["<leader>"] = {
--        f = {
--            name = "myvimrc", -- 指定该快捷键组的名称
--            f = {":edit $MYVIMRC<CR>", "Open vimrc"}, -- 创建新的快捷键绑定
--            s = {":source $MYVIMRC<CR>", "reload vimrc", noremap = true},
--            -- 也可以只显示一个标签而不绑定到具体的快捷键
--            e = {"New File"}
--        }
--    }
--}, {silent = true, noremap = true})

wk.register({
    ["s"] = {
        name = "split window",
        v = { ":vsp<CR>", "vertical split window" },
        --不知道为何没有反应
        h = { ":sh<CR>", "horizontal split window"},
        c = { ":close<CR>", "close this window"},
        o = { ":only<CR>", "close all but this window"},
    },
})



local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- hjknoyz

-- GENERAL MAPPINGS

local mappings = {
    a = {
        name = "ACTIONS",
        a = { "<cmd>lua PdfAnnots()<CR>", "annotate"},
        b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export"},
        c = { "<cmd>VimtexClean<CR>"            , "clean aux" },
        g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary"},
        l = { "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP"},
        p = { '<cmd>lua require("nabla").popup()<CR>', "preview symbols"},
        r = { "<cmd>VimtexErrors<CR>"           , "report errors" },
        s = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets"},
        -- w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
        v = { "<plug>(vimtex-context-menu)"            , "vimtex menu" },
    },
    f = {
        name = "FIND",
        c = { "<cmd>Telescope bibtex<CR>"       , "citations" },
        g = { "<cmd>Telescope git_branches<CR>", "branches" },
        h = { "<cmd>Telescope help_tags<CR>", "help" },
        k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
        -- m = { "<cmd>Telescope man_pages<CR>", "man pages" },
        r = { "<cmd>Telescope registers<CR>", "registers" },
        t = { "<cmd>Telescope colorscheme<CR>", "theme" },
        y = { "<cmd>YankyRingHistory<CR>"       , "yanks" },
        -- c = { "<cmd>Telescope commands<CR>", "commands" },
        -- r = { "<cmd>Telescope oldfiles<CR>", "recent" },
    },
    g = {
        name = "GIT",
        -- ln  找到下一个改变的位置
        n = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "next hunk" },
        --  lp  找到上一个改变的位置
        p = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "prev hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "blame" },
        --  lv
        v = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "preview hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "unstage hunk" },
        o = { "<cmd>Telescope git_status<CR>", "open changed file" },
        b = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
        c = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
    },
    --管理session
    --s = {
    --    name = "MANAGE SESSIONS",
    -- ss ：存储session
    --    s = { "<cmd>SessionManager save_current_session<CR>", "save" },
    --sd：删除session 
    --    d = { "<cmd>SessionManager delete_session<CR>", "delete" },
    -- sl: 记载session
    --    l = { "<cmd>SessionManager load_session<CR>", "load" },
    -- },
    ---pandoc的一些快捷键
    p = {
        name = "PANDOC",
        --pw  转化为word
        w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
        -- pm   转化为markdown
        m = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>"   , "markdown"},
        -- ph  转化为html
        h = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>" , "html"},
        --pl 转化为latex
        l = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>"  , "latex"},
        --pp  转化为pdf
        p = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf'<CR>"  , "pdf"},
        -- x = { "<cmd>echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
    },
    s = {
        name = "SURROUND",
        --ns
        s = { "<Plug>(nvim-surround-normal)", "surround" },
        -- nd   
        d = { "<Plug>(nvim-surround-delete)", "delete" },
        --nc
        c = { "<Plug>(nvim-surround-change)", "change" },
    },
    -- 关于latex模版的快捷键
    t = {
        name = "latex",
        --c = { "<cmd>PackerCompile<CR>", "Compile" },
        ["c"] = { "<cmd>VimtexCompile<CR>"            , "build" },
        ["w"] = { "<cmd>VimtexCountWords!<CR>"        , "count" },
        ["i"] = { "<cmd>VimtexTocOpen<CR>"            , "index" },
        ["q"] = { "<cmd>wqa!<CR>"                     , "quit" },
        ["v"] = { "<cmd>VimtexView<CR>"               , "view" },
        --    ["w"] = { "<cmd>wa!<CR>"                      , "write" },
        p = { 
            "<cmd>read ~/.config/nvim/templates/PhilPaper.tex<CR>", 
            "PhilPaper.tex",
        },
        l = { 
            "<cmd>read ~/.config/nvim/templates/Letter.tex<CR>",
            "Letter.tex",
        },
        g = { 
            "<cmd>read ~/.config/nvim/templates/Glossary.tex<CR>", 
            "Glossary.tex",
        },
        h = { 
            "<cmd>read ~/.config/nvim/templates/HandOut.tex<CR>", 
            "HandOut.tex",
        },
        b = { 
            "<cmd>read ~/.config/nvim/templates/PhilBeamer.tex<CR>", 
            "PhilBeamer.tex",
        },
        s = { 
            "<cmd>read ~/.config/nvim/templates/SubFile.tex<CR>", 
            "SubFile.tex",
        },
        r = { 
            "<cmd>read ~/.config/nvim/templates/Root.tex<CR>", 
            "Root.tex",
        },
        m = { 
            "<cmd>read ~/.config/nvim/templates/MultipleAnswer.tex<CR>", 
            "MultipleAnswer.tex",
        },
    },
}

wk.register(mappings, opts)
