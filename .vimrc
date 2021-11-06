" CALL .vimrc.plug
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif




" ECHO 


" SET
set number 
set numberwidth=5
set relativenumber

set textwidth=80 
set nowrap
set linebreak


set matchtime=5 
set showmatch
set cursorline 


set nocompatible
set modelines=0

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 14

set nohlsearch
set nocursorcolumn
set nocursorline

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" AUTOCMD
autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"

autocmd FileType java let maplocalleader="-"

" FILETYPE
filetype plugin indent on
filetype off
syntax on

" LET 
let mapleader="\\"



" PLUGIN: AIR LINE 
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline_theme='onedark' 
let g:onedark_terminal_italics=1
if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif

" +===+===+===+THEME+===+===+===
colorscheme onedark 
 
set guifont=Console:h11
set guicursor=n-v-c:block,o:hor50,i-ci:hor15,r-cr:hor30,sm:block

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=light         
set background=dark
let g:one_allow_italics = 1  
let g:airline_theme='one'
colorscheme one



" +===+===+===+THEME+===+===+===





" PLUGIN: FZF
let g:fzf_preview_window='right:50%'
let g:fzf_layout={ 'window':{ 'width':0.9, 'height':0.6  }  }

" PLUGIN: auto-save
let g:auto_save=1
let g:auto_save_in_insert_mode=0








" =========================NERDTREE=========================
" PLUGIN: NERDTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" change icon
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▽'
" show hiddent file
let NERDTreeShowHidden=1


" PLUGIN: nerdtree-commenter for NERDTREE
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>
" https://github.com/preservim/nerdcommenter


" PLUGIN: nerdtree-syntax-highlight for NERDTREE
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" custom color
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'css', 'html', 'md', 'java', 'py', 'json'] " enabled extensions with default colors
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico'] " enabled exact matches with default colors


" PLUGIN: startify for NERDTREE
let g:startify_custom_header = [
\ '  __     ___             _____ _____ ',
\ '  \ \   / (_)_ __ ___   |___  |___ / ',
\ '   \ \ / /| | ''_ ` _ \     / /  |_ \ ',
\ '    \ V / | | | | | | |   / /_ ___) |',
\ '     \_/  |_|_| |_| |_|  /_/(_)____/ ',
\ '',
\ '',
\ ]

let g:startify_custom_header = [
\ '      ___           ___                       ___           ___           ___                       ___           ___      ',
\ '     /__/\         /__/\          ___        /__/\         /  /\         /__/\          ___        /  /\         /__/\     ',
\ '     \  \:\        \  \:\        /__/|       \  \:\       /  /:/_        \  \:\        /__/|      /  /:/_        \  \:\    ',
\ '      \__\:\        \  \:\      |  |:|        \  \:\     /  /:/ /\        \  \:\      |  |:|     /  /:/ /\        \  \:\   ',
\ '  ___ /  /::\   ___  \  \:\     |  |:|    _____\__\:\   /  /:/_/::\   ___  \  \:\     |  |:|    /  /:/ /:/_   _____\__\:\  ',
\ ' /__/\  /:/\:\ /__/\  \__\:\  __|__|:|   /__/::::::::\ /__/:/__\/\:\ /__/\  \__\:\  __|__|:|   /__/:/ /:/ /\ /__/::::::::\ ',
\ ' \  \:\/:/__\/ \  \:\ /  /:/ /__/::::\   \  \:\~~\~~\/ \  \:\ /~~/:/ \  \:\ /  /:/ /__/::::\   \  \:\/:/ /:/ \  \:\~~\~~\/ ',
\ '  \  \::/       \  \:\  /:/     ~\~~\:\   \  \:\  ~~~   \  \:\  /:/   \  \:\  /:/     ~\~~\:\   \  \::/ /:/   \  \:\  ~~~  ',
\ '   \  \:\        \  \:\/:/        \  \:\   \  \:\        \  \:\/:/     \  \:\/:/        \  \:\   \  \:\/:/     \  \:\      ',
\ '    \  \:\        \  \::/          \__\/    \  \:\        \  \::/       \  \::/          \__\/    \  \::/       \  \:\     ',
\ '     \__\/         \__\/                     \__\/         \__\/         \__\/                     \__\/         \__\/     ',
\ '',
\ '',
\ '',
\ ]

let g:startify_custom_header = [
\ '   _______               _______                                     ',
\ '   |   |   |.--.--.--.--.|    |  |.-----.--.--.--.--.-----.-----.    ',
\ '   |       ||  |  |  |  ||       ||  _  |  |  |  |  |  -__|     |    ',
\ '   |___|___||_____|___  ||__|____||___  |_____|___  |_____|__|__|    ',
\ '                  |_____|         |_____|     |_____|                ',
\ '   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                     +-+-+-+-+   ',
\ '   |W|e|l|c|o|m|e|t|o|m|y|h|o|u|s|e|                     |2|0|0|2|   ',
\ '   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                     +-+-+-+-+   ',
\ '',
\ '',
\]


" PLUGIN: ctrlp for NERDTREE
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" PLUGIN: vim-devicons for NERDTREE
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1 
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 
let g:WebDevIconsTabAirLineAfterGlyphPadding = ' '
let g:WebDevIconsTabAirLineBeforeGlyphPadding = ' '



" PLUGIN: nerdtree-git-plugin for NERDTREE
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'normal'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" =========================NERDTREE=========================


" =========================floaterm=========================
" Configuration example
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<Leader>fa'



hi FloatermNC guibg=gray
command! NNN FloatermNew nnn
command! FZF FloatermNew --width=0.8 --height=0.8 fzf
nnoremap ff :FloatermNew --width=0.8 --height=0.8 --name=search fzf<CR> 
nnoremap <leader>ft :FloatermNew --height=0.8 --width=0.8 --wintype=float --name=hyquaq<cr>
nnoremap ft :FloatermNew --height=0.8 --width=0.8 --wintype=float --name=hyquaq<cr>
nnoremap <c-s> :w<cr>
nnoremap <esc><esc> :wq<cr>
" inoremap <esc><esc> :wq<cr>
" =========================floaterm=========================




" =========================COC=========================
" markdown
map <leader>md :CocCommand markdown-preview-enhanced.openPreview<CR>

" TAB COMPLETED
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" CONFIG
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ ]
" =========================COC=========================



packloadall
" PLUGIN PRETTIER
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0


" noremap <F3> :Autoformat<cr>
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

augroup autoformat_settings
autocmd FileType bzl AutoFormatBuffer buildifier
" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
autocmd FileType dart AutoFormatBuffer dartfmt
autocmd FileType go AutoFormatBuffer gofmt
autocmd FileType gn AutoFormatBuffer gn
autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
autocmd FileType java AutoFormatBuffer clang-format
autocmd FileType python AutoFormatBuffer yapf
autocmd FileType python AutoFormatBuffer autopep8
autocmd FileType rust AutoFormatBuffer rustfmt
autocmd FileType vue AutoFormatBuffer prettier
augroup END



" MAP
"" format
nnoremap <leader>f :Prettier<CR>
"" delete one line
noremap - dd
"" c-d remove current line
inoremap <c-d> <esc>ddi
"" UPPERCASE
vnoremap <c-u> U
"" remove line and enter insert mode
nnoremap <leader>c ddO
"" quick edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"" exit and save
nnoremap zz :wq<cr>
"" quit
" noremap qq :q!<cr>
"" mapping add ", ', (, { around word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
"" return normal mode
inoremap jk <esc>
"" disable keys
" inoremap <esc> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <top> <nop>
noremap <down> <nop>

"" OPERATOR-PEDING
onoremap p i(
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>

onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>


" IABBREV abbretiations
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev qname Nguyen Huy
iabbrev qemail hyquaq@gmail.com
iabbrev @@ hyquaq@gmail.com
iabbrev ccopy Copyright 2021 Huy Nguyen, all rights reserved.

" MY AUTOCMD 
autocmd FileType javascript noremap <leader>c I//<esc>
autocmd FileType java noremap <leader>c I// <esc>
autocmd FileType python noremap <leader>c I# <esc>

autocmd FileType html set nowrap
autocmd FileType markdown set wrap
autocmd FileType markdown set nofoldenable

autocmd FileType python :iabbrev iff if:<left>
autocmd FileType javascript :iabbrev iff if ()<left>
autocmd FileType java :iabbrev iff if ()<left>
autocmd FileType sass :iabbrev rscs *{margin:0; padding:0; box-sizing:border-box;}<cr>
autocmd FileType scss :iabbrev rscs *{margin:0; padding:0; box-sizing:border-box;}<cr>
autocmd FileType css :iabbrev rscs *{margin:0; padding:0; box-sizing:border-box;}<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>


set foldenable
set foldmethod=indent




" MAP ADVANCE
if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    " map <C-V>		"+gP
    " map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+
endif

" inoremap <S-Insert> <C-V>
" vmap <S-Insert>		<C-V>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG


" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

if has("gui")
  " CTRL-F is the search dialog
  noremap  <expr> <C-F> has("gui_running") ? ":promptfind\<CR>" : "/"
  inoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-O>:promptfind\<CR>" : "\<C-\>\<C-O>/"
  cnoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-C>:promptfind\<CR>" : "\<C-\>\<C-O>/"

  " CTRL-H is the replace dialog,
  " but in console, it might be backspace, so don't map it there
  nnoremap <expr> <C-H> has("gui_running") ? ":promptrepl\<CR>" : "\<C-H>"
  inoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-O>:promptrepl\<CR>" : "\<C-H>"
  cnoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-C>:promptrepl\<CR>" : "\<C-H>"
endif

let g:user_emmet_settings = {
  \ 'javascript' : {
  \   'extensions': 'js',
  \ },
  \ }

" multiple cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

