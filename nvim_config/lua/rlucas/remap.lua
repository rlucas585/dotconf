vim.g.mapleader = " "                         -- Set leader key
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Remap in normal mode " pv" to run `Ex` (open directory view)

-- We don't need a mouse in vim
vim.opt.mouse = "a"

-- Toggle back to the last open file
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- Create a new file adjacent to the currently open file
vim.keymap.set("n", "<leader>o", ":e <C-R>=expand('%:p:h') . '/' <CR>")

-- make `;` equivalent to `:`
vim.keymap.set("n", ";", ":")

-- Lets you highlight blocks of text, and move them around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")       -- Join lines without moving the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Move down half a page, and keep cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv") -- Move to next search result, and keep cursor centered
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste without copying the text you just pasted, using <leader>-p

vim.keymap.set("n", "<leader>y", "\"+y")  -- Copy to system clipboard using <leader>-y
vim.keymap.set("v", "<leader>y", "\"+y")  -- Copy to system clipboard using <leader>-y
vim.keymap.set("n", "<leader>Y", "\"+Y")  -- Copy to system clipboard using <leader>-Y

-- Delete to void register, using <leader>-d
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<Nop>") -- Disable Ex mode

-- Open a new tmux window using the `tmux-sessionizer` script
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Also center when going to the end of the file
vim.keymap.set("n", "G", "Gzz")

-- NOTE: These don't seem to work, use [d and ]d instead
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- Go to next error, and keep cursor centered
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz") -- Go to prev error, and keep cursor centered
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>")

-- No using arrow keys
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- Left and right can switch buffers
vim.keymap.set("n", "<left>", ":bp<CR>")
vim.keymap.set("n", "<right>", ":bn<CR>")

-- format the current buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Jump between tabs with leader
vim.keymap.set("n", "<leader>1", ":tabn 1<CR>")
vim.keymap.set("n", "<leader>2", ":tabn 2<CR>")
vim.keymap.set("n", "<leader>3", ":tabn 3<CR>")
vim.keymap.set("n", "<leader>4", ":tabn 4<CR>")
vim.keymap.set("n", "<leader>5", ":tabn 5<CR>")
vim.keymap.set("n", "<leader>6", ":tabn 6<CR>")
vim.keymap.set("n", "<leader>7", ":tabn 7<CR>")
vim.keymap.set("n", "<leader>8", ":tabn 8<CR>")
vim.keymap.set("n", "<leader>9", ":tabn 9<CR>")

-- easy `diffthis` and `diffoff`
vim.keymap.set("n", "<leader>dt", ":diffthis<CR>")
vim.keymap.set("n", "<leader>do", ":diffoff<CR>")
