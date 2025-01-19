require("lualine").setup({
  options = {
    component_separators = { left = "|", right = "|" },
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {},
    lualine_c = {},
    lualine_x = {'fileformat', 'filetype'},
    lualine_z = {},
  },
  tabline={
    lualine_a = {'tabs'},
    lualine_z = {
      {
        'filename',
        path = 1
      }
    }
  }
})
