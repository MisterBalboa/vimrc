set directory=~/vim_tmp//

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

syntax on
set ruler
set numberwidth=1


" set statusline+=%#LineNr#
set statusline+=\ %f
set grepprg=grep\ --color=always\ -n\ $*\ /dev/null

inoremap jk <Esc>

let mapleader = "-"

nnoremap <leader>vv :vsplit $MYVIMRC<cr>
inoremap <c-c> <nop>
nnoremap run :!python3 %
nnoremap <leader>gg :grep! -R --exclude-dir node_modules -e<Space>


" Change between splits in normal mode 
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l

nnoremap <leader>cmd :wa \| !clear &&<Space>

" Run Tests
nnoremap <leader>tt :wa \| !clear && npm run test<Enter>
nnoremap <leader>pytt :wa \| !clear && python3 -m unittest %<Enter>
nnoremap <leader>json :vsp package.json<Enter>

nnoremap <leader>e :Rex<Enter>

" Fzf utility
set rtp+=/usr/local/opt/fzf

" Vim Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'

call plug#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>gf :GFiles<Enter>
nnoremap <leader>gfs :GFiles?<Enter>
nnoremap <leader>gfc :Commit<Enter>
nnoremap <leader>ff :FZF<Enter>
nnoremap <leader>ffv :vsp \| FZF<Enter>
nnoremap <leader>ffh :sp \| FZF<Enter>
nnoremap <leader>blame :!clear && grc git blame %<Enter>
nnoremap <leader>hl :set invhlsearch<Enter>
nnoremap <leader>nn :set invnumber<Enter>
nnoremap <leader>ii :wa \| !clear && npm install<Space>
nnoremap <leader>is :wa \| !clear && npm install --save-dev<Space>
nnoremap <leader>comp :w \| !clear && gcc % -o bin/%.o && ./bin/%.o<Space>
nnoremap / /\v

" Search visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:multi_cursor_quit_key            = '<Esc>'

set backspace=indent,eol,start

vnoremap <leader>cc "*y
nnoremap <C-s> :%s/:put +

nnoremap <leader>gcc :wa \| !clear && gcc -o binary %

function Blame(...)
  let l:start = get(a:, 1, 0)
  let l:end = get(a:, 2, 0)

  if l:start && l:end
    let l:sedcommand = 'sed -n "'.l:start.', '.l:end.' p"'
    execute 'wa | !clear && git blame % | '. l:sedcommand.
      \ ' | grcat ~/.grc/conf.git'
  else
    let l:selection_start = getpos("'<")[1]
    let l:selection_end = getpos("'>")[1]
 
    let l:sedcommand = 'sed -n "'.l:selection_start.', '.l:selection_end.' p"'
    execute 'wa | !clear && git blame % | '. l:sedcommand.
      \ ' | grcat ~/.grc/conf.git'
  endif
endfunction"

" When you click tab it will move nspaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Treat tabs as spaces
set expandtab
set laststatus=2
set statusline=

au BufNewFile,BufRead *.ejs set filetype=html

