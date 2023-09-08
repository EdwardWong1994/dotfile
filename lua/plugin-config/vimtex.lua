-- PDF Viewerc
-- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
-- 与latex有关的配置文件
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_quickfix_mode'] =0
vim.g['vimtex_view_skim_sync']=1   --每一次编译后，鼠标在tex文件中的位置和pdf的位置是一直的
vim.g['vimtex_view_skim_activate']=1
-- Ignore mappings
--vim.g['vimtex_mappings_enabled'] = 0   --会把所有vimtex的默认映射键取消

-- Auto Indent
vim.g['vimtex_indent_enabled'] = 0


-- Syntax highlighting
vim.g['vimtex_syntax_enabled'] = 1

-- Error suppression:
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

vim.g['vimtex_log_ignore'] = ({
    'Underfull',
    'Overfull',
    'specifier changed to',
    'Token not allowed in a PDF string',
})

vim.g['vimtex_context_pdf_viewer'] = 'zathura'


-- 关闭quickfox的warning提示
vim.g['vimtex_quickfix_open_on_warning']=0


-- vim.g['vimtex_complete_enabled'] = 1
-- vim.g['vimtex_compiler_progname'] = 'nvr'
-- vim.g['vimtex_complete_close_braces'] = 1
--

-- 对vimtex的快捷键进行配置

-- ac  --> at command
-- id  -->in command
-- ae  --> at enviorment
-- dse  --> delete surround environment
-- cse  --> change surround environment
-- dsc  --> delete surround command
-- dsd  --> delete surround delimiter  ,可以删除（），【】，\left \right ,\big \big之间的内容
-- csd  --> change surround delimiter
-- dsm  -->  delete surround math
-- csm  --> 变换公式环境成行内公式，但是不知道为什么无法让行内公式成为equatuon
-- tsc  -->  toggle surround  command
-- tse  -->  toggle surround environment
-- tsm  --> toggle surround math
-- tsd  -->  toggle  between left/right with  parentheses 
-- tsf  --> toggle surrounding fractions using tsf
-- ]]/[[  --> 在不同的section之间跳转
-- ]e/[e   --> 在不同公式之间跳转
-- ]f/[f   -->在不同frame之间进行跳转
vim.cmd[[nmap <expr> dsm '<Plug>(vimtex-env-delete-math)']]
vim.cmd[[nmap <expr> csm '<Plug>(vimtex-env-change-math)']]
vim.cmd[[nmap <expr> tsm '<Plug>(vimtex-env-toggle-math)']]
vim.cmd[[nmap <expr> ]e '<Plug>(vimtex-]m)']]
vim.cmd[[nmap <expr> [e '<Plug>(vimtex-[m)']]

vim.cmd[[nmap <expr> ]f '<Plug>(vimtex-]r)']]
vim.cmd[[nmap <expr> [f '<Plug>(vimtex-[r)']]
--vim.cmd[[nmap <expr> ]E '<Plug>(vimtex-]E)']]
--vim.cmd[[nmap <expr> [E '<Plug>(vimtex-[E)']]






