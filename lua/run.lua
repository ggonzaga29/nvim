local langs = {
    cpp = ':TermExec cmd="g++ % -o a.out && a.out"<CR>',
}

local direction = 'horizontal'

function run(file_ext)
    -- local command = langs[file_ext]
    -- vim.api.nvim_command(command) 
    print(file_ext)
end

vim.api.nvim_create_user_command('run', run(file_ext))
