-- Fuzzy search: fzf + custom buffer function
return {
  {
    "junegunn/fzf",
    lazy = false,
    build = ":call fzf#install()",
  },

  {
    "junegunn/fzf.vim",
    lazy = false,
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.cmd([[
        function! s:buffers_delete(lines)
          normal! m'
          if len(a:lines) < 2
            return
          endif
          let action = a:lines[1]
          let buf=split(a:lines[2])[0]
          let bufname=split(buf, ':')[0]
          if action ==? ''
            execute 'buffer '.bufname
          endif
          if action ==? 'ctrl-x'
            execute 'bdelete '.bufname
          endif
          return
        endfunction

        function! s:myfzfbuffers(query, fullscreen)
          let spec = { 'sink*': { lines -> s:buffers_delete(lines) },
                      \ 'options': [
                      \   '--print-query',
                      \   '--prompt', 'Buffer> '
                      \ ],
                      \ 'placeholder': '{1}'
                      \ }
          call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
        endfunction

        command! -bar -bang -nargs=? -complete=dir MyFzfBuffers call s:myfzfbuffers(<q-args>, <bang>0)
      ]])
    end,
  },
}
