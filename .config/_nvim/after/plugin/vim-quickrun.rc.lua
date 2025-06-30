local status, vr = pcall(require, "vim-quickrun")
if (not status) then return end

vr.setup({})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-s>', ':wa <bar> :QuickRun <stdin.txt <CR>')
