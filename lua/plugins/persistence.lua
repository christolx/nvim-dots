return {
  {
    "folke/persistence.nvim",
    lazy = false,
    opts = {
      need = 0,
    },
    config = function(_, opts)
      local persistence = require("persistence")
      persistence.setup(opts)

      if vim.fn.argc() > 0 then
        persistence.stop()
        return
      end

      local startup_session = persistence.current()

      persistence.save = function()
        vim.cmd("mks! " .. vim.fn.fnameescape(startup_session))
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistenceSavePre",
        callback = function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            vim.api.nvim_win_call(win, function()
              vim.cmd("argglobal")
              vim.cmd("silent! %argdelete")
            end)
          end
        end,
      })

      vim.schedule(function()
        persistence.load()
      end)
    end,
  },
}
