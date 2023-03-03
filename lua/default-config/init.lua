vim.o.background = "dark"
vim.cmd([[colorscheme nightfox]])
vim.o.smartindent = true
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = "yes"
vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.o.hidden = true

vim.cmd([[autocmd FileType * set expandtab shiftwidth=2 tabstop=4 softtabstop=4]])

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

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "NvimTree" then
            require("bufferline.api").set_offset(31, "FileTree")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.expand("<afile>"):match("NvimTree") then
            require("bufferline.api").set_offset(0)
        end
    end,
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

require("which-key").setup({})

map("n", "<space>ntt", "<Cmd>NvimTreeToggle<CR>", { silent = true })
map("n", "<space>ntf", "<Cmd>NvimTreeFindFile<CR>", { silent = true })

map("n", "<space>f", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", { silent = true })
map("v", "<space>c", "yh/<C-r>0<CR>cgn", { silent = false })

map("n", "<space>db", "<Cmd>DBUIToggle<CR>", { silent = true })
