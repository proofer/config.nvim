-- plugin built-in mappings:
-- i  <M-C-Right>   <Plug>(copilot-accept-line)
-- i  <M-Right>     <Plug>(copilot-accept-word)
-- i  <M-Bslash>    <Plug>(copilot-suggest)
-- i  <M-[>         <Plug>(copilot-previous)
-- i  <M-]>         <Plug>(copilot-next)
-- i  <C-]>         <Plug>(copilot-dismiss)

return {
    'github/copilot.vim',
    -- keys = {
    --     { '<C-S-Space>l', '<Plug>(copilot-accept-line)', mode = 'i', desc = 'Accept line' },
    --     { '<C-S-Space>w', '<Plug>(copilot-accept-word)', mode = 'i', desc = 'Accept word' },
    --     { '<C-S-Space>s', '<Plug>(copilot-suggest)', mode = 'i', desc = 'Make suggestion' },
    --     { '<C-S-Space>p', '<Plug>(copilot-previous)', mode = 'i', desc = 'Previous suggestion' },
    --     { '<C-S-Space>n', '<Plug>(copilot-next)', mode = 'i', desc = 'Next suggestion' },
    --     { '<C-S-Space>x', '<Plug>(copilot-dismiss)', mode = 'i', desc = 'Dismiss suggestion' },
    -- },
}
