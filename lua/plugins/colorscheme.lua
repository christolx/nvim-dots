return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      terminal_colors = false,
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      -- your current line should be under `options`
      options = {
        terminal_colors = false,
      },

      colors = {
        my_warn = "#e5c07b",
        my_warn_bg = "#2b2518",
        my_inlay = "#6b7280", -- pick color
      },

      highlights = {

        -- wrap line break symbol color
        NonText = {
          fg = "#c9cbff",
        },

        -- main diagnostic warning color
        DiagnosticWarn = { fg = "${my_warn}" },

        -- right-side text: "Expression value is unused"
        DiagnosticVirtualTextWarn = {
          fg = "${my_warn}",
          bg = "${my_warn_bg}",
        },

        -- gutter/sign icon
        DiagnosticSignWarn = { fg = "${my_warn}" },

        -- squiggly underline
        DiagnosticUnderlineWarn = {
          sp = "${my_warn}",
          undercurl = true,
        },

        -- floating diagnostic window warning text
        DiagnosticFloatingWarn = { fg = "${my_warn}" },

        LspInlayHint = {
          fg = "${my_inlay}",
          bg = "NONE",
          italic = true, -- optional
        },
      },
    },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.o.termguicolors = true
      vim.g.gruvbox_material_background = "hard" -- hard | medum | soft
      vim.g.gruvbox_material_foreground = "material" -- material | mix | original
      vim.g.gruvbox_material_enable_italic = 1
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
