
-- 这段代码是对dap-ui的配置，包装了很多调试相关的窗口，例如变量监控、调用栈等等，可以对它进行配置，让这些窗口元素出现在我们希望它出现的位置
local dapui = require("dapui")

dapui.setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    layouts = {
        {
            elements = {
                {
                    id = 'scopes',
                    size = 0.25
                },
                {id = "stacks", size = 0.25},
                {id = "watches", size = 0.25},
                {id = "breakpoints", size = 0.25},
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "repl"
            },
            size = 0.25,
            position = "bottom",
        }
    },

    controls = {enabled = true},
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})

---设置了几个回调函数，当事件发生时就会调用相应的函数

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

-- 退出时自动退出repl窗口
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
    dap.repl.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
    dap.repl.close()
end

-- 使用了nvim-dap-virtual-text插件，在调试的过程中，在变量附近实时显示变量的值

require("nvim-dap-virtual-text").setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = '<module',
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})
