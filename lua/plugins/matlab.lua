return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        matlab_ls = {
          cmd = { "matlab-language-server", "--stdio" },
          settings = {
            MATLAB = {
              indexWorkspace = true,
              installPath = "E:\\MathWorks",
            },
          },
          single_file_support = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "matlab", "lua", "python" }, -- 加入 matlab
      highlight = { enable = true },
    },
  },
}
