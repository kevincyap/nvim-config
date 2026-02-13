-- Editor plugins: NERDTree, auto-pairs, MatchTagAlways
return {
  {
    "preservim/nerdtree",
    lazy = false,
    config = function()
      vim.cmd([[
        function! NERDTreeFindCurr()
          if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
            exe ":NERDTreeClose"
          else
            if (expand("%") == "")
              exe ":NERDTree"
            else
              exe ":NERDTreeFind"
            endif
          endif
        endfunction
      ]])
    end,
  },

  { "jiangmiao/auto-pairs", lazy = false },
  { "valloric/MatchTagAlways", lazy = false },
}
