" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <C-L><C-L> :set norelativenumber<CR>
map  <C-R><C-L> :set relativenumber<CR>

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

nnoremap ,sv :source ~/AppData/Local/nvim/init.vim
nnoremap ,esv :edit ~/AppData/Local/nvim/init.vim

:map <C-n> :NERDTreeToggle<CR>
:map <C-p> :GFiles<CR>
:map <C-f> :Files<CR>

"collapse json files by themselves.
:map <C-j> :set filetype=json \| :syntax on \| :set foldmethod=syntax
"zo for open
"zc for close

" Auto indent your file.
map <F7> gg=G<C-o><C-o>
" Navigate Tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>