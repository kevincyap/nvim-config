" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <C-L><C-L> :set norelativenumber<CR>
map  <C-R><C-L> :set relativenumber<CR>

nnoremap ,sv :source ~/AppData/Local/nvim/init.vim<CR>
nnoremap ,nvim :cd ~/AppData/Local/nvim/<CR>

nnoremap ,dbj :cd C:/repos/DBJobPackage<CR>
nnoremap ,gridmgr :cd Q:\src\GridMgr<CR>
nnoremap ,active :cd Q:\src\ActiveActive<CR>
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
    " let spec = { 'source': s:buffers_list(),
    "             \ 'sink*': { lines -> s:buffers_delete(lines) },
    "             \ 'options': [
    "             \   '--print-query',
    "             \   '--header', close_buffer_header,
    "             \   '--prompt', 'Buffer> '
    "             \ ]}
    " call fzf#run(fzf#wrap('buffers', fzf#vim#with_preview(spec), a:fullscreen))
    let spec = { 'sink*': { lines -> s:buffers_delete(lines) },
                \ 'options': [
                \   '--print-query',
                \   '--prompt', 'Buffer> '
                \ ],
                \ 'placeholder': '{1}'
                \ }
    call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

let g:UltiSnipsListSnippets="<c-s>"
let g:UltiSnipsExpandTrigger="<tab>"

command! -bar -bang -nargs=? -complete=dir MyFzfBuffers call s:myfzfbuffers(<q-args>, <bang>0)
":map <C-n> :NERDTreeToggle<CR>
map <C-p> :GFiles<CR>
map <C-f> :Files<CR>
map <CA-f> :RG<CR>
map <C-b> :MyFzfBuffers<CR>
map <C-l> :BLines<CR>
map <CA-A> :Ag<CR>
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
nmap <A-d> "_dd
nmap <CA-u> <C-d>zz
nmap <C-u> <C-u>zz

map <A-l> zL
map <A-h> zH
inoremap <F14> System.Diagnostics.Debugger.Launch();
nnoremap <A-{> :lprevious<cr>
nnoremap <A-}> :lnext<cr>
nnoremap <CA-{> [{
nnoremap <CA-}> ]}
imap <C-BS> <C-W>

" Supprot for different goto definitions for different file types.
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap ,fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap ,fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap ,<Space> :OmniSharpGetCodeActions<CR>
autocmd FileType cs nnoremap ,fm :OmniSharpFindMembers<CR>
autocmd FileType cs nnoremap ,sh :OmniSharpSignatureHelp<CR>
autocmd FileType cs nnoremap ,sd :OmniSharpDocumentation<CR>

autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

"tmap <CM-q> <C-\><C-n><C-q>
"noremap ,vsterm :terminal cmd.exe /k "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\VsDevCmd.bat" -startdir=none -arch=x64 -host_arch=x64
"
nnoremap <CA-q> :bp<CR>
nnoremap <CA-w> :bn<CR>
map <C-F10> :bd<CR>
