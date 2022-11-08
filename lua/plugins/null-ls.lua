local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.eslint,
    formatting.autopep8,
    formatting.stylua,
    formatting.prettier,
    formatting.clang_format,
    formatting.google_java_format
}

null_ls.setup({
    sources = sources
})

vim.keymap.set('n', '<M-f>', ':lua vim.lsp.buf.format() <CR>')
