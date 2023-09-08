-- 这段代码提供了弹窗文件搜索功能
require('telescope').load_extension "file_browser"


--只是设置快捷键


local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

--  local actions = require "telescope.actions"

-- local job_opts = {
--   entry_maker = function(entry)
--     local _, _, filename, lnum, col, text = string.find(entry, "([^:]+):(%d+):(.*)")
--     local table = {
--       ordinal = text,
--       display = filename .. ":" .. text
--     }
--     return table
--   end
-- }
--
-- local opts = {
--   finder = finders.new_oneshot_job(rg, job_opts),
--   sorter = sorters.get_generic_fuzzy_sorter(),
-- }

telescope.setup {
    defaults = {
        mappings ={
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    load_extensions = { "bibtex"},
    extensions = {
        bibtex = {
            depth = 1,
            -- Depth for the *.bib file
            custom_formats = {},
            -- Custom format for citation label
            format = '',
            -- Format to use for citation label.
            -- Try to match the filetype by default, or use 'plain'
            global_files = {'~/Library/texmf/bibtex/bib/Zotero.bib'},
            -- Path to global bibliographies (placed outside of the project)
            search_keys = { 'author', 'year', 'title' },
            -- Define the search keys to use in the picker
            citation_format = '{{author}} ({{year}}), {{title}}.',
            -- Template for the formatted citation
            citation_trim_firstname = true,
            -- Only use initials for the authors first name
            citation_max_auth = 2,
            -- Max number of authors to write in the formatted citation
            -- following authors will be replaced by "et al."
            context = false,
            -- Context awareness disabled by default
            context_fallback = true,
            -- Fallback to global/directory .bib files if context not found
            -- This setting has no effect if context = false
            wrap = false,
            -- Wrapping in the preview window is disabled by default
        },
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}
vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gg", "<Cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<Cmd>Telescope oldfiles<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<Cmd>Telescope file_browser<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fm", "<Cmd>Telescope marks<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fj", "<Cmd>Telescope jumplist<CR>", {noremap = true, silent = true})

