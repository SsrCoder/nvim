return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        formats = {
          header = { "%s", align = "center" },
          footer = { "%s", align = "center" },
        },
        sections = {
          { section = "header", indent = 50 },
          { section = "keys", gap = 1, padding = 2 },
          { section = "startup", indent = 50 },
          { pane = 2, padding = 8 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
  },
}
