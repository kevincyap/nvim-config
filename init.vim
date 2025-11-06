" We start by installing Vim plugin manager to manage plugins.
" A Lot of customizations doen here.

let s:using_snippets = 1
let g:OmniSharp_want_snippet=1
let g:OmniSharp_server_use_net6 = 1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'prettier/vim-prettier', { 'do': 'npm install' , 'branch' : 'release/1.x' }
Plug 'dense-analysis/ale'
"Fuzzy Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'github/copilot.vim'

Plug 'folke/tokyonight.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'folke/neodev.nvim'

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

if s:using_snippets
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
endif

call plug#end()

" The following commands are contextual, based on the cursor position.
" autocmd FileType cs nnoremap <buffer>
" autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
let g:vimspector_enable_mappings = 'HUMAN'
let g:airline_powerline_fonts=1
let g:tmuxline_powerline_separators = 0
" set background=dark
"colorscheme Monokai
colorscheme minimalist
let g:airline_theme='minimalist'

set encoding=utf-8
scriptencoding utf-8
let g:airline#extensions#tmuxline#enabled = 0

" How tab behaves while picking auto complete.
let g:SuperTabMappingForward = '<S-Tab>'
let g:SuperTabMappingBackward = '<Tab>'

set clipboard+=unnamedplus
" Move Swap Directory to something temporary.
set directory^=$HOME/tempswap//

" This directory should exist.
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:50%'

" vim wiki settings.
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" ctrl+p when you move to a file this highlights it.

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Read gitignore and dont show relevant files in ctrlp.
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:prettier#config#parser = 'babylon'
" hi Normal ctermbg=none
"
" For Coc Action Menu to work.
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

let g:ale_linters_ignore = {
      \   'typescript': ['tslint'],
      \}

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
  \ 'border': 'rounded'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0],
  \ 'border': [1],
  \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
  \ 'borderhighlight': ['ModeMsg']
  \}
endif

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

:hi Comment guifg=#ACACAC

:source ~/AppData/Local/nvim/mappings.vim
:source ~/AppData/Local/nvim/options.vim
:luafile ~/AppData/Local/nvim/luastuff.lua
