-- NOTE: mode could be one of the following
-- window (default)
-- virtual
local mode = "window"
return {
  "FabijanZulj/blame.nvim",
  cmd = "BlameToggle",
  opts = {},
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["bl"] = {
              "<cmd>BlameToggle " .. mode .. "<cr>",
              desc = "Toggle git blame",
            },
          },
        },
      },
    },
    { "AstroNvim/astroui", opts = { status = { winbar = { enabled = { filetype = { "blame" } } } } } },
  },
}
