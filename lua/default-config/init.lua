vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[set nohidden]])
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = "yes"
vim.o.shiftwidth = 2
vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

---WORKAROUND
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--     group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--     callback = function()
--         vim.opt.foldmethod = 'expr'
--         vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
--     end
-- })
---ENDWORKAROUND

local ok, util = pcall(require, "utils")
local map = util.map
require("nvim-tree").setup({
    hijack_netrw = false,
    diagnostics = {
        enable = true,
    },
    git = {
        ignore = false,
    },
})
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("not ok")
end

gitsigns.setup({
    current_line_blame = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        map("n", "<space>gs", "<Cmd>Gitsigns<CR>", { silent = true })
    end,
})

map("n", "<space>tt", "<Cmd>NvimTreeToggle<CR>", { silent = true })
map("n", "<space>tf", "<Cmd>NvimTreeFindFile<CR>", { silent = true })

map("n", "<space>f", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", { silent = true })
map("v", "<space>c", "yh/<C-r>0<CR>cgn", { silent = false })

map("n", "<space>db", "<Cmd>DBUIToggle<CR>", { silent = true })
