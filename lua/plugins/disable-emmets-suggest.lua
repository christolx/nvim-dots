-- ~/.config/nvim/lua/plugins/no-emmet-completion.lua
return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          lsp = {
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.detail ~= "Emmet Abbreviation"
              end, items)
            end,
          },
        },
      },
    },
  },
}
