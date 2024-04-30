return {
    'kdheepak/lazygit.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim', -- optional for floating window border decoration
    },
    cmd = {
        'LazyGit', -- Open floating window with lazygit in the current working directory
        'LazyGitConfig', -- Open the configuration file for lazygit
        'LazyGitCurrentFile', -- Open buffer commits with lazygit
        'LazyGitFilter', -- Open project commits with lazygit
        'LazyGitFilterCurrentFile', -- Open floating window with lazygit in the project root of the current file
    },
    -- setting the keybinding for LazyGit with "keys" is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
}
