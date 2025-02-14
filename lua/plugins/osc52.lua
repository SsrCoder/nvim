return {
  {
    "ojroques/nvim-osc52",
    opts = {
      max_length = 0, -- Maximum length of selection (0 for no limit)
      silent = true, -- Disable message on successful copy
      trim = false, -- Trim surrounding whitespaces before copy
      tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
    },
    keys = {
      {
        "gy",
        function()
          require("osc52").copy_visual()
        end,
        mode = "v",
      },
      -- { "gyy", require("osc52").copy_visual, mode = "v" },
      { "gp", '"+p', mode = "n" },
    },
  },
}
