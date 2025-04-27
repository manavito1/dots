return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = '',
      palette_overrides = {},
      overrides = {
        StatusLineNC = { bg = 'NONE' },
        NormalFloat = { bg = 'NONE' },
        WinSeparator = { fg = '#3c3836' },
        StatusLine = { bg = 'NONE' },
        WinBarNC = { fg = '#3c3836', bg = '#000000' },
        WinBar = { fg = '#ffffff', bg = 'NONE' },
        RenderMarkdownH1Bg = { bg = 'NONE' },
      },
      dim_inactive = false,
      transparent_mode = true, -- Global transparency
    }

    vim.o.background = 'dark'
    vim.cmd 'colorscheme gruvbox'

    -- Extra safety for snacks explorer
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'snacks_picker_list',
      callback = function()
        vim.opt_local.colorcolumn = ''
        vim.opt_local.cursorline = false
      end,
    })
  end,
}
