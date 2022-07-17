local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically source and re-compile packer whenever you save this file.
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'plugins.lua',
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Package Manager
  use 'rebelot/kanagawa.nvim'   -- Colorscheme

  if packer_bootstrap then
    print 'Installing plugins. After completion, restart nvim...'
    require('packer').sync()
  end
end)

-- vim: ts=2 sts=2 sw=2 et
