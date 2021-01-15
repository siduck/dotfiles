call plug#begin('~/.local/share/nvim/site/plugged')
"Plug 'mhartington/formatter.nvim'
Plug 'sbdchd/neoformat'
Plug 'glepnir/galaxyline.nvim'
"Plug 'tweekmonster/startuptime.vim'
Plug 'akinsho/nvim-bufferline.lua'
Plug '907th/vim-auto-save'
Plug 'michalliu/jsruntime.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
"Plug 'romgrk/barbar.nvim'
" Plug 'itchyny/lightline.vim'
" Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'joshdick/onedark.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'bfrg/vim-cpp-modern'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
call plug#end()



let g:AutoPairsFlyMode = 1
let g:rainbow_active = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_no_function_highlight = 1

let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on the bottom 
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-x> :call OpenTerminal()<CR>
nnoremap <c-b> :vnew term://bash<CR>


" new tab and switching between em 

nnoremap <c-e> : tabnew<CR>
nnoremap <c-w> : tabp <CR>
nnoremap <c-u> : tabn <CR>

" FZF settings with window splits 

"nnoremap <C-p> :FZF<CR>
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-s': 'split',
"  \ 'ctrl-v': 'vsplit'
"  \}

set updatetime=100

let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']


set expandtab sw=2

norm! gg=G
highlight EndOfBuffer ctermfg=black ctermbg=black

" format settings for clang 

"let g:clang_format#style_options = {
"      \ "AccessModifierOffset" : -4,
"      \ "AllowShortIfStatementsOnASingleLine" : "true",
"      \ "AlwaysBreakTemplateDeclarations" : "true",
"      \ "Standard" : "C++11",
"      \ "BreakBeforeBraces" : "Stroustrup"}

" line nums and its fg
highlight VertSplit cterm=NONE
set numberwidth =5
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


let g:tagalong_verbose = 1

"nnoremap <silent> <C-m> :%!astyle<CR>
nnoremap <silent> <C-a> :%y+<CR>

map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

syntax on
syntax enable
set termguicolors
colorscheme base16-gruvbox-dark-hard 

highlight! Normal guifg=NONE guibg=NONE

set showtabline=0  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set mouse=a

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

set clipboard+=unnamedplus  

function! GetHighlightGroup()
   let l:s = synID(line('.'), col('.'), 1)                                       
   echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
  endfunction

nnoremap gA :call GetHighlightGroup()<CR>

"nmap <Leader>py <Plug>(Prettier)

lua require'colorizer'.setup()

set fillchars=eob:\ 

lua <<EOF
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  ensure_installed = {
    "javascript","html","css","bash","cpp","rust"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  }

}
EOF

"  --indent = {
"    enable = true
"  },

hi LineNr guibg=NONE
hi SignColumn guibg=NONE
hi VertSplit guibg=NONE


nnoremap ,<space> :Neoformat <CR>
nnoremap .<space> :w <CR>

let g:nvim_tree_side =  'left' "left by default
let g:nvim_tree_width = 24 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:nvim_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'close_node':      ['<S-CR>', '<BS>'],
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let nvim_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }
hi LuaTreeIndentMarker guifg=#2C2C2C 

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>
" LuaTreeOpen and LuaTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guifg= #81A1C1  
highlight NvimTreeFolderName guifg = #81A1C1


lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  html = {
    icon = "",
    color = "#DE8C92",
    name = "html"
  },
  css = {
    icon = "",
    color = "#81A1C1",
    name = "css"
  },
   js = {
    icon = "",
    color = "#EBCB8B",
    name = "js"
  },
   png = {
    icon = " ",
    color = "#BD77DC",
    name = "png"
  },
   jpg = {
    icon = " ",
    color = "#BD77DC",
    name = "jpg"
  },
   jpeg = {
    icon = " ",
    color = "#BD77DC",
    name = "jpeg"
  },  
  mp3 = {
    icon = "",
    color = "#C8CCD4",
    name = "mp3"
  },
   mp4 = {
    icon = "",
    color = "#C8CCD4",
    name = "mp4"
  }, 
    out = {
    icon = "",
    color = "#C8CCD4",
    name = "out"
  },
    toml = {
    icon = "",
    color = "#81A1C1",
    name = "toml"
  },
  lock = {
    icon = "",
    color = "#DE6B74",
    name = "lock"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}


EOF

"  ------------------------ rust config ----------------------

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
    call CocAction('doHover')
  endif
endfunction


" ----- cool tabline ! ----------
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersRight<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used


"let g:lightline = {
"      \ 'enable': {
"      \   'tabline': 0
"      \ },
"      \   'colorscheme': 'deus',
"      \   'active': {
"      \     'left':[ [ 'mode', 'paste' ],
"      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
"      \     ]
"      \   },
"      \   'component': {
"      \     'lineinfo': ' %3l:%-2v 󰀘 ',
"      \   },
"      \   'component_function': {
"      \     'gitbranch': 'fugitive#head',
"      \   }
"      \ }

"let g:lightline.separator = {
"      \   'left': '', 'right': ''
      \}
"let g:lightline.subseparator = {
"      \   'left': '', 'right': ''
"      \}

"let g:lightline.tabline = {
"      \   'left': [ ['tabs'] ],
"      \   'right': [ ['close'] ]
"      \ }


lua << EOF 
  local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#212425',
  line_bg = ' #212425',
  fg = '#D8DEE9',
  fg_green = '#65a380',
  yellow = '#A3BE8C',
  cyan = '#22262C',
  darkblue = '#81A1C1',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#252930',
  magenta = '#c678dd',
  blue = '#22262C';
  red = '#ec5f67',
  firored = '#DF8890',
  lightbg = '#2C2C2C',
  nord = '#81A1C1'
}



gls.left[2] = {
  ViMode = {
    provider = function()
      return '  󰀘  '
    end,
    highlight = {colors.bg,colors.nord},
     separator = ' ',
  separator_highlight = {colors.lightbg,colors.lightbg},
  },
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.lightbg},
  },
}

gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
  separator = ' ',
  separator_highlight = {colors.line_bg,colors.lightbg},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.lightbg}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '    ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.fg,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {'#8FBCBB',colors.line_bg,'bold'},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.line_bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function () return ' ' end,
     highlight = {colors.line_bg,colors.line_bg}
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.firored,colors.firored},
    highlight = {colors.bg,colors.firored},
  }
}

gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.firored,colors.firored},
    highlight = {colors.bg,colors.fg},
  }
}
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.fg,colors.purple}
  }
}



require'bufferline'.setup{
  options = {
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, 
    tab_size = 22,
    enforce_regular_tabs = true ,
   view = "multiwindow" ,
    show_buffer_close_icons = true ,
    separator_style = "thin" 
    },

      highlights = {
        background = {
        guifg = comment_fg,
        guibg = ' #1d2021'
     },
      fill = {
        guifg = comment_fg,
        guibg = ' #1d2021' 
      },
        buffer_selected = {
        guifg = normal_fg,
        guibg =  '#2C2C2C',
        gui = "bold"
      }, 
       separator_visible = {
        guifg = '#2C2C2C' ,
        guibg = '#2C2C2C'
        },
        separator_selected = {
        guifg = '#2C2C2C'  ,
        guibg = '#2C2C2C'
      },
      separator = {
        guifg = ' #1d2021' ,
        guibg = ' #1d2021' 
      },
      indicator_selected = {
         guifg = '#2C2C2C' ,
        guibg = '#2C2C2C'  
      },
      
        modified_selected = {
        guifg = string_fg,
        guibg = '#2C2C2C'
      }

     };  
}



EOF 

"hi CustomExplorerBg guibg=#22262C

"augroup NvimTree 
"  au!
"  au FileType NvimTree setlocal winhighlight=Normal:CustomExplorerBg
"augroup END

let g:auto_save = 1

