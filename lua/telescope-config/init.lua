local telescope = require("telescope")
local rtnMap = {
  texts = { "' exact", "^ is prefix", "$ suffix", "! not include", "!^ do not start", "!abc$ do not end" },
}
local config = {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-g>"] = {
          "<cmd>lua require('lua.utils').createFloatBuffer(require('lua.telescope-config.init').texts)<CR>",
          type = "command",
          opts = { silent = true },
        },
      },
    },
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_genric_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}
telescope.setup(config)

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("dap")

local ok, utils = pcall(require, "utils")
local map = utils.map
local opts = { silent = true, noremap = true }

map("n", "<leader>ff", "<Cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<Cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<Cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<Cmd>Telescope help_tags<cr>", opts)

return rtnMap
