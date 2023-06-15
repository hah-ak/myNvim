local util = require("utils")
local map = util.map
local opts = { silent = true, noremap = true }

map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<A-c>", "<Cmd>confirm BufferClose<CR>", opts)

map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

vim.g.barbar_auto_setup = false
local uioptions = {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closeable = true,
  clickable = true,
  icons = {
    filetype = {
      custome_colors = false,
      enabled = true
    },
    separator = {left = "▎", right = ''},
    inactive = {button = ""},
    modified = {button = "●"},
    pinned = {button = "車"},
  },
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  no_name_title = nil,
}

require("bufferline").setup({})
