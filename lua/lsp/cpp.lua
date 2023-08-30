local lspconfig = require('lspconfig')
local lsp_set_keymap = require("keybindings")
local on_attach = function(_, bufnr)
    lsp_set_keymap.set_keymap(bufnr)
    --编译
    -- vim.api.nvim_buf_set_keymap(bufnr,"n","<F7>","<cmd>make<CR>",{silent=true,noremap=true})
    --编译运行:
    --vim.api_nvim_buf_set_keymap(bufnr,"n","<F5>","<cmd>make run<CR>",{silent=true, noremap=true})
end

lspconfig.clangd.setup {
    on_attach = on_attach
}
