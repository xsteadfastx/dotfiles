require("xsfx.helpers").create_augroups({
	gopass = {
		{
			"BufNewFile,BufRead",
			{ pattern = "/dev/shm/gopass.*", command = "setlocal noswapfile nobackup noundofile" },
		},
	},
})
