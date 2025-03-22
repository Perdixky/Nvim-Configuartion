-- require("config.lazy")
local function is_termux()
  if vim.fn.has("unix") == 1 then
    if os.getenv("TERMUX_VERSION") ~= nil then
      return true
    end
  end
end

if is_termux() then
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          clangd = {
            mason = false
          }
        }
      }
    }
  }
end
