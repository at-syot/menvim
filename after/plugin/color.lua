require('rose-pine').setup({
  styles = {
    bold = false,
    italic = false,
    transparency = false,
  },
})

function ColorMyPencils(color)
	-- color = color or 'rose-pine'
	-- vim.cmd.colorscheme(color)

  --[[ color = color or 'melange'
  vim.g.melang_enable_font_variants = 0
  vim.cmd { cmd = 'set', args = {'background=dark'} };
  vim.cmd.colorscheme(color) ]]
  -- vim.opt.background = 'dark'
  -- vim.cmd.colorscheme("colorbuddy")
  --

  -- vim.opt.background = 'dark'
  -- vim.cmd.colorscheme("rose-pine")

  vim.opt.background = 'dark'
  vim.cmd.color('melange')
end

ColorMyPencils()
