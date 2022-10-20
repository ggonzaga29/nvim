local langs = {
    cpp = ':TermExec cmd="g++ % -o a.out && a.out"<CR>',
    default = 'Config not found for currrent file'
}

local direction = 'horizontal'

vim.api.nvim_create_user_command(
    'Coderun', 
    function()
        local file_ext = vim.bo.filetype
        local command = langs[file_ext]

        vim.api.nvim_command(command)
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command('Runc',
    function()
        vim.api.nvim_command(':Coderun cpp')
    end,
    { nargs = 0 }
)


    
