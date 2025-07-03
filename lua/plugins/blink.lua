return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  opts = {
    keymap = { preset = "default" },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = { auto_show = false },
      list = {
        selection = {
          preselect = function(_)
            return not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
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
  },
  opts_extend = { "sources.default" },
}
