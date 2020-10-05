call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }


" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'honza/vim-snippets'

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'ianding1/leetcode.vim'
Plug 'vim-scripts/a.vim'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'milkypostman/vim-togglelist'
Plug 'easymotion/vim-easymotion'
Plug 'rizzatti/dash.vim'
Plug 'sirver/ultisnips'
Plug 'sjl/splice.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/echodoc.vim'

if has('nvim-0.5')
    Plug 'nvim-treesitter/nvim-treesitter'
endif

if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
endif

" Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
"
call plug#end()

""Set mapleader
let mapleader = ","
let g:mapleader = ","



set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set termguicolors
set lazyredraw

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

""Show line number
set nu
"
""Change buffer - without saving
set hid

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=acfiIAso

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> fd <Plug>(coc-definition)
nmap <silent> fy <Plug>(coc-type-definition)
nmap <silent> fi <Plug>(coc-implementation)
nmap <silent> fr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent>H  :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
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
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <Leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <Leader>c  :<C-u>CocList commands<cr>
"kFind symbol of current document.
nnoremap <silent> <Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" Do default action for previous item.
nnoremap <silent> <Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>r  :<C-u>CocListResume<CR>

""tagbar setting
"let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
let g:tagbar_width = 35
map <F4> :TagbarToggle<cr> 


nmap <F3> :CocCommand explorer<cr>
nmap <F2> :Buffers<cr>
nmap <s-D-n> :silent cp<cr>
map <D-n> :silent cn<cr>

nnoremap <F7> :UndotreeToggle<cr>
""Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set backspace=eol,start,indent
set smarttab
set lbr
"set listchars=precedes:«,extends:»,tab:▸·,trail:∙,eol:¶
"set tw=500

"Auto indent
set autoindent

""Smart indet
set smartindent
"
set nocompatible

set noswapfile

set ffs=unix,dos,mac
set so=7
"Turn on WiLd menu
set wildmenu

set guifont=MesloLGS\ Nerd\ Font\ Mono:h16

nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

let g:leetcode_china=1
let g:leetcode_solution_filetype='cpp'
let g:leetcode_browser='chrome'


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

set ignorecase

let g:Lf_RootMarkers = ['.root']

let g:coc_global_extensions = [
            \'coc-actions',
            \'coc-browser',
            \'coc-clangd',
            \'coc-cmake',
            \'coc-diagnostic',
            \'coc-dictionary',
            \'coc-explorer',
            \'coc-git',
            \'coc-git-p',
            \'coc-github',
            \'coc-gitignore',
            \'coc-go',
            \'coc-html',
            \'coc-inline-jest',
            \'coc-java',
            \'coc-json',
            \'coc-lists',
            \'coc-marketplace',
            \'coc-omni',
            \'coc-pyright',
            \'coc-python',
            \'coc-rls',
            \'coc-rust-analyzer',
            \'coc-sh',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tag',
            \'coc-tasks',
            \'coc-template',
            \'coc-terminal',
            \'coc-translator',
            \'coc-ultisnips',
            \'coc-vimlsp',
            \'coc-word',
            \'coc-wxml',
            \'coc-xml',
            \'coc-yank' ]


" set up for neovim
if has('nvim')
    lua require'colorizer'.setup()
endif

" coc translator
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)



if has("nvim-0.5")
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = { enable = true },
    incremental_selection = { enable = true },
    refactor = {
      highlight_definitions = { enable = true },
      smart_rename = { enable = true },
      navigation = { enable = true },
    },
    textobjects = { enable = true },
  }
EOF
endif


"       \{ 22: '#006F00', 23: '#007173', 24: '#007299', 25: '#0074BE', 30: '#009799',
"       \  31: '#0099BD', 38: '#00BDDF', 52: '#730B00', 58: '#727100', 59: '#727272',
"       \  65: '#719872', 66: '#719899', 67: '#7299BC', 68: '#719CDF', 73: '#6FBCBD',
"       \  74: '#70BDDF', 88: '#9B1300', 89: '#9B1D72', 94: '#9A7200', 95: '#9A7372',
"       \  96: '#9A7599', 101: '#999872', 103: '#999ABD', 108: '#98BC99', 109: '#98BCBD',
"       \ 110: '#98BEDE', 116: '#97DDDF', 125: '#BF2172', 131: '#BE7572', 137: '#BE9873',
"       \ 143: '#BDBB72', 144: '#BDBC98', 145: '#BDBDBD', 151: '#BCDDBD', 152: '#BCDEDE',
"       \ 153: '#BCE0FF', 161: '#E12672', 168: '#E17899', 173: '#E19972', 174: '#E09B99',
"       \ 179: '#DFBC72', 181: '#E0BEBC', 184: '#DEDC00', 186: '#DEDD99', 187: '#DFDEBD',
"       \ 189: '#DFDFFF', 216: '#FFBD98', 217: '#FFBFBD', 218: '#FFC0DE', 220: '#FFDD00',

" set for seoul256 color
"         \ 189: '#DFDFFF', 216: '#FFBD98', 217: '#FFBFBD', 218: '#FFC0DE', 220: '#FFDD00',
"         \ 222: '#FFDE99', 224: '#FFDFDF', 230: '#FFFFDF', 231: '#FFFFFF', 232: '#060606',
"         \ 233: '#171717', 234: '#252525', 235: '#333233', 236: '#3F3F3F', 237: '#4B4B4B',
"         \ 238: '#565656', 239: '#616161', 240: '#6B6B6B', 241: '#757575', 249: '#BFBFBF',
"         \ 250: '#C8C8C8', 251: '#D1D0D1', 252: '#D9D9D9', 253: '#E1E1E1', 254: '#E9E9E9',
"         \ 255: '#F1F1F1' } endif
" endif

"let g:seoul256_background=235
let g:seoul256_background=235
colorscheme seoul256

hi Pmenu ctermfg=236 ctermbg=224 guifg=#C8C8C8 guibg=#252525
hi PmenuSel ctermfg=252 ctermbg=89 guifg=#F1F1F1 guibg=#006f45

" air line
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }


let g:echodoc#enable_at_startup=1
set noshowmode
"if has('nvim')
"    let g:echodoc#type = 'virtual'
"else
"
"endif

