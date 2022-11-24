local exportFunctions = {}

function exportFunctions.map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local openWinConfig = {
	relative = "cursor",
	width = 50,
	height = 10,
	row = 0,
	col = 0,
	style = "minimal",
	border = "single",
	anchor = "NW",
}

function exportFunctions.createFloatBuffer(texts)
	print(texts)
	local isClose = (function()
		local result = false
		local bufs = vim.api.nvim_list_bufs()
		for _, curBuf in ipairs(bufs) do
			if string.find(vim.api.nvim_buf_get_name(curBuf), "_createFloatBuffer") then
				vim.api.nvim_win_close(vim.fn.bufwinid(curBuf), true)
				vim.api.nvim_buf_delete(curBuf, { force = true })
				result = true
				break
			end
		end
		return result
	end)()

	if not isClose then
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, 0, 8, texts)
		print(buf)
		for index, value in ipairs(vim.api.nvim_list_bufs()) do
			print(value)
		end
		vim.api.nvim_buf_set_name(buf, "_createFloatBuffer")
		vim.api.nvim_open_win(buf, true, openWinConfig)
	end
end

function exportFunctions.test()
	print("aaa")
end

return exportFunctions
