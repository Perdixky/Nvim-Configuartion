return {
  {
    "Mythos-404/xmake.nvim",
    lazy = true,
    event = "BufReadPost",
    config = true,
    opts = {
      -- 调试有关配置
      debuger = {
        -- 检测项目的构建模式, 如果不是下方中的目标将
        -- 自动切换为 `debug` 模式来构建运行,
        -- 并且自动切回原构建模式
        rulus = { "debug", "releasedbg" },
        -- Dap 配置, 请自行查询 Dap 和调试器的文档
        dap = {
          name = "Xmake Debug",
          type = "codelldb",
          request = "launch",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          stopOnEntry = false,
          runInTerminal = true,
        },
        -- 运行器配置
        runner = {
          -- 选择哪个作为后端
          type = "toggleterm", ---@type "toggleterm"|"terminal"|"quickfix"

          config = {
            toggleterm = {
              direction = "float", ---@type "vertical"|"horizontal"|"tab"|"float"
              singleton = true,
              auto_scroll = true,
              close_on_success = false,
            },
            terminal = {
              name = "Runner Terminal",
              prefix_name = "[Xmake]: ",
              split_size = 15,
              split_direction = "horizontal", ---@type "vertical"|"horizontal"
              focus = true,
              focus_auto_insert = true,
              auto_resize = true,
              close_on_success = false,
            },
            quickfix = {
              show = "always", ---@type "always"|"only_on_error"
              size = 15,
              position = "botright", ---@type "vertical"|"horizontal"|"leftabove"|"aboveleft"|"rightbelow"|"belowright"|"topleft"|"botright"
              close_on_success = false,
            },
          },
        },
      },
    },
  },
}
