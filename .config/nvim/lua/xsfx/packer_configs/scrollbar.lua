require("xsfx.helpers").create_augroups({
	scrollbar = {
		{ "CursorMoved,VimResized,QuitPre", { pattern = "*", command = "silent! lua require('scrollbar').show()" } },
		{ "WinEnter,FocusGained", { pattern = "*", command = "silent! lua require('scrollbar').show()" } },
		{
			"WinLeave,BufLeave,BufWinLeave,FocusLost",
			{ pattern = "*", command = "silent! lua require('scrollbar').clear()" },
		},
	},
})

vim.g.scrollbar_shape = {
	head = "│",
	body = "│",
	tail = "│",
}
