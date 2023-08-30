local lsp_set_keymap = require("keybindings")
-- 定义快捷键
-- 根据官方的提示，这里我们使用 on_attach 表示当前缓冲加载服务端完成之后调用
local on_attach = function(_, bufnr)
    lsp_set_keymap.set_keymap(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.jsonls.setup{
    capabilities =  capabilities,
    filetypes = {"json","jsonc"},
    init_options={provideFormatter = true},
    on_attach = on_attach,
}
