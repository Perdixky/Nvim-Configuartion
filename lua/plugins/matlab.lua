local function get_matlab_install_path()
  local handle = io.popen("where matlab")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and #result > 0 then
      -- 拿第一行，并去掉结尾的 \bin\matlab.exe
      local first_line = result:match("([^\r\n]+)")
      if first_line then
        local install_path = first_line:gsub("[/\\]bin[/\\]matlab%.exe$", "")
        return install_path
      end
    end
  end
  return nil
end

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
              installPath = get_matlab_install_path(),
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
