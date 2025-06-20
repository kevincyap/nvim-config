
vim.opt.termguicolors = true
local inactive_bg = "#303030"
local inactive_fg = "#e0e0e0"
local visible_bg = "#e0e0e0"
local visible_fg = "#404040"
local selected_bg = "#f3f3f3"
local selected_fg = "#000000"
local background  = "#000000"
local inactive_set = { fg = inactive_fg, bg = inactive_bg, }
local visible_set = { fg = visible_fg, bg = visible_bg, }
local active_set = { fg = selected_fg, bg = selected_bg, }
require("bufferline").setup{options = {
            themeable = true,
            filename = "%:p",
            show_buffer_close_icons = false,
            show_tab_indicators = false,
        },
        highlights = {
                background = inactive_set,
                buffer_visible = visible_set,
                buffer_selected = active_set,

                indicator_selected = active_set,
                indicator_visible = visible_set,

                modified = { fg = '#ff0000', bg = inactive_bg, },
                modified_visible = { fg = '#ff0000', bg = visible_bg, },
                modified_selected = { fg = '#ff0000', bg = selected_bg, },

                fill = { bg = background, }
        }}

local toggleTerm = require("toggleterm")
toggleTerm.setup{
    size = 40,
    direction = 'float',
}
toggleTerm.exec('"C:\\Program Files\\Microsoft Visual Studio\\2022\\Enterprise\\Common7\\Tools\\VsDevCmd.bat"', 2, 40, "","float", "vs",false, false)
toggleTerm.exec('cls', 2, 40, "","float", "vs",false, false)
toggleTerm.exec('powershell', 1, 40, "","float", "main",false, false)
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<F4>", "<C-/><C-n><cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<F1>", ":1ToggleTerm size=40 direction=float name=main<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<F1>", "<C-\\><C-n>:1ToggleTerm size=40 direction=float name=main<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F3>", ":2ToggleTerm size=40 direction=float name=vs<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<F3>", "<C-\\><C-n>:2ToggleTerm size=40 direction=float name=vs<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F5>", ":DiffviewOpen<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-F5>", ":DiffviewClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-F5>", ":DiffviewToggleFiles<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",/", ":set wrap!<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<CA-q>", "<C-\\><C-n><C-W>q", {noremap = true, silent = true})
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
local function get_folders(paths)
    local folders = {}
    for _, path in ipairs(paths) do
        local dirs = vim.fn.glob(path.."\\*", 1, 1)
        for _, dir in ipairs(dirs) do
            if vim.fn.isdirectory(dir) == 1 then
                if string.match(dir, ".*\\.git") then
                    table.insert(folders, dir)
                    goto continue
                end

                table.insert(folders, dir)
            end
            ::continue::
        end
    end
    return folders
end

local OProjCallback = function(args)
    local dir = args.fargs[1] or "Q:\\repos"
    toggleTerm.exec('cd '..dir, 2, 40, "","float", "vs",false, false)
    toggleTerm.exec('cls', 2, 40, "","float", "vs",false, false)

    toggleTerm.exec('cd '..dir, 1, 40, "","float", "main",false, false)
    toggleTerm.exec('cls', 1, 40, "","float", "main",false, false)

    vim.cmd("cd "..dir)
end
local OProjComplete = function(ArgLead, CmdLine, CursorPos)
    local dirs = get_folders({"Q:\\repos", "C:\\repos"})
    local matchingDirs = {}
    for _, dir in ipairs(dirs) do
        if string.find(string.lower(dir), string.lower(ArgLead)) then
            table.insert(matchingDirs, dir)
        end
    end
    return matchingDirs
end
vim.api.nvim_create_user_command("O", OProjCallback, {
    nargs = 1,
    complete = OProjComplete,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
