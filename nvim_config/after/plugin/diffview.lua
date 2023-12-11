local diffview = require('diffview')

-- vim.api.nvim_set_hl(0, 'DiffviewStatusAdded', { bg = '#0000AA' })
-- vim.api.nvim_set_hl(0, 'DiffviewStatusDeleted', { bg = '#0000AA' })

-- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#62693e", blend = 100 })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#283228" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#785818" })

vim.keymap.set('n', '<leader>dv', function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd('DiffviewOpen')
    else
        vim.cmd('DiffviewClose')
    end
end)
