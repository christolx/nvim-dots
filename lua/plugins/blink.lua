-- ~/.config/nvim/lua/plugins/blink-manual.lua
return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          auto_show = false,
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
