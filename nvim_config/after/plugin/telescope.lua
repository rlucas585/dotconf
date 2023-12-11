local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- binding for "project file"
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- search git files with ctrl-p
vim.keymap.set('n', '<leader>ps', function()  -- project search for a word using ripgrep
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>h', builtin.oldfiles, {}) -- get recent files
