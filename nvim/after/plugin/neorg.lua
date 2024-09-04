require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {
      config = {                        -- We added a `config` table!
        icon_preset = "basic",         -- And we set our option here.
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.esupports.hop"] = {}
  },
})
