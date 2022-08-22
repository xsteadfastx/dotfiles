require("xsfx.helpers").create_augroups({
	scrollbar = {
		{ "CursorMoved,VimResized,QuitPre", "*", "silent! lua require('scrollbar').show()" },
		{ "WinEnter,FocusGained", "*", "silent! lua require('scrollbar').show()" },
		{ "WinLeave,BufLeave,BufWinLeave,FocusLost", "*", "silent! lua require('scrollbar').clear()" },
	},
})

vim.g.scrollbar_shape = {
	head = "│",
	body = "│",
	tail = "│",
}
