local function map(m, k, v)
    vim.keymap.set(m, k, v)
end

map('n', '<Leader>e', ':NvimTreeToggle<CR>')
map('n', '<Leader>r', [[:Coderun]])
map('n', '<Leader>s', ':w<CR>')


 
