return {
  "matze/vim-move",
  event = { "User AstroFile", "InsertEnter" },
  config = function()
    vim.g.move_key_modifier = "C"
    vim.g.move_key_modifier_visualmode = "C"

    vim.keymap.set("n", "<C-k>", "<Plug>MoveLineUp", { desc = "Move line up" })
    vim.keymap.set("n", "<C-j>", "<Plug>MoveLineDown", { desc = "Move line down" })
    vim.keymap.set("n", "<C-h>", "<Plug>MoveCharLeft", { desc = "Move character left" })
    vim.keymap.set("n", "<C-l>", "<Plug>MoveCharRight", { desc = "Move character right" })

    vim.keymap.set("x", "<C-k>", "<Plug>MoveBlockUp", { desc = "Move block up" })
    vim.keymap.set("x", "<C-j>", "<Plug>MoveBlockDown", { desc = "Move block down" })
    vim.keymap.set("x", "<C-h>", "<Plug>MoveBlockLeft", { desc = "Move block left" })
    vim.keymap.set("x", "<C-l>", "<Plug>MoveBlockRight", { desc = "Move block right" })
  end,
}
