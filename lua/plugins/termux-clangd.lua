return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = function()
            if vim.fn.has("unix") == 1 then
              if os.getenv("TERMUX_VERSION") ~= nil then
                return false
              else
                return true
              end
            end
          end,
        },
      },
    },
  },
}
