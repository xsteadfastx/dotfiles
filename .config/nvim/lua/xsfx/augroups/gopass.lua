require("xsfx.helpers").create_augroups(
	{ gopass = { { "BufNewFile,BufRead", "/dev/shm/gopass.*", "setlocal noswapfile nobackup noundofile" } } }
)
