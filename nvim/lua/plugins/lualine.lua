local colors = {
  hardblack    = '#1d2021',
  black        = '#32302f',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  yellow       = '#fabd2f',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
}

local b_default = { bg = colors.black, fg = colors.white }
local c_default = { bg = colors.hardblack, fg = colors.white}

local gruvbox_theme = {
  normal = {
    a = { bg = colors.gray, fg = colors.hardblack, gui = 'bold' },
    b = b_default,
    c = c_default,
  },
  insert = {
    a = { bg = colors.blue, fg = colors.hardblack, gui = 'bold' },
    b = b_default,
    c = c_default,
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.hardblack, gui = 'bold' },
    b = b_default,
    c = c_default,
  },
  replace = {
    a = { bg = colors.red, fg = colors.hardblack, gui = 'bold' },
    b = b_default,
    c = c_default,
  },
  command = {
    a = { bg = colors.blue, fg = colors.hardblack, gui = 'bold' },
    b = b_default,
    c = c_default,
  },
  inactive = {
    a = { bg = colors.hardblack, fg = colors.white},
    b = b_default,
    c = b_default, -- non an error
  },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = gruvbox_theme,
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center components here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location' },
      },
    },
    inactive_sections = {
      lualine_a = {"mode"},
      lualine_b = {"filename"},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location' },
      },
    },
    tabline = {},
    extensions = {},
  }
}
