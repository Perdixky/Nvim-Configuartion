return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,  -- 禁用 mason，使用系统 PATH 中的 clangd
        },
      },
    },
  },
}
