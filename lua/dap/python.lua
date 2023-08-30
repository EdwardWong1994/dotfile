-- 配置适配器，主要是用来配置加载那个调试器，在这段代码是调试python
--local dap = require('dap')

--dap.adapters.python = {
  --  type = 'executable';

    -- executable是指由客户端自行启动调试器，server表示调试器已经单独启动，后续客户端只需要将调试的请求发送到服务器即可
   -- command = '/usr/bin/python3';
    -- args = {'-m', 'debugpy.adapter'};
 -- }

  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable';
    command = '/usr/local/bin/python3';
    args = { '-m', 'debugpy.adapter' };
  }
--  配置如何进行调试。配置都放在一个名为dap.configurations.language的字典中
--dap.configurations.python = {
  --  {
    --    type = "python";    -- 指明使用哪个调试器，跟之前配置的dap.adapter有关
    --    request = "launch";   -- 调试的方式，支持attach附加到一个已有的进程或者launch启动一个新的进程，在adpter中设置的是executabl指定客户端来启动调试器，所以这个地方应该是launch
    --    name = "launch file";   -- name是一个字符串，它表示当前配置的名称，可以理解为一个id

    --    program = "${file}";   -- 需要调试的代码，${file}表示当前buffer所对应的文件
    --    pythonPath = function ()      --执行该文件需要使用的python解析器路径
    --        return "/usr/bin/python3"
    --    end
   -- },
-- }


    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
          return '/usr/local/bin/python3'
        end;
      },
    }
