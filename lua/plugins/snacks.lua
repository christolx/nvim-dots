return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.explorer = opts.picker.sources.explorer or {}

      local explorer = opts.picker.sources.explorer
      explorer.actions = explorer.actions or {}
      explorer.win = explorer.win or {}
      explorer.win.list = explorer.win.list or {}
      explorer.win.list.keys = explorer.win.list.keys or {}

      explorer.actions.explorer_expand_all = function(picker)
        local Tree = require("snacks.explorer.tree")
        local Actions = require("snacks.explorer.actions")
        local root = Tree:find(picker:cwd())
        local filter = Tree:filter(picker.opts)

        Tree:walk(root, function(node)
          if node ~= root and not filter(node) then
            return false
          end

          if node.dir then
            node.open = true
            if not node.expanded then
              Tree:expand(node)
            end
          end
        end, { all = true })

        Actions.update(picker, { refresh = true })
      end

      explorer.actions.explorer_expand_subtree = function(picker, item)
        if not item or not item.dir then
          Snacks.notify.warn("Select a directory to expand")
          return
        end

        local Tree = require("snacks.explorer.tree")
        local Actions = require("snacks.explorer.actions")
        local root = Tree:find(item.file)
        local filter = Tree:filter(picker.opts)

        Tree:walk(root, function(node)
          if node ~= root and not filter(node) then
            return false
          end

          if node.dir then
            node.open = true
            if not node.expanded then
              Tree:expand(node)
            end
          end
        end, { all = true })

        Actions.update(picker, { refresh = true, target = item.file })
      end

      explorer.win.list.keys["zr"] = { "explorer_expand_subtree", desc = "Expand Directory" }
      explorer.win.list.keys["zR"] = { "explorer_expand_all", desc = "Expand All" }
    end,
  },
}
