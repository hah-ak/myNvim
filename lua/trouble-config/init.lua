local ok, trouble = pcall(require, "trouble")
local ok, utils = pcall(require, "utils")
local map = utils.map
local opts = { silent = true, noremap = true }
trouble.setup({})
map("n", "<space>trt", "<cmd>TroubleToggle<cr>", opts)
map("n", "<space>trw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<space>trd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<space>trl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<space>trq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "<space>trh", "<cmd>TroubleToggle lsp_references<cr>", opts)
