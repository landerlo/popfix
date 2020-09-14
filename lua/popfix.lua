local api = vim.api
local function open_window()
	local buf = api.nvim_create_buf(false, true)

	api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	local width = api.nvim_get_option("columns")
	local height = api.nvim_get_option("lines")

	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)

	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}

	-- and finally create it with buffer attached
	local win = api.nvim_open_win(buf, true, opts)
	local ret = {}
	ret[1] = buf;
	ret[2] = win;
	return ret
end

local function popup_window()
	local newWindow = open_window()
	print(newWindow[2])
end

return{
	popup_window = popup_window
}