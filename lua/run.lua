local langs = {
    cpp = ':TermExec cmd="g++ % -o a.out && a.out"<CR>',
    java = ':TermExec cmd="java %"',
    default = 'Config not found for currrent file'
}

local direction = 'horizontal'

vim.api.nvim_create_user_command(
    'Coderun', 
    function()
        local file_ext = vim.bo.filetype
        local command = langs[file_ext]

        if not command then
            command = langs['default']
            return print(command)
        end

        -- clear stdout 
        vim.api.nvim_command(':TermExec cmd="clear"')

        vim.api.nvim_command(command)
    end,
    { nargs = 0 }
)

