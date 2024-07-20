return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                { buffer = bufnr, desc = "code action" })
            vim.keymap.set("n", "<leader>cd", function() vim.lsp.buf.definition() end,
                { buffer = bufnr, desc = "definition" })
            vim.keymap.set("n", "<leader>cD", function() vim.lsp.buf.declaration() end,
                { buffer = bufnr, desc = "declaration" })
            vim.keymap.set("n", "<leader>ce", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr, desc = "diagnostics" })
            vim.keymap.set("n", "<leader>cf",
                function() vim.lsp.buf.format({ async = false, timeout_ms = 1000 }) end,
                { buffer = bufnr, desc = "format" })
            vim.keymap.set("n", "<leader>ci", function() vim.lsp.buf.implementation() end,
                { buffer = bufnr, desc = "implementation" })
            vim.keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<cr>",
                { buffer = bufnr, desc = "references" })
            vim.keymap.set("n", "<leader>cR", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "rename" })
            vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.signature_help() end,
                { buffer = bufnr, desc = "signature" })

            vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev() end, { buffer = bufnr })
            vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next() end, { buffer = bufnr })

            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr })

            -- Show diagnostics on hover
            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                    local opts = {
                        focusable = false,
                        header = false,
                        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                        border = 'none',
                        source = 'always',
                        prefix = '',
                        scope = 'cursor',
                    }
                    vim.diagnostic.open_float(nil, opts)
                end
            })
        end)

        lsp_zero.set_sign_icons({
            error = "▎",
            warn = "▎",
            hint = "▎",
            info = "▎",
        })

        -- here you can setup the language servers
        require('lspconfig').rust_analyzer.setup({})
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })
        require("lspconfig").clangd.setup({})
        require("lspconfig").volar.setup({})
        require("lspconfig").tsserver.setup({})
        require("lspconfig").omnisharp.setup({
            cmd = { "omnisharp"}
        })
        require("lspconfig").pyright.setup({})

        vim.diagnostic.config({
            virtual_text = false
        })

        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp_action.luasnip_supertab()
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })
    end
}
