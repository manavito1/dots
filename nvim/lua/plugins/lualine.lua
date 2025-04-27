return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Gruvbox color definitions
    local colors = {
      black = '#282828',
      white = '#ebdbb2',
      red = '#fb4934',
      green = '#b8bb26',
      blue = '#83a598',
      yellow = '#fe8019',
      gray = '#a89984',
      darkgray = '#3c3836',
      lightgray = '#504945',
      inactivegray = '#7c6f64',
    }

    -- Gruvbox theme definition
    local gruvbox_theme = {
      normal = {
        a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      insert = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      replace = {
        a = { bg = colors.white, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      inactive = {
        a = { bg = 'NONE', fg = colors.gray, gui = 'bold' },
        b = { bg = 'NONE', fg = colors.gray },
        c = { bg = 'NONE', fg = colors.gray },
      },
    }

    -- Mode formatting
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    -- Filename component
    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    -- Helper for conditional hiding
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    -- Diagnostics component
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    -- Diff component
    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    -- Setup lualine with Gruvbox theme
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = gruvbox_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          'alpha',
          'snacks_dashboard',
          'snacks_picker_list',
          'Avante',
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = {
          { 'encoding', cond = hide_in_width },
          'fileformat',
          { 'filetype', cond = hide_in_width },
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'fugitive' },
    }
  end,
}
