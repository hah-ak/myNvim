require("mason").setup()
require('mason-lspconfig').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require('lspconfig')
local jts_lsp_config = {
    -- flags = {
    --     debounce_text_changes = 150,
    -- },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      capabilities
    ),
    on_attach = function(client, bufnr)
        vim.api.nvim_exec_autocmds('User',{pattern = 'LspAttached'})
    end,
    -- default_config = {
    --     root_dir=lspconfig.util.find_json_ancestor    
    -- }
}

-- nvim_lsp.util.default_config = vim.tbl_deep_extend('force',nvim_lsp.util.default_config,lsp_default)

require('rust-tools').setup()
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
lspconfig.tsserver.setup(jts_lsp_config)
-- lspconfig.eslint.setup(jts_lsp_config)
lspconfig.pyright.setup({})
lspconfig.clangd.setup({})
-- vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
