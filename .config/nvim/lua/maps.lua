local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwords
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit', { silent = true })
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

-- Move Window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- Resize Window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', '<D-s>', ':w')

keymap.set('n', '<C-s>', ':wa <bar> :QuickRun <stdin.txt <CR>')
vim.cmd [[
  let g:quickrun_config = {}
  let g:quickrun_config['cpp'] = {
    \  'cmdopt' : '-std=c++14 -Wall',
    \  'hook/time/enable' : 1
    \}
  let g:quickrun_config['_'] = {
    \  'split' : 'vertical'
    \}
  set splitright
]]