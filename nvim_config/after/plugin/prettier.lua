local prettier = require("prettier")

prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.graphql", "*.gql", "*.md" },
    callback = function()
        -- You can use vim.cmd to execute Ex commands, like calling a Prettier plugin
        vim.cmd("Prettier")
    end,
})
