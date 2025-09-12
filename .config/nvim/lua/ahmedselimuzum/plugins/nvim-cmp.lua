return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "micangl/cmp-vimtex"
  },

  config = function()
    local cmp = require'cmp'
--     local luasnip = require("luasnip")
--
--     require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),

      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
        { name = 'buffer' },
      })
    })

  end

}
-- return {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     "neovim/nvim-lspconfig",
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "hrsh7th/cmp-nvim-lua",
--     "hrsh7th/nvim-cmp",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--     "rafamadriz/friendly-snippets",
--     "micangl/cmp-vimtex"
--   },
--
--   config = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--
--     require("luasnip.loaders.from_vscode").lazy_load()
--
--     cmp.setup({
--       completion = {
--         completeopt = "menu,menuone,preview,noselect"
--       },
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       }),
--       sources = cmp.config.sources({
--         { name = 'path' },
--         { name = 'nvim_lsp' },
--         { name = 'vimtex', },
--         { name = 'luasnip' },
--         { name = 'nvim_lua' }
--       }, {
--         { name = 'buffer' },
--       }),
--
--     })
--   end
-- }
