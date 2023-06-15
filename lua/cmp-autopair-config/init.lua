local autopair = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "nvim_lsp_signature_help" },
  }, {
    { name = "buffer" },
  }),
  preselect = cmp.PreselectMode.None,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 25
    })
  }
})
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

vim.cmd(
  "autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })"
)
-- vim.api.nvim_create_autocmd({'BufEnter',"BufWinEnter"},{
-- pattern = {'*.sql','*.mysql'},
-- callback = function ()
-- print(vim.bo.filetype)
-- require('cmp').setup.buffer({sources = {{name = 'vim-dadbod-completion'}}})
-- end
-- })

autopair.setup({})
require("luasnip.loaders.from_vscode").lazy_load()
