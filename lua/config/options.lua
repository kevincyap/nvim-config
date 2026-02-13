-- Options (from options.vim + init.vim)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.scrolloff = 10
vim.opt.encoding = "utf-8"
vim.opt.clipboard:append("unnamedplus")
vim.opt.directory:prepend(vim.fn.expand("$HOME") .. "/tempswap//")
vim.opt.compatible = false
vim.opt.termguicolors = true

-- Grep program
if vim.fn.executable("ag") == 1 then
  vim.opt.grepprg = "ag --nogroup --nocolor"
end

-- Syntax and filetype
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

-- Global variables
vim.g.OmniSharp_want_snippet = 1
vim.g.OmniSharp_server_use_net6 = 1
vim.g.airline_powerline_fonts = 1
vim.g.tmuxline_powerline_separators = 0
vim.g.airline_theme = "minimalist"
vim.g["airline#extensions#tmuxline#enabled"] = 0

vim.g.nerdtree_sync_cursorline = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeWinSize = 45

vim.g.copilot_no_tab_map = true

vim.g.OmniSharp_selector_findusages = "fzf"
vim.g.fzf_preview_window = "right:50%"

vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

vim.g["prettier#config#parser"] = "babylon"

vim.g.ale_linters_ignore = { typescript = { "tslint" } }
vim.g.ale_linters = { cs = { "OmniSharp" } }

vim.g.OmniSharp_popup_position = "peek"
vim.g.OmniSharp_popup_options = {
  winhl = "Normal:Normal,FloatBorder:ModeMsg",
  border = "rounded",
}

vim.g.SuperTabMappingForward = "<S-Tab>"
vim.g.SuperTabMappingBackward = "<Tab>"

vim.g.UltiSnipsListSnippets = "<c-s>"
vim.g.UltiSnipsExpandTrigger = "<tab>"
