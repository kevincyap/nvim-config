-- Terminal: toggleterm, lazygit, deferred VsDevCmd
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      local toggleTerm = require("toggleterm")
      toggleTerm.setup({
        size = 40,
        direction = "float",
      })

      -- Deferred VsDevCmd startup
      vim.defer_fn(function()
        toggleTerm.exec(
          '"C:\\Program Files\\Microsoft Visual Studio\\2022\\Enterprise\\Common7\\Tools\\VsDevCmd.bat"',
          2, 40, "", "float", "vs", false, false
        )
        toggleTerm.exec("cls", 2, 40, "", "float", "vs", false, false)
        toggleTerm.exec("powershell", 1, 40, "", "float", "main", false, false)
      end, 0)

      -- Lazygit terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      -- Terminal keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<F4>", "<cmd>lua _lazygit_toggle()<CR>", opts)
      map("t", "<F4>", "<C-/><C-n><cmd>lua _lazygit_toggle()<CR>", opts)

      map("n", "<F1>", ":1ToggleTerm size=40 direction=float name=main<CR>", opts)
      map("t", "<F1>", "<C-\\><C-n>:1ToggleTerm size=40 direction=float name=main<CR>", opts)

      map("n", "<F3>", ":2ToggleTerm size=40 direction=float name=vs<CR>", opts)
      map("t", "<F3>", "<C-\\><C-n>:2ToggleTerm size=40 direction=float name=vs<CR>", opts)
    end,
  },
}
