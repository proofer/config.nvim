return {
    'mfussenegger/nvim-dap-python',
    dependencies = {
        'mfussenegger/nvim-dap',
    },
    config = function()
        local path_to_python = vim.env.HOME .. '/dev/StocksFilter/.venv/bin/python'
        require('dap-python').setup(vim.env.HOME .. '/dev/.py-venvs/debugpy/bin/python')
        table.insert(require('dap').configurations.python, {
            type = 'python',
            request = 'launch',
            name = '-u for unbuffered output',
            program = '${file}',
            python = { path_to_python, '-u' },
        })
    end,
}
