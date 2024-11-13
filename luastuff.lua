
require("toggleterm").setup{
    size = 40, 
    direction = 'float',
}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

