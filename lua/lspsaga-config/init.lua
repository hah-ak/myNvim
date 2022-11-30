local ok, utils = pcall(require, "utils")
local ok, saga = pcall(require, "lspsaga")
local ok, wk = pcall(require, "which-key")
local keymap = vim.keymap.set

saga.init_lsp_saga({})

-- wk.register({
--   s = {
--     name="lspsaga",
--     h = {"<cmd>Lspsaga lsp_finder<CR>", "lsp finder"}
--   }
-- }, { prefix = "<leader>"})
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "<leader>sh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>sa", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>sr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview
keymap("n", "<leader>sD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>ssd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>ssD", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<leader>sew", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<leader>sed", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "<leader>sEd", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "<leader>sEw", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n", "<leader>so", "<cmd>LSoutlineToggle<CR>", { silent = true })

-- Hover Doc
keymap("n", "<leader>sd", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- float terminal also you can pass the cli command in open_float_terminal function
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
keymap("n", "<A-f>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
