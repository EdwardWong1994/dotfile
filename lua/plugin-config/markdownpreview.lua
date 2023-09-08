

--" set to 1, nvim will open the preview window after entering the markdown buffer
--" default: 0
vim.g['mkdp_auto_start']=0

--" set to 1, the nvim will auto close current preview window when change
--" from markdown buffer to another buffer
--" default: 1
vim.g['mkdp_auto_close'] = 1


-- set to 1, the vim will refresh markdown when save the buffer or
--" leave from insert mode, default 0 is auto refresh markdown as you edit or
--" move the cursor
--" default: 0

vim.g['mkdp_refresh_slow']=0

--" set to 1, the MarkdownPreview command can be use for all files,
--" by default it can be use in markdown file
--" default: 0

vim.g['mkdp_command_for_global']=0

--" use a custom markdown style must be absolute path
--" like '/Users/username/markdown.css' or expand('~/markdown.css')
--let g:mkdp_markdown_css = ''

--" use a custom highlight style must absolute path
--" like '/Users/username/highlight.css' or expand('~/highlight.css')
vim.g['mkdp_highlight_css'] = ''

--" use a custom port to start server or empty for random
vim.g['mkdp_port'] = ''

--" preview page title
--" ${name} will be replace with the file name
vim.g['mkdp_page_title'] = '「${name}」'

--" recognized filetypes
--" these filetypes will have MarkdownPreview... commands
vim.g['mkdp_filetype'] = 'markdown'

--" set default theme (dark or light)
--" By default the theme is define according to the preferences of the system
vim.g['mkdp_theme'] = 'light'


--  关于vim-markdown的一些配置
--  主要是conceal的一些操作
vim.g['vim_markdown_conceal']=0
--代码块
vim.g['vim_markdown_conceal_code_blocks']=0
-- latex数学公式
vim.g['tex_conceal']=""
vim.g['vim_markdown_math']=1
--关闭折叠
vim.g['vim_markdown_folding_disabled']=1
--让其他类型的文件遵循上述标准
vim.g['vim_markdown_auto_extension_ext']='txt'

-- vim-table-mode的设置情况
--
vim.g['table_mode_corner']='|'
