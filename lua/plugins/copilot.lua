return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      copilot_model = "gpt-4o-copilot",
    })
  end,
}
