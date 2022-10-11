require("telescope").setup {
	defaults = {
        -- config_key = value
		mappings = {
			i = {
				-- e.g. git_{create, delete}_branch for the git_brnach
				["<C-h>"] = "which_key"
				}
			}
		},
	pickers = {},

  	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
			-- even more opts
			},
        fzf = {
            fuzzy = true,
            override_genric_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
            }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")

local ok, utils = pcall(require, "utils")
local map = utils.map
local opts = {silent = true, noremap = true}

map('n', '<leader>ff', '<Cmd>Telescope find_files<cr>',opts)
map('n', '<leader>fg', '<Cmd>Telescope live_grep<cr>',opts)
map('n', '<leader>fb', '<Cmd>Telescope buffers<cr>',opts)
map('n', '<leader>fh', '<Cmd>Telescope help_tags<cr>',opts)
