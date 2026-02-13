-- Neovim config entry point
require("config.options")
require("config.lazy")

-- Colorscheme (must load after lazy.nvim installs plugins)
vim.cmd("colorscheme minimalist")
vim.cmd("hi Comment guifg=#ACACAC")

require("config.keymaps")
require("config.autocmds")
require("utils.cheatsheet")
