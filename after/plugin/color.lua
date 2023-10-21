function ColorMyPencils(color) 
	-- color = color or 'rose-pine'
	-- vim.cmd.colorscheme(color)
  color = color or 'melange'
  vim.g.melang_enable_font_variants = 0
  vim.cmd { cmd = 'set', args = {'background=dark'} };
  vim.cmd.colorscheme(color)
end

ColorMyPencils()
