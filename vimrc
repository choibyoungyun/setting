" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
 "Fugitive is the premier Vim plugin for Git.
 ":help Git
 Plug 'tpope/vim-fugitive'

 "The NERDTree is a file system explorer for the Vim editor.
 Plug 'preservim/nerdtree'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'flazz/vim-colorschemes'
 Plug 'majutsushi/tagbar'
 Plug 'nathanaelkane/vim-indent-guides'
 Plug 'tmhedberg/SimpylFold'
 Plug 'jreybert/vimagit'

 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 "Python formatter
 Plug 'psf/black'

 "FrontEnd (javascript, typescript, html, css)
 "Plug 'mattn/emmet-vim'
 "Plug 'pangloss/vim-javascript'
 "Plug 'mxw/vim-jsx'
 "Plug 'maxmellon/vim-jsx-pretty'
 "Plug 'https://github.com/leafgarland/typescript-vim.git'
 "Plug 'prettier/vim-prettier'
call plug#end()


filetype plugin indent on    " required
syntax on

" -------------------------------------------------------------------------
"  DEFAULT Basic Property
" -------------------------------------------------------------------------
set encoding=utf-8
set autoindent
set cindent
set smartindent
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fileformat=unix

" -------------------------------------------------------------------------
"  DEFAULT COLOR & Column
" -------------------------------------------------------------------------
set t_Co=256
"colo gruvbox
"colo jellybeans
set bg=dark
highlight Visual term=reverse cterm=reverse guibg=Grey

set colorcolumn=81
highlight colorcolumn  ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" -------------------------------------------------------------------------
"  auto remove trailing space (c, cpp)
" -------------------------------------------------------------------------
autocmd FileType c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e

" -------------------------------------------------------------------------
"  override tabstop, shiftwidth (default:4)
" -------------------------------------------------------------------------
autocmd FileType typescript,typescriptreact,javascript,html setlocal ts=2 sts=2 sw=2 expandtab

" -------------------------------------------------------------------------
"  vim split move
" -------------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -------------------------------------------------------------------------
"  fold tool
" -------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" -------------------------------------------------------------------------
"  type checking  (pyright)
" -------------------------------------------------------------------------
"autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" -------------------------------------------------------------------------
"  formatter setup (Black)
"
"  https://black.readthedocs.io/en/stable/integrations/editors.html
"  let g:black_fast (defaults to 0)
"  let g:black_linelength (defaults to 88)
"  let g:black_skip_string_normalization (defaults to 0)
"  let g:black_virtualenv (defaults to ~/.vim/black or ~/.local/share/nvim/black)
"  let g:black_quiet (defaults to 0)
"  let g:black_linelength  = 80
" -------------------------------------------------------------------------
let g:black_linelength  = 80

" -------------------------------------------------------------------------
"  XML editing
" -------------------------------------------------------------------------
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax


" -------------------------------------------------------------------------
"  indent tool
" -------------------------------------------------------------------------
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guide_exclude_filetype = ['help', 'nerdtree', 'text', 'sh']


" -------------------------------------------------------------------------
"  Tagbar Toggle <F3> {python flake}
" -------------------------------------------------------------------------
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :IndentGuidesToggle<CR>


" -------------------------------------------------------------------------
"  airline
" -------------------------------------------------------------------------
let g:airline_theme='papercolor'
let g:airline#extensions#poetv#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffer_nr_show = 1    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer  number format 
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 1      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

" -------------------------------------------------------------------------
"  NVIM COC recommandation
" -------------------------------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
