return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "User AstroFile",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-m>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
