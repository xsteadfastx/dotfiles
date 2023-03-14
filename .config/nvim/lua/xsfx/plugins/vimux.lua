-- easily interact with tmux from vim
-- with plugin to run go tests in tmux
return {
	{
		"preservim/vimux",
		dependencies = { "benmills/vimux-golang" },
		keys = {
			{ "<Leader>mt",  ':call VimuxRunCommand("clear; task test")<CR>' },
			{ "<Leader>ml",  ':call VimuxRunCommand("clear; task lint")<CR>' },
			{ "<Leader>mtv", ':call VimuxRunCommand("clear; task tidy")<CR>' },
			{ "<Leader>vp",  ":VimuxPromptCommand<CR>" },
			{ "<Leader>va",  ":VimuxRunLastCommand<CR>" },
			{ "<Leader>vq",  ":VimuxCloseRunner<CR>" },
			{ "<Leader>vo",  ":VimuxOpenRunner<CR>" },
			{ "<Leader>vz",  ":VimuxZoomRunner<CR>" },
		},
	},
}
