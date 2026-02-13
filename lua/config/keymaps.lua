-- Keymaps (from mappings.vim + luastuff.lua)

local map = vim.keymap.set

-- Disable q: (command-line window)
map("n", "q:", "<Nop>")

-- Relative number toggles
map("n", "<C-L><C-L>", ":set norelativenumber<CR>")
map("",  "<C-R><C-L>", ":set relativenumber<CR>")

-- Source config / navigate to nvim dir
map("n", ",sv", ":source ~/AppData/Local/nvim/init.lua<CR>")
map("n", ",nvim", ":cd ~/AppData/Local/nvim/<CR>")

-- Project shortcuts
map("n", ",dbj",     ":cd C:/repos/DBJobPackage<CR>")
map("n", ",gridmgr", ":cd Q:\\src\\GridMgr<CR>")
map("n", ",active",  ":cd Q:\\src\\ActiveActive<CR>")

-- NERDTree (uses VimScript function defined in editor.lua)
map("n", "<C-n>", ":call NERDTreeFindCurr()<CR>", { silent = true })

-- FZF
map("", "<C-p>", ":GFiles<CR>")
map("", "<C-f>", ":Files<CR>")
map("", "<CA-f>", ":RG<CR>")
map("", "<C-b>", ":MyFzfBuffers<CR>")
map("", "<C-l>", ":BLines<CR>")
map("", "<CA-A>", ":Ag<CR>")

-- Auto indent
map("", "<F7>", "gg=G<C-o><C-o>")

-- Tab navigation
map("", "<C-t><up>",    ":tabr<cr>")
map("", "<C-t><down>",  ":tabl<cr>")
map("", "<C-t><left>",  ":tabp<cr>")
map("", "<C-t><right>", ":tabn<cr>")

-- Delete line without yanking
map("n", "<A-d>", '"_dd')

-- Scrolling
map("n", "<CA-u>", "<C-d>zz")
map("n", "<C-u>",  "<C-u>zz")

-- Horizontal scroll
map("", "<A-l>", "zL")
map("", "<A-h>", "zH")

-- Debug launch shortcut
map("i", "<F14>", "System.Diagnostics.Debugger.Launch();")

-- Location list navigation
map("n", "<A-{>", ":lprevious<cr>")
map("n", "<A-}>", ":lnext<cr>")

-- Block navigation
map("n", "<CA-{>", "[{")
map("n", "<CA-}>", "]}")

-- Ctrl-backspace in insert mode
map("i", "<C-BS>", "<C-W>")

-- Buffer navigation
map("n", "<CA-q>", ":bp<CR>")
map("n", "<CA-w>", ":bn<CR>")
map("",  "<C-F10>", ":bd<CR>")

-- Wrap toggle
map("n", ",/", ":set wrap!<CR>", { noremap = true, silent = true })

-- K for documentation (CoC)
vim.cmd([[
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
]])

-- CoC action mappings
vim.cmd([[
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
]])

-- Diffview
map("n", "<F5>",    ":DiffviewOpen<CR>",         { noremap = true, silent = true })
map("n", "<C-F5>",  ":DiffviewClose<CR>",        { noremap = true, silent = true })
map("n", "<A-F5>",  ":DiffviewToggleFiles<CR>",  { noremap = true, silent = true })

-- Terminal mode mappings
map("t", "<C-q>",   "<C-\\><C-n>",         { noremap = true, silent = true })
map("t", "<CA-q>",  "<C-\\><C-n><C-W>q",   { noremap = true, silent = true })

-- Copilot accept
map("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- GUID insertion
map("i", "<F15>", function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local guid = require("utils.helpers").generateGUID()
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { guid })
end, { noremap = true, silent = true })
