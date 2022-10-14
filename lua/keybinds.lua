local function map(m, k, v)
    vim.keymap.set(m, k, v)
end

map('n', '<C-b>', ':NvimTreeToggle<CR>')
map('n', 'cpp', ':!g++ % -o a.out && a.out')
map('n', '<C-s>', ':w<CR>')

