require("fzf-lua").setup({
	winopts = {
		fullscreen = true,
	},
	files = {
		fd_opts = "--color=always --type f --hidden --no-ignore --follow --exclude .git --exclude vendor --exclude .cache",
	},
	grep = {
		rg_opts = "--no-ignore-vcs --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!vendor/*' -g '!.git/*'",
	},
})
