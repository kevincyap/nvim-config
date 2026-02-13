-- Autocommands (from mappings.vim + luastuff.lua)

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Filetype-specific goto definition and OmniSharp mappings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "gd",     ":OmniSharpGotoDefinition<CR>",     opts)
    vim.keymap.set("n", ",fu",    ":OmniSharpFindUsages<CR>",         opts)
    vim.keymap.set("n", ",fi",    ":OmniSharpFindImplementations<CR>", opts)
    vim.keymap.set("n", ",<Space>", ":OmniSharpGetCodeActions<CR>",    opts)
    vim.keymap.set("n", ",fm",    ":OmniSharpFindMembers<CR>",        opts)
    vim.keymap.set("n", ",sh",    ":OmniSharpSignatureHelp<CR>",      opts)
    vim.keymap.set("n", ",sd",    ":OmniSharpDocumentation<CR>",      opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "html" },
  callback = function()
    vim.keymap.set("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>", { buffer = true, silent = true })
  end,
})

-- :O command - switch project directory (also changes toggleterm dirs)
local function get_folders(paths)
  local folders = {}
  for _, path in ipairs(paths) do
    local dirs = vim.fn.glob(path .. "\\*", 1, 1)
    for _, dir in ipairs(dirs) do
      if vim.fn.isdirectory(dir) == 1 then
        table.insert(folders, dir)
      end
    end
  end
  return folders
end

vim.api.nvim_create_user_command("O", function(args)
  local dir = args.fargs[1] or "Q:\\repos"
  local toggleTerm = require("toggleterm")
  toggleTerm.exec("cd " .. dir, 2, 40, "", "float", "vs", false, false)
  toggleTerm.exec("cls", 2, 40, "", "float", "vs", false, false)
  toggleTerm.exec("cd " .. dir, 1, 40, "", "float", "main", false, false)
  toggleTerm.exec("cls", 1, 40, "", "float", "main", false, false)
  vim.cmd("cd " .. dir)
end, {
  nargs = 1,
  complete = function(ArgLead)
    local dirs = get_folders({ "Q:\\repos" })
    local matching = {}
    for _, dir in ipairs(dirs) do
      if string.find(string.lower(dir), string.lower(ArgLead)) then
        table.insert(matching, dir)
      end
    end
    return matching
  end,
})
