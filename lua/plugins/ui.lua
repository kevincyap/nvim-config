-- UI plugins: colorschemes, airline, devicons, bufferline
return {
  { "flazz/vim-colorschemes", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },

  {
    "vim-airline/vim-airline",
    lazy = false,
    dependencies = { "vim-airline/vim-airline-themes" },
  },

  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "ryanoasis/vim-devicons", lazy = false },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local inactive_bg = "#303030"
      local inactive_fg = "#e0e0e0"
      local visible_bg = "#e0e0e0"
      local visible_fg = "#404040"
      local selected_bg = "#f3f3f3"
      local selected_fg = "#000000"
      local background = "#000000"
      local inactive_set = { fg = inactive_fg, bg = inactive_bg }
      local visible_set = { fg = visible_fg, bg = visible_bg }
      local active_set = { fg = selected_fg, bg = selected_bg }

      require("bufferline").setup({
        options = {
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

          modified = { fg = "#ff0000", bg = inactive_bg },
          modified_visible = { fg = "#ff0000", bg = visible_bg },
          modified_selected = { fg = "#ff0000", bg = selected_bg },

          fill = { bg = background },
        },
      })
    end,
  },
}
