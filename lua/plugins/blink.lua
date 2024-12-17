return {
    'saghen/blink.cmp',
    lazy = false,
    event = "InsertEnter",
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
        keymap = {
            preset = 'enter',
            ['<c-k>'] = { "select_prev", 'fallback' },
            ['<c-j>'] = { "select_next", 'fallback' },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    opts_extend = { "sources.default" }
}