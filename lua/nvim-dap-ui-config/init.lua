local dap, dapui = require("dap"), require("dapui")
local utils = require("utils")
local map = utils.map
local opts = { silent = true, noremap = true }

dapui.setup({
  icons = { expanded = "", collapsed = "", current_frame = "" },
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

map("n", "<space>de", "<Cmd>lua require'dapui'.toggle({reset=true})<CR>", opts)
map("n", "<F3>", "<Cmd>lua require'dap'.close()<CR>", opts)
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F8>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F9>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F10>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
