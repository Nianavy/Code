require("config.options") -- 选项
require("config.keymaps") -- 按键设置
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- win特别注意python解释器路径，环境变量，pip安装要注意upgrade
vim.g.python3_host_prog = 'python.exe'
