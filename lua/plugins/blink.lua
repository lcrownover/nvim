return {
	'saghen/blink.cmp',
	event = "InsertEnter",
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	opts = {
		keymap = { preset = 'default' },

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
	},
	opts_extend = { "sources.default" }
}
