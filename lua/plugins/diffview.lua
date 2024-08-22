local core = require "astrocore"

local function isCommitId(str) return vim.fn.match(str, "^[0-9a-fA-F]\\{7,40}$") ~= -1 end

-- NOTE: configuration based on AstroNvim Community
-- see https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/git/diffview-nvim/init.lua for details
return {
  {
    "sindrets/diffview.nvim",
    -- FIX: the keys in diffview oonflict with AstroNvim's default system mapping.
    -- we considered to use `VeryLazy` instead `User AstroGitFile` to make sure diffview will be loaded before those default plugins within AstroNvim, just in order not to modify codes outside of the `nvim/lua/user/`
    event = "VeryLazy",
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
      hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
    },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Git status" },
      {
        -- NOTE: same as `:DiffviewOpen <commit_id>`
        "<leader>gV",
        function()
          local reg1 = vim.fn.getreg '"' -- @" ""
          local reg2 = vim.fn.getreg "+" -- @+ "+
          local commit_id = "unknown commit id"
          if isCommitId(reg1) then
            commit_id = reg1
          elseif isCommitId(reg2) then
            commit_id = reg2
          else
            core.notify(
              string.format('can not find legal commit id in registers\n\t@": %s\n\t@+: %s', reg1, reg2),
              vim.log.levels.ERROR,
              { title = "Diffview.nvim" }
            )
          end
          require("diffview").open { commit_id }
        end,
        desc = "Diffview Git status (certain commit)",
      },
      { "<leader>gh", "<cmd>DiffviewFileHistory --max-count<cr>", desc = "Diffview Git log" },
      { "<leader>gH", "<cmd>DiffviewFileHistory % --max-count<cr>", desc = "Diffview Git log (current file)" },
    },
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { integrations = { diffview = true } },
  },
}
