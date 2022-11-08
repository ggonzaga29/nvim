local langs = {
    cpp = ':TermExec cmd="g++ % -o a.out && a.out"<CR>',
    java = ':TermExec cmd="java %"',
    rust = ':TermExec cmd="cargo run"',
    default = 'Config not found for currrent language'
}

local direction = 'horizontal'

vim.api.nvim_create_user_command(
    'Coderun', 
    function()
        local file_ext = vim.bo.filetype
        local command = langs[file_ext]

        if not command then
            command = langs['default']
            return print(command .. ': ' .. file_ext)
        end

        -- clear stdout 
        vim.api.nvim_command(':TermExec cmd="clear"')

        vim.api.nvim_command(command)
    end,
    { nargs = 0 }
)

