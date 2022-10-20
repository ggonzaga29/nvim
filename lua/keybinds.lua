local function map(m, k, v)
    vim.keymap.set(m, k, v)
end

map('n', '<C-b>', ':NvimTreeToggle<CR>')
map('n', '<Leader>run', [[:echo expand("%:e")]])
map('n', '<C-s>', ':w<CR>')

