return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.astro = { "biome" }

      -- optional: use biome for normal web stuff too
      opts.formatters_by_ft.javascript = { "biome" }
      opts.formatters_by_ft.javascriptreact = { "biome" }
      opts.formatters_by_ft.typescript = { "biome" }
      opts.formatters_by_ft.typescriptreact = { "biome" }
      opts.formatters_by_ft.json = { "biome" }
      opts.formatters_by_ft.css = { "biome" }
    end,
  },
}
