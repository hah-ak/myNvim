local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local u = require("null-ls.utils")
local eslint_d = null_ls.builtins.diagnostics.eslint_d.with({
  cwd = h.cache.by_bufnr(function (params)
    return u.root_pattern(
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.json"
    )(params.bufname)
  end),
})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.eslint_d,
    eslint_d
    -- null_ls.builtins.diagnostics.eslint_d
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.formatting.eslint_d
  }
}

-- local ok, _ = pcall(require, 'gitsigns')
-- if not ok then
--     print("not ok")
-- end
--
-- require('gitsigns').setup {
--   debug_mode = true,
--   signs = {
--     add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
--     change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--     delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--     topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--     changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--   },
--   signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
--   numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
--   linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
--   word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
--   watch_gitdir = {
--     interval = 1000,
--     follow_files = true
--   },
--   attach_to_untracked = true,
--   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
--   current_line_blame_opts = {
--     virt_text = true,
--     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--     delay = 1000,
--     ignore_whitespace = false,
--   },
--   -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
--   sign_priority = 6,
--   update_debounce = 100,
--   status_formatter = nil, -- Use default
--   max_file_length = 40000, -- Disable if file is longer than this (in lines)
--   preview_config = {
--     -- Options passed to nvim_open_win
--     border = 'single',
--     style = 'minimal',
--     relative = 'cursor',
--     row = 0,
--     col = 1
--   },
--   yadm = {
--     enable = false
--   },
--   on_attach = function(bufnr)
--     print("girsigns attact")
--     local gs = package.loaded.gitsigns
--
--     local function map(mode, l, r, opts)
--       opts = opts or {}
--       opts.buffer = bufnr
--       vim.keymap.set(mode, l, r, opts)
--     end
--
--     -- Navigation
--     map('n', ']c', function()
--       if vim.wo.diff then return ']c' end
--       vim.schedule(function() gs.next_hunk() end)
--       return '<Ignore>'
--     end, {expr=true})
--
--     map('n', '[c', function()
--       if vim.wo.diff then return '[c' end
--       vim.schedule(function() gs.prev_hunk() end)
--       return '<Ignore>'
--     end, {expr=true})
--
--     -- Actions
--     map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--     map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--     map('n', '<leader>hS', gs.stage_buffer)
--     map('n', '<leader>hu', gs.undo_stage_hunk)
--     map('n', '<leader>hR', gs.reset_buffer)
--     map('n', '<leader>hp', gs.preview_hunk)
--     map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--     map('n', '<leader>tb', gs.toggle_current_line_blame)
--     map('n', '<leader>hd', gs.diffthis)
--     map('n', '<leader>hD', function() gs.diffthis('~') end)
--     map('n', '<leader>td', gs.toggle_deleted)
--
--     -- Text object
--     map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--   end
-- }

local ok, vgit = pcall(require, "vgit")
if not ok then
  print("vgit error")
end
vgit.setup({
  keymaps = {
    ['n <C-k>'] = 'hunk_up',
    ['n <C-j>'] = 'hunk_down',
    ['n <leader>gs'] = 'buffer_hunk_stage',
    ['n <leader>gr'] = 'buffer_hunk_reset',
    ['n <leader>gp'] = 'buffer_hunk_preview',
    ['n <leader>gb'] = 'buffer_blame_preview',
    ['n <leader>gf'] = 'buffer_diff_preview',
    ['n <leader>gh'] = 'buffer_history_preview',
    ['n <leader>gu'] = 'buffer_reset',
    ['n <leader>gg'] = 'buffer_gutter_blame_preview',
    ['n <leader>glu'] = 'project_hunks_preview',
    ['n <leader>gls'] = 'project_hunks_staged_preview',
    ['n <leader>gd'] = 'project_diff_preview',
    ['n <leader>gq'] = 'project_hunks_qf',
    ['n <leader>gx'] = 'toggle_diff_preference',
  },
  settings = {
    git = {
      cmd = 'git', -- optional setting, not really required
      fallback_cwd = vim.fn.expand("$HOME"),
      fallback_args = {
        "--git-dir",
        vim.fn.expand("$HOME/dots/yadm-repo"),
        "--work-tree",
        vim.fn.expand("$HOME"),
      },
    },
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    },
    live_blame = {
      enabled = true,
      format = function(blame, git_config)
        local config_author = git_config['user.name']
        local author = blame.author
        if config_author == author then
          author = 'You'
        end
        local time = os.difftime(os.time(), blame.author_time)
          / (60 * 60 * 24 * 30 * 12)
        local time_divisions = {
          { 1, 'years' },
          { 12, 'months' },
          { 30, 'days' },
          { 24, 'hours' },
          { 60, 'minutes' },
          { 60, 'seconds' },
        }
        local counter = 1
        local time_division = time_divisions[counter]
        local time_boundary = time_division[1]
        local time_postfix = time_division[2]
        while time < 1 and counter ~= #time_divisions do
          time_division = time_divisions[counter]
          time_boundary = time_division[1]
          time_postfix = time_division[2]
          time = time * time_boundary
          counter = counter + 1
        end
        local commit_message = blame.commit_message
        if not blame.committed then
          author = 'You'
          commit_message = 'Uncommitted changes'
          return string.format(' %s • %s', author, commit_message)
        end
        local max_commit_message_length = 255
        if #commit_message > max_commit_message_length then
          commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
        end
        return string.format(
          ' %s, %s • %s',
          author,
          string.format(
            '%s %s ago',
            time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
            time_postfix
          ),
          commit_message
        )
      end,
    },
    live_gutter = {
      enabled = true,
      edge_navigation = true, -- This allows users to navigate within a hunk
    },
    authorship_code_lens = {
      enabled = true,
    },
    scene = {
      diff_preference = 'unified',
    },
    diff_preview = {
      keymaps = {
        buffer_stage = 'S',
        buffer_unstage = 'U',
        buffer_hunk_stage = 's',
        buffer_hunk_unstage = 'u',
        toggle_view = 't',
      },
    },
    project_diff_preview = {
      keymaps = {
        buffer_stage = 's',
        buffer_unstage = 'u',
        buffer_hunk_stage = 'gs',
        buffer_hunk_unstage = 'gu',
        buffer_reset = 'r',
        stage_all = 'S',
        unstage_all = 'U',
        reset_all = 'R',
      },
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAddLn = {
          linehl = 'GitSignsAddLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsDeleteLn = {
          linehl = 'GitSignsDeleteLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsAdd = {
          texthl = 'GitSignsAdd',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsDelete = {
          texthl = 'GitSignsDelete',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsChange = {
          texthl = 'GitSignsChange',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
      },
      usage = {
        screen = {
          add = 'GitSignsAddLn',
          remove = 'GitSignsDeleteLn',
        },
        main = {
          add = 'GitSignsAdd',
          remove = 'GitSignsDelete',
          change = 'GitSignsChange',
        },
      },
    },
    symbols = {
      void = '⣿',
    },
  }
})
