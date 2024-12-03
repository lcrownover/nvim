-- LSP and LSP accessories
return {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    opts = {
        inlay_hints = { enable = true },
    },
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        {
            "folke/neodev.nvim",
            opts = {},
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("attach-lsp", { clear = true }),
            callback = function(event)
                local toggle_inlay_hints = function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
                end
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end
                map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                map("gr", require("telescope.builtin").lsp_references, "Goto References")
                map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementations")
                map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
                map("<leader>lr", ":LspRestart<cr>", "Restart LSP server")
                map("<leader>li", ":LspInfo<cr>", "Show LSP info")
                map("<leader>lh", toggle_inlay_hints, "Toggle LSP inlay hints")
                -- map("<leader>fs", vim.lsp.buf.format, "LSP Format") -- this is in keymaps.lua
                -- map("gn", vim.lsp.buf.rename, "Rename Symbol")
                map("<F2>", vim.lsp.buf.rename, "Rename Symbol")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
            end,
        })

        -- Advertise LSP capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- LSP servers and their configurations
        local lsp_servers = {
            bashls = {},
            clangd = {},
            html = {},
            marksman = {},
            ruff = {},
            ansiblels = {
                filetypes = {
                    "yml.ansible",
                    "yml",
                },
            },
            gopls = {
                settings = {
                    gopls = {
                        staticcheck = true,
                        buildFlags = { "-tags=2311" }
                    },
                },
            },
            rust_analyzer = {
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            },
            terraformls = {
                filetypes = {
                    "terraform",
                    "tf",
                },
            },
            svelte = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            disable = { "missing-fields" },
                            globals = { "vim" },
                        },
                    },
                },
            },
        }

        -- List of formatters and linters to install
        local lsp_tools = {
            "prettier",
            "prettierd",
            "stylua",
            "luacheck",
            "isort",
            "mypy",
            "ruff",
            "eslint_d",
            "ansible-lint",
            "shfmt",
            "shellcheck",
            "markdownlint",
            "vale",
            "yamlfix",
            "yamllint",
        }

        -- Builds a list of tools (LSP servers, formatters, linters) to be installed by mason-tool-installer
        local ensure_installed = vim.tbl_keys(lsp_servers or {})
        vim.list_extend(ensure_installed, lsp_tools)

        -- Initialize Mason for installing tools
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- Ensure all LSP servers are installed
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
            run_on_start = true,
        })

        -- Set up all the LSP servers using the language-specific config blocks above
        -- This automatically sets capabilities for each server
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = lsp_servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
