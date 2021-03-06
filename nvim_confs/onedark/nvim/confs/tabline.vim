" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersRight<CR>
nnoremap mymap :lua require"bufferline".go_to_buffer(num)<CR>

nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

nnoremap <silent>[n :BufferLineMoveNext<CR>
nnoremap <silent>n] :BufferLineMovePrev<CR>

lua << EOF 

require'bufferline'.setup{
  options = {
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 14,
    max_prefix_length = 13, 
    tab_size = 18,
    enforce_regular_tabs = true ,
   view = "multiwindow" ,
    show_buffer_close_icons = true ,
    separator_style = "thin" 
    },

      highlights = {
        background = {
        guifg = comment_fg,
        guibg = '#282c34'
     },
      fill = {
        guifg = comment_fg,
        guibg = '#282c34' 
      },
        buffer_selected = {
        guifg = normal_fg,
        guibg =  '#3A3E44',
        gui = "bold"
      }, 
       separator_visible = {
        guifg = '#282c34' ,
        guibg = '#282c34'
        },
        separator_selected = {
        guifg = '#282c34'  ,
        guibg = '#282c34'
      },
      separator = {
        guifg = '#282c34' ,
        guibg = '#282c34' 
      },
      indicator_selected = {
         guifg = '#282c34' ,
        guibg = '#282c34'  
      },
        modified_selected = {
        guifg = string_fg,
        guibg = '#3A3E44'
      }
   };  
}

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  line_bg = '#282c34',
  fg = '#D8DEE9',
  fg_green = '#65a380',
  yellow = '#A3BE8C',
  cyan = '#22262C',
  darkblue = '#61afef',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#252930',
  magenta = '#c678dd',
  blue = '#22262C';
  red = '#ec5f67',
  firored = '#DF8890',
  lightbg = '#3C4048',
  nord = '#81A1C1',
  nordYel = '#EBCB8B'
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
    provider = function() return '   ' end,
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
    icon = '   ',
    highlight = {colors.nordYel,colors.line_bg},
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

require('gitsigns').setup {
  signs = {
    add          = {hl = 'DiffAdd'   , text = '▌', numhl='GitSignsAddNr'},
    change       = {hl = 'DiffChange', text = '▌', numhl='GitSignsChangeNr'},
    delete       = {hl = 'DiffDelete', text = '_', numhl='GitSignsDeleteNr'},
    topdelete    = {hl = 'DiffDelete', text = '‾', numhl='GitSignsDeleteNr'},
    changedelete = {hl = 'DiffChange', text = '~', numhl='GitSignsChangeNr'},
  },
  numhl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  },
  watch_index = {
    interval = 100
  },
  sign_priority = 5,
  status_formatter = nil, -- Use default
}

EOF 
