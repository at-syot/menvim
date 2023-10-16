require('rose-pine').setup({
  disable_float_background = true,
	disable_italics = true,
})

function ColorMyPencils(color) 
	-- color = color or 'rose-pine'
	-- vim.cmd.colorscheme(color)
  color = color or 'melange'
  vim.cmd { cmd = 'set', args = {'background=dark'} };
  vim.cmd.colorscheme(color)
end

ColorMyPencils()
