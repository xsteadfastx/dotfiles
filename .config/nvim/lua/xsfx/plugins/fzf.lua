-- all glory to fzf
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			{
				"junegunn/fzf",
				build = "./install --bin",
			},
		},
		keys = {
			{ "<Leader><space>", "<cmd>lua require('fzf-lua').buffers()<CR>" },
			{ "<Leader>tt", "<cmd>lua require('fzf-lua').tabs()<CR>" },
			{ "<Leader>ff", "<cmd>lua require('fzf-lua').files()<CR>" },
			{ "<Leader>rg", "<cmd>lua require('fzf-lua').grep_project()<CR>" },
			{ "<Leader>ll", "<cmd>lua require('fzf-lua').grep_curbuf()<CR>" },
			{ "<Leader>cm", "<cmd>lua require('fzf-lua').git_commits()<CR>" },
			{ "<Leader>cf", "<cmd>lua require('fzf-lua').git_bcommits()<CR>" },
			{ "<Leader>:", "<cmd>lua require('fzf-lua').commands()<CR>" },
			{ "<Leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>" },
		},
		config = function()
			require("fzf-lua").setup({
				winopts = {
					fullscreen = true,
				},
				files = {
					fd_opts = "--color=always --type f --hidden --no-ignore --follow --exclude .git --exclude vendor --exclude .cache --exclude .direnv",
				},
				grep = {
					rg_opts = "--no-ignore-vcs --hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!vendor/*' -g '!.git/*' -g '!.direnv/*'",
				},
			})
		end,
	},
}
