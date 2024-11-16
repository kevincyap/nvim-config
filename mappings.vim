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

nnoremap ,sv :source ~/AppData/Local/nvim/init.vim<CR>
nnoremap ,esv :edit ~/AppData/Local/nvim/init.vim<CR>

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

":map <C-n> :NERDTreeToggle<CR>
map <C-p> :GFiles<CR>
map <C-f> :Files<CR>
map <C-b> :Buffers<CR>
nmap <silent> <C-n> :call NERDTreeFindCurr()<CR>
autocmd 

"collapse json files by themselves.
"map <C-j> :set filetype=json \| :syntax on \| :set foldmethod=syntax
"zo for open
"zc for close

" Auto indent your file.
map <F7> gg=G<C-o><C-o>
" Navigate Tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

map <A-l> zL
map <A-h> zH
nnoremap <A-{> :lprevious<cr>
nnoremap <A-}> :lnext<cr>

" Supprot for different goto definitions for different file types.
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> ,fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> ,fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap ,<Space> :OmniSharpGetCodeActions<CR>

autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

tnoremap <C-q> <C-\><C-n>
tnoremap <CM-q> <C-\><C-n><C-w>q
"tmap <CM-q> <C-\><C-n><C-q>
"noremap ,vsterm :terminal cmd.exe /k "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\VsDevCmd.bat" -startdir=none -arch=x64 -host_arch=x64
nnoremap <F1> (:1ToggleTerm size=40 direction=float name=main)<CR>
tnoremap <F1> <C-\><C-n>(:1ToggleTerm size=40 direction=float name=main)<CR>
nnoremap <F3> (:2ToggleTerm size=40 direction=float name=vs)<CR>
tnoremap <F3> <C-\><C-n>(:2ToggleTerm size=40 direction=float name=vs)<CR>
nnoremap <F5> :DiffviewOpen<CR>
nnoremap <C-F5> :DiffviewClose<CR>
command! -count=2 TermVS  lua require'toggleterm'.exec("cmd.exe /k \"C:\\Program Files\\Microsoft Visual Studio\\2022\\Enterprise\\Common7\\Tools\\VsDevCmd.bat\" -startdir=none -arch=x64 -host_arch=x64", <count>,40, "", "float", "vs", false,false)
nnoremap ,/ :set wrap!<CR>

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

