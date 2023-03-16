
" echom '(>ˆ.ˆ<)' 

call plug#begin(has( 'nvim' ) ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'	
" Plug 'SirVer/ultisnips' 
" Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" coc plguin
let g:coc_global_extensions = [
            \ 'coc-ultisnips',
            \ 'coc-json',
            \ 'coc-java',
            \ 'coc-yaml',
            \ 'coc-highlight',
            \ 'coc-eslint',
            \ 'coc-git',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ ]

" Map Ctrl + Space để show list functions/biến autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" Tự động import file của biến/function khi chọn và nhấn Tab
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
" Go to definition ở tab mới
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"show document
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

"highlight word
autocmd CursorHold * silent call CocActionAsync('highlight')



command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#autoformat = 1



" Map phím tắt Ctrl + P
nnoremap <silent> <C-S-p> :Files<CR>

" Tìm file trong project, nhưng bỏ mấy thư mục như node_modules ra, để tìm nhẹ hơn.
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

syntax on
colorscheme embark
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
let g:embark_terminal_italics = 1


" let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = 'ln'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.dirty='⚡'
" let g:airline_symbols.colnr='col'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#hunks#coc_git = 1
let g:airline_theme = 'embark'


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Hiện file ẩn
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Mở cùng NERDTree cho tab mới, mặc định là mỗi tab sẽ mở 1 cái mới
autocmd BufWinEnter * silent NERDTreeMirror

" Tự đóng NERDTree khi đóng tab, mặc định giữ lại NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) | q | endif

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Map phím "\f" để tìm nội dung, tương tự như "Ctrl + Shift + F" trên VSCode nhé
nnoremap <silent> <Leader>f :Rg<CR>


" Tìm file đang mở trong thư mục bên NERDTree (mặc định không sync với nhau)
map <leader>r :NERDTreeFind<cr>


" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



"++++++++++++++++++ my config ++++++++++++++++++ 
"==== my set lists =====
set number
set textwidth=80
set relativenumber
set numberwidth=5
set softtabstop=4
set nowrap
set shiftround
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set termguicolors


"==== leader key ====
let mapleader="-"


"==== my mapping ====
" - : move line down
nnoremap - ddpk
" _ : move line up
nnoremap _ ddkPj
" <c-u> : uppercase current word
inoremap <c-u> <esc>viwUA
" inoremap <leader>u <esc>viwUA
nnoremap <c-u> viwUe
" nnoremap <leader>u viwUe
" quick open .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" quick source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" add " and ' surround word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>lv`>l
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>lv`>l
" move to begin line with H
nnoremap H 0
" move to end line with L
nnoremap L g_
" exit insert mode
inoremap jk <esc>
vnoremap jk <esc>
" disable esc key
inoremap <esc> <c-o>:echo "No esc please!!" <cr>
vnoremap <esc> <c-o>:echo "No esc please!!" <cr>
" disable arrows key
nnoremap <left> :echo "No left for you!"<cr>
vnoremap <left> :<c-u>echo "No left for you!"<cr>
inoremap <left> <c-o>:echo "No left for you!"<cr>
nnoremap <right> :echo "No right for you!"<cr>
vnoremap <right> :<c-u>echo "No right for you!"<cr>
inoremap <right> <c-o>:echo "No right for you!"<cr>
nnoremap <up> :echo "No up for you!"<cr>
vnoremap <up> :<c-u>echo "No up for you!"<cr>
inoremap <up> <c-o>:echo "No up for you!"<cr>
nnoremap <down> :echo "No down for you!"<cr>
vnoremap <down> :<c-u>echo "No down for you!"<cr>
inoremap <down> <c-o>:echo "No down for you!"<cr>
" easy align 
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)
" next pre tab
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

"==== abbreviation ====
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@ ntqhuy2k2@gmail.com
iabbrev ccopy Copyright 2013 Nguyen Huy, all rights reserved.

"==== autocommand ====
autocmd BufNewFile * :write
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd BufNewFile,BufRead *.html setlocal nowrap

"==== operator pendding mode ====
onoremap p i(
onoremap F :<c-u>normal! 0f(hviw<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap in{ :<c-u>normal! f{vi}<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{va}<cr>
onoremap al{ :<c-u>normal! F}va{<cr>
