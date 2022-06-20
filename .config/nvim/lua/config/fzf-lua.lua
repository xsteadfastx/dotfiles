require("fzf-lua").setup {
	winopts = {
		fullscreen = true
	},
	files = {
		fd_opts = "--color=always --type f --hidden --no-ignore --follow --exclude .git"
	},
	grep = {
		rg_opts = "--no-ignore-vcs --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512"
	}
}
