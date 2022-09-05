vim.api.nvim_command('colorscheme tokyonight')
vim.api.nvim_command('set smartindent')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set number')


vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

---WORKAROUND
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
    end
})
---ENDWORKAROUND

local ok, _ = pcall(require, "utils")
local util = require("utils")
local map = util.map
require("nvim-tree").setup({
    diagnostics = {
        enable = true,
    },
    git = {
        ignore = false
    }
})
map("n", "<C-`>", "<Cmd>NvimTreeToggle<CR>", { silent = true })
map("n", "<C-1>", "<Cmd>NvimTreeFindFile<CR>", { silent = true })

map("n", "<space>f", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", {silent = true})
map("v", "<space>c", "y/<C-r>0<CR>cgn", { silent = false })
