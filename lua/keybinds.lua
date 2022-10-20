local function map(m, k, v)
    vim.keymap.set(m, k, v)
end

map('n', '<C-b>', ':NvimTreeToggle<CR>')
map('n', '<Leader>r', [[:Coderun]])
map('n', '<C-s>', ':w<CR>')

