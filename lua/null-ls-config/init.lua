local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local u = require("null-ls.utils")
local eslint_d = null_ls.builtins.diagnostics.eslint_d.with({
  cwd = h.cache.by_bufnr(function(params)
    return u.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json")(params.bufname)
  end),
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.prettier,
    -- eslint_d,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.diagnostics.eslint_d
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.formatting.eslint_d
  },
})
