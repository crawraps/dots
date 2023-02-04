" Preferences
set number
set clipboard+=unnamedplus
set hidden
set autochdir
set cmdheight=2
set shortmess+=c
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
syntax on
let mapleader=","

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs' " usability / auto brackets
Plug 'tpope/vim-surround' " usability / double marks
Plug 'chiedo/vim-case-convert' " usability / case converter
Plug 'itchyny/lightline.vim' " pretty bottom bar
Plug 'romgrk/barbar.nvim' " tabs
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim' " Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' } " Telescope
Plug 'nvim-telescope/telescope-file-browser.nvim' " Telescope file browser
Plug 'nvim-telescope/telescope-project.nvim' " Telescope project
call plug#end()

" Telescope project
lua require'telescope'.load_extension('project') " Load project
map <leader>p :lua require'telescope'.extensions.project.project{}<CR>

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']


" ----- CoC preferences ------ "

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Sass support
autocmd FileType scss setl iskeyword+=@-@

" Colorscheme
let dracula_colorterm=0
colorscheme dracula

" NerdTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Custom keymap
map ,a <ESC>la,<ESC>o
map cp "zdd<S-p>

" CoC maps
try
  nmap <silent> ]e :call CocAction('diagnosticNext')<cr>
  nmap <silent> [e :call CocAction('diagnosticPrevious')<cr>
endtry

" ----- tabs (romgrk/barvar.nvim) ----- "
  
" Move to previous/next
nnoremap <silent>    <A-h> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-l> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <C-h> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <C-l> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Close buffer
nnoremap <silent>    <A-q> <Cmd>BufferClose<CR>
