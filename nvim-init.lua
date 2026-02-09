vim.opt.tabstop = 4      -- A tab character is displayed as 4 spaces wide
vim.opt.shiftwidth = 4   -- Indentation commands use 4 spaces
vim.opt.expandtab = true -- Use spaces instead of actual tab characters
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for while editing
--- source preexisting conf ------------------------------------
local user_init = vim.fn.stdpath("config") .. "/init.lua"
if vim.fn.filereadable(user_init) == 1 then
dofile(user_init)
end

--- visual adjustments  ----------------------------------------
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_scale_factor = 1.11
vim.cmd.colorscheme("dracula")

--- change font size  ------------------------------------------
vim.keymap.set('n', '<C-=>', function()
vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)
vim.keymap.set('n', '<C-->', function()
vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)
