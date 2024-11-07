lua << EOF
local actions = require ("telescope.actions")

require('telescope').setup{
    defaults = {
        scroll_strategy = "limit";
        file_ignore_patterns = { ".git/[^h]",".git", ".build", ".vs" };
    },
    pickers = {
        find_files = {
              hidden = true;
        }               
    }
}
EOF
