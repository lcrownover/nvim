-- leader, must come before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font
vim.g.have_nerd_font = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- mouse
vim.opt.mouse = "a"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- don't show the mode, it's already in the statusline
vim.opt.showmode = false

-- no startup message
vim.opt.shortmess:append({ I = true })

-- disable netrw - this needs to be set super early in the config
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- conceal links like in markdown
vim.g.conceallevel = 2

-- updatetime - how many milliseconds until the swap file is written
vim.opt.updatetime = 250

-- timeoutlen - how many milliseconds until a keybinding times out
vim.opt.timeoutlen = 1000

-- undofile - save undo history
vim.opt.undofile = true

-- cursorline - highlight the current line
vim.opt.cursorline = true

-- colorcolumn - highlight columns
vim.opt.colorcolumn = "80,120"

-- listchars - representation of whitespace characters
vim.opt.listchars:append({ tab = "├─", trail = "·", eol = "↲", nbsp = "␣" })

-- preview substitutions as you write
vim.opt.inccommand = "split"

-- wrap - wrap lines
vim.opt.wrap = false

-- scrolloff - how many lines to keep above and below the cursor
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- signcolumn - always show the sign column
vim.opt.signcolumn = "yes"

-- errorbells - turn that shit off
vim.opt.errorbells = false

-- searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- default formatting
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""

local default_lsp_config = { inlay_hints = { enabled = false } }
local languages = {
    lua = {
        lsp = {
            config = vim.tbl_deep_extend("force", default_lsp_config, {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            disable = { "missing-fields" },
                            globals = { "vim", "Format", "Snacks", "ToggleWhitespaceVisibility" },
                        },
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
                    },
                },
            }),
            server = "lua_ls",
        },
        linter = { "luacheck" },
        formatter = { "stylua" },
        tools = {
            "lua-language-server",
            -- "luacheck", installed with "brew install luacheck" due to deps issues
            "stylua",
        },
    },
    sh = {
        lsp = {
            config = default_lsp_config,
            server = "bashls",
        },
        linter = { "shellcheck" },
        formatter = { "shfmt" },
        tools = {
            "bash-language-server",
            "shellcheck",
            "shfmt",
        },
    },
    python = {
        lsp = {
            config = default_lsp_config,
            server = "basedpyright",
        },
        linter = { "ruff" },
        formatter = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
        tools = {
            "basedpyright",
            "isort",
            "black",
            "ruff",
            "mypy",
        },
    },
    go = {
        lsp = {
            config = vim.tbl_deep_extend("force", default_lsp_config, {
                settings = {
                    gopls = {
                        staticcheck = true,
                        -- buildFlags = { "-tags=2411" },
                    },
                },
            }),
            server = "gopls",
        },
        linter = {},
        formatter = { "goimports", "gofmt" },
        tools = {
            "gopls",
        },
    },
    markdown = {
        lsp = {
            config = default_lsp_config,
            server = "marksman",
        },
        linter = { "vale" },
        formatter = { "markdownlint", "prettier" },
        tools = {
            "marksman",
            "markdownlint",
            "vale",
        },
    },
    rust = {
        lsp = {
            config = vim.tbl_deep_extend("force", default_lsp_config, {
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            }),
            server = "rust_analyzer",
        },
        linter = {},
        formatter = {},
        tools = {
            "rust-analyzer",
        },
    },
    terraform = {
        lsp = {
            config = default_lsp_config,
            server = "terraformls",
        },
        linter = {},
        formatter = {},
        tools = {
            "terraform-ls",
        },
    },
    yaml = {
        lsp = {
            config = default_lsp_config,
            server = "",
        },
        linter = { "yamllint" },
        formatter = { "yamlfix" },
        tools = {
            "yamllint",
            "yamlfix",
        },
    },
    json = {
        lsp = {
            config = default_lsp_config,
            server = "",
        },
        linter = { "yamllint" },
        formatter = { "prettier" },
        tools = {
            "prettier",
            "prettierd",
        },
    },
    html = {
        lsp = {
            config = default_lsp_config,
            server = "html",
        },
        linter = {},
        formatter = {},
        tools = {
            "html-lsp",
        },
    },
    svelte = {
        lsp = {
            config = default_lsp_config,
            server = "svelte",
        },
        linter = {},
        formatter = {},
        tools = {
            "svelte-language-server",
        },
    },
    typescript = {
        lsp = {
            config = default_lsp_config,
            server = "ts_ls",
        },
        linter = {},
        formatter = {},
        tools = {
            "typescript-language-server",
        },
    },
}
local gh = "https://github.com/"

-- treesitter and auto-installer
-- vim.pack.add({ gh .. 'nvim-treesitter/playground' })
vim.pack.add({ { src = gh .. "nvim-treesitter/nvim-treesitter", version = "main" } })
local ts = require("nvim-treesitter")
local available_langauges = ts.get_available()
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local ft = vim.bo.filetype
        for _, al in ipairs(available_langauges) do
            if ft == al then
                ts.install(ft)
                vim.treesitter.start()
            end
        end
    end
})

-- Any build hooks get defined here
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local name = event.data.spec.name
        local kind = event.data.kind

        if name == "blink.cmp" and (kind == "install" or kind == "update") then
            vim.system({ "cargo", "build", "--release" }, { cwd = event.data.path }):wait()
        end

        ts.update()
    end,
})

-- dependencies
vim.pack.add({
    gh .. "nvim-tree/nvim-web-devicons",
    gh .. "echasnovski/mini.icons",
    gh .. "nvim-lua/plenary.nvim",
    gh .. "ray-x/guihua.lua",
    gh .. "j-hui/fidget.nvim",
    gh .. "MunifTanjim/nui.nvim",
    gh .. "rafamadriz/friendly-snippets",
})

-- theme
local theme = "sonokai"
vim.pack.add({ gh .. "sainnhe/sonokai" })
vim.cmd.colorscheme(theme)

-- tmux vim integration
vim.pack.add({ gh .. "christoomey/vim-tmux-navigator" })

-- some sane defaults from folke
vim.pack.add({ gh .. "folke/snacks.nvim" })
local snacks = require("snacks")
snacks.setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = {
        enabled = true,
        animate = {
            enabled = false,
        },
    },
    input = { enabled = false },
    notifier = {
        enabled = true,
        timeout = 3000,
    },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    picker = { enabled = true },
})
-- git pickers
vim.keymap.set("n", "<leader>gb", function() snacks.git.blame_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gf", function() snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
vim.keymap.set("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gl", function() snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
-- pickers
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.smart() end, { desc = "Smart Find files" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Find grep" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics() end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>f;", function() Snacks.picker.resume() end, { desc = "Find resume" })
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fa", function() Snacks.picker.autocmds() end, { desc = "Find autocommands" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.highlights() end, { desc = "Find colors (highlights)" })
vim.keymap.set("n", "<leader>fl", function() Snacks.picker.git_log() end, { desc = "Find git commits" })
-- notifications pickers
vim.keymap.set("n", "<c-q>", function() Snacks.notifier.hide() end, { desc = "Hide Notifications" })
vim.keymap.set("n", "<leader>nn", function() Snacks.notifier.show_history() end, { desc = "Notification History" })

-- blazingly fast searching
vim.pack.add({ gh .. "ibhagwan/fzf-lua" })
local fzf = require("fzf-lua")
fzf.setup({
    fzf_colors = true,
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

-- autocomplete entries
vim.pack.add({ { src = gh .. "saghen/blink.cmp", version = "v1" } })
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        require("blink.cmp").setup({
            keymap = { preset = "default" },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                documentation = { auto_show = false },
                -- list = {
                --   selection = {
                --     preselect = function(_)
                --       return not require("blink.cmp").snippet_active({ direction = 1 })
                --     end,
                --   },
                -- },
                menu = {
                    draw = {
                        components = {
                            label_description = {
                                text = function(ctx)
                                    return ctx.label_description ~= "" and ctx.label_description or ctx.item.detail
                                end,
                            },
                        },
                    },
                },
            },
            opts_extend = { "sources.default" },
        })
    end,
})

-- gutter signs for git
vim.pack.add({ gh .. "lewis6991/gitsigns.nvim" })
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

-- lua status line
vim.pack.add({ gh .. "nvim-lualine/lualine.nvim" })
require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = "",
        theme = theme,
    },
})

-- bootstrap LSP servers
vim.pack.add({ gh .. "neovim/nvim-lspconfig" })
for _, config in pairs(languages) do
    vim.lsp.config(config.lsp.server, config.lsp.config)
    vim.lsp.enable(config.lsp.server)
end

-- mason installs binaries for me
vim.pack.add({ gh .. "WhoIsSethDaniel/mason-tool-installer.nvim" })
vim.pack.add({ gh .. "williamboman/mason.nvim" })
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
local tools = {}
for _, config in pairs(languages) do
    for _, c in ipairs(config) do
        if c.tools ~= nil then
            for _, t in c.tools do
                table.insert(tools, t)
            end
        end
    end
end
require("mason-tool-installer").setup({
    ensure_installed = tools,
    run_on_start = true,
})

-- i like a file tree, sue me
vim.pack.add({ { src = gh .. "nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") } })
require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        width = 50,
        position = "right",
        mappings = {
            ["<C-b>"] = false,
            ["<C-f>"] = false,
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
})
vim.keymap.set("n", "<c-b>", ":Neotree toggle<CR>", { silent = true, desc = "Toggle neo-tree" })
vim.keymap.set("n", "<leader>b", ":Neotree reveal<CR>", { silent = true, desc = "Reveal active file with neo-tree" })

-- fancy golang integration
-- vim.pack.add({ gh .. "ray-x/go.nvim" })
-- require("go").setup({
--     lsp_inlay_hints = { enable = false },
-- })

-- highlights comments with colors and stuff
vim.pack.add({ gh .. "folke/todo-comments.nvim" })
require("todo-comments").setup()

-- git integration with vim, don't use this too much
vim.pack.add({ gh .. "tpope/vim-fugitive" })
vim.keymap.set("n", "<leader>gs", ":Git<cr>", { desc = "Git: Status" })
vim.keymap.set("n", "<leader>gp", ":Git pull<cr>", { desc = "Git: Pull" })
vim.keymap.set("n", "<leader>gP", ":Git push<cr>", { desc = "Git: Push" })
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { desc = "Git: Blame" })
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<cr>", { desc = "Git: diffsplit" })
vim.keymap.set("n", "<leader>gh", ":diffget //2<cr>", { desc = "Git: diffget left" })
vim.keymap.set("n", "<leader>gl", ":diffget //3<cr>", { desc = "Git: diffget right" })

-- uv integration for python stuff
vim.pack.add({ gh .. "benomahony/uv.nvim" })
require("uv").setup({ picker_integration = true })

-- love trouble, quickfixlist for diagnostics
vim.pack.add({ gh .. "folke/trouble.nvim" })
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics" })

-- quality of life for qfl
vim.pack.add({ gh .. "stevearc/quicker.nvim" })
require("quicker").setup({
    keys = {
        {
            ">",
            function()
                require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
        },
        {
            "<",
            function()
                require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
        },
    },
})
vim.keymap.set("n", "<leader>q", function()
    require("quicker").toggle()
end, { desc = "Toggle quickfix" })

-- creating matching tags automatically
vim.pack.add({ gh .. "windwp/nvim-ts-autotag" })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
    callback = function()
        require("nvim-ts-autotag").setup()
    end,
})

-- shortcuts for adjusting surrounds
vim.pack.add({ gh .. "kylechui/nvim-surround" })

-- lint my stuff
vim.pack.add({ gh .. "mfussenegger/nvim-lint" })
vim.api.nvim_create_autocmd("BufRead", {
    callback = function()
        local lint = require("lint")

        lint.linters.luacheck = vim.tbl_deep_extend("force", lint.linters.luacheck, {
            cmd = "luacheck",
            args = { "--formatter", "plain", "--codes", "--ranges", "--globals", "vim", "-" },
        })

        lint.linters_by_ft = {
            yaml = languages.yaml.linter,
            python = languages.python.linter,
            lua = languages.lua.linter,
            sh = languages.sh.linter,
            bash = languages.sh.linter,
            zsh = languages.sh.linter,
            markdown = languages.markdown.linter,
        }

        vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
})

-- format my stuff
vim.pack.add({ gh .. "stevearc/conform.nvim" })
local conform = require("conform")
conform.setup({
    default_format_opts = {
        lsp_format = "prefer",
    },
    formatters_by_ft = {
        lua = languages.lua.formatter,
        python = languages.python.formatter,
        sh = languages.sh.formatter,
        markdown = languages.markdown.formatter,
        yaml = languages.yaml.formatter,
        go = languages.go.formatter,
        json = languages.json.formatter,
        ["_"] = { "trim_whitespace" },
    },
})
vim.keymap.set("n", "<leader>fs", function() conform.format({ async = true }) end,
    { desc = "LSP Format", silent = true })

-- auto pairs of brackets, etc
vim.pack.add({ gh .. "windwp/nvim-autopairs" })
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        require("nvim-autopairs").setup()
    end,
})

-- hex codes highlight to their colors
vim.pack.add({ gh .. "brenoprata10/nvim-highlight-colors" })
require("nvim-highlight-colors").setup()

-- this flashes the current selection when I yank it
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({})
    end,
})

-- this will toggle the visibility of whitespace characters
function ToggleWhitespaceVisibility()
    vim.opt.list = not vim.opt.list:get()
end

-- nice function for recursively printing tables in lua
function Tprint(tbl, indent)
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            Tprint(v, indent + 1)
        else
            print(formatting .. tostring(v))
        end
    end
end

-- wipe the quickfixlist
function ClearQuickfixList()
    vim.cmd([[call setqflist([])]])
end

-- centering screen on next find results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clear hl on esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- better joining
vim.keymap.set("n", "J", "mzJ`z")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- keep visual mode after indenting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- break undo sequence after punctuation
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- splits
vim.keymap.set("n", "<c-w>-", ":split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<c-w>\\", ":vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<c-w>w", ":close<cr>", { desc = "Close split" })

-- toggle showing of whitespace characters
vim.keymap.set("n", "<leader>sw", ToggleWhitespaceVisibility, { desc = "Toggle whitespace visibility" })

-- close buffer
vim.keymap.set("n", "<leader>w", ":bd<cr>", { desc = "Close buffer" })

-- VSCode
-- vim.keymap.set("n", "<leader>cc", ":!code .<cr>", { silent = true, desc = "Open VSCode here" })

-- Find/Replace
vim.keymap.set("n", "<leader>r", 'viw"ry:%s/<C-r>r/', { desc = "Find word and replace" })
vim.keymap.set("x", "<leader>r", '"ry:%s/<C-r>r/', { desc = "Find word and replace" })

-- LSP specific keybinds
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "LSP: Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "LSP: Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "LSP: Goto References" })
-- vim.keymap.set('n', "gi", fzf.lsp_implementations, { desc = "LSP: Goto Implementations" })
vim.keymap.set('n', "<leader>ls", fzf.lsp_document_symbols, { desc = "LSP: Document Symbols" })
vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>", { desc = "LSP: Restart LSP server" })
vim.keymap.set("n", "<leader>li", ":LspInfo<cr>", { desc = "LSP: Show LSP info" })
vim.keymap.set("n", "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "LSP: Toggle LSP inlay hints" })
vim.keymap.set("n", "gn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

-- Copilot
-- vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { desc = "Copilot Enable" })
-- vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { desc = "Copilot Disable" })
