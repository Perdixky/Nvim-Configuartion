-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 默认关闭inlay_hint
vim.lsp.inlay_hint.enable(false, nil)

vim.keymap.set("n", "<C-u>", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Show inlay hints" })

vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Continue" })
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step over" })
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step into" })
vim.keymap.set("n", "<S-F5>", function()
  require("dap").tertminate()
end, { desc = "Stop" })
vim.keymap.set("n", "<C-S-F5>", function()
  require("dap").restart()
end, { desc = "Restart" })
vim.keymap.set("n", "<F6>", function()
  require("dap").pause()
end, { desc = "Pause" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

vim.o.expandtab = true
-- vim.o.tabstop = 4
-- vim.o.softtabstop = 4
-- vim.o.shiftwidth = 4

-- init.lua
local function is_wsl()
  if vim.fn.has("unix") == 1 then
    if os.getenv("WSL_DISTRO_NAME") ~= nil then
      return true
    end
    local uname = vim.fn.system("uname -r"):lower()
    if uname:find("microsoft") or uname:find("wsl") then
      return true
    end
  end
  return false
end

local function is_termux()
  if vim.fn.has("unix") == 1 then
    if os.getenv("TERMUX_VERSION") ~= nil then
      return true
    end
  end
end

-- 在neovide中如果使用win32yank会有bug
-- if not vim.g.neovide and is_wsl() then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] = "powershell.exe -c Get-Clipboard",
--       ["*"] = "powershell.exe -c Get-Clipboard",
--     },
--     cache_enabled = 0,
--   }
-- end

if not vim.g.neovide and is_termux() then
  vim.g.clipboard = {
    name = "TermuxClipboard",
    copy = {
      ["+"] = "termux-clipboard-set",
      ["*"] = "termux-clipboard-set",
    },
    paste = {
      ["+"] = "termux-clipboard-get",
      ["*"] = "termux-clipboard-get",
    },
    cache_enabled = 0,
  }
end

if vim.g.neovide then
  -- 选择字体
  vim.o.guifont = "Cascadia Code NF"

  local function set_ime(args)
    if args.event:match("Enter$") then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  })

  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_no_idle = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
end
