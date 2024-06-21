local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'phpactor',
        'bashls',
        'svelte',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

require('lspconfig').rust_analyzer.setup({
    -- Should be project by project based with neoconf - only set global settings
    -- here with good reason
    -- settings = {
    --     ["rust-analyzer"] = {
    --         rustfmt = {
    --             -- use leptosfmt instead of rustfmt
    --             overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
    --         }
    --     }
    -- }
})

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } }
        }
    }
}

-- No Mason LSP required for dartls
require("lspconfig").dartls.setup {}

require('lspconfig').phpactor.setup {}

-- Setup liquid lsp
require('lspconfig').theme_check.setup {}

-- Setup graphql lsp
local servers = { 'graphql' };
if has_mason_lspconfig then
    mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = servers,
    })
end

if has_lsp_config then
    for _, server in ipairs(servers) do
        require("lsp.servers." .. server).setup(on_attach, capabilities)
    end
end

local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.graphql.setup({
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end

return M

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "liquid",
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })
