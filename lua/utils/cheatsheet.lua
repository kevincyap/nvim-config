local lines = {
  "══════════════════════════════════════════════════════",
  "                    KEYBIND CHEATSHEET                ",
  "══════════════════════════════════════════════════════",
  "",
  "─── FILE EXPLORER ───────────────────────────────────",
  "  Ctrl-n          NERDTree (toggle / find current)",
  "",
  "─── FUZZY SEARCH (FZF) ──────────────────────────────",
  "  Ctrl-p          Git files",
  "  Ctrl-f          All files",
  "  Ctrl-b          Buffers (Ctrl-x to delete)",
  "  Ctrl-l          Buffer lines",
  "  Ctrl-Alt-f      Ripgrep (RG)",
  "  Ctrl-Alt-A      Ag search",
  "",
  "─── TERMINALS ──────────────────────────────────────",
  "  F1              Toggle main terminal (powershell)",
  "  F3              Toggle VS Dev terminal",
  "  F4              Toggle lazygit",
  "  Ctrl-q          Exit terminal mode",
  "  Ctrl-Alt-q      Close terminal window",
  "",
  "─── BUFFERS / TABS ─────────────────────────────────",
  "  Ctrl-Alt-q      Previous buffer",
  "  Ctrl-Alt-w      Next buffer",
  "  Ctrl-F10        Delete buffer",
  "  Ctrl-t + arrow  Tab navigation",
  "",
  "─── NAVIGATION / EDITING ───────────────────────────",
  "  K               Show documentation (CoC/help)",
  "  Alt-d           Delete line (no yank)",
  "  Ctrl-u          Half-page up (centered)",
  "  Ctrl-Alt-u      Half-page down (centered)",
  "  Alt-l / Alt-h   Horizontal scroll",
  "  Alt-{ / Alt-}   Location list prev/next",
  "  Ctrl-Alt-{ / }  Block navigation [{ / ]}",
  "  F7              Auto-indent entire file",
  "  Ctrl-BS         Delete word (insert mode)",
  "",
  "─── DIFFVIEW ──────────────────────────────────────",
  "  F5              DiffviewOpen",
  "  Ctrl-F5         DiffviewClose",
  "  Alt-F5          DiffviewToggleFiles",
  "",
  "─── LSP / COC ─────────────────────────────────────",
  "  \\a              Code actions (normal/visual)",
  "  gd              Go to definition (filetype-aware)",
  "  Ctrl-J          Accept Copilot suggestion",
  "",
  "─── C# (*.cs files) ───────────────────────────────",
  "  gd              OmniSharp go to definition",
  "  ,fu             Find usages",
  "  ,fi             Find implementations",
  "  ,<Space>        Code actions",
  "  ,fm             Find members",
  "  ,sh             Signature help",
  "  ,sd             Documentation",
  "",
  "─── TOGGLE / DISPLAY ──────────────────────────────",
  "  ,/              Toggle word wrap",
  "  Ctrl-L Ctrl-L   Disable relative numbers",
  "  Ctrl-R Ctrl-L   Enable relative numbers",
  "",
  "─── CONFIG ────────────────────────────────────────",
  "  ,sv             Source init.lua",
  "  ,nvim           cd to nvim config dir",
  "",
  "─── PROJECT SHORTCUTS ─────────────────────────────",
  "  ,dbj            cd to DBJobPackage",
  "  ,gridmgr        cd to GridMgr",
  "  ,active         cd to ActiveActive",
  "  :O <dir>        Switch project (+ terminals)",
  "",
  "─── MISC ──────────────────────────────────────────",
  "  F14             Insert Debugger.Launch() (insert)",
  "  F15             Insert new GUID (insert)",
  "",
  "══════════════════════════════════════════════════════",
  "  :Cheatsheet to show this      q / Esc to close    ",
  "══════════════════════════════════════════════════════",
}

local function open()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  local width = 56
  local height = #lines
  local ui = vim.api.nvim_list_uis()[1]
  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Cheatsheet ",
    title_pos = "center",
  })

  -- Close with q or Esc
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end

vim.api.nvim_create_user_command("Cheatsheet", open, {})

return { open = open }
