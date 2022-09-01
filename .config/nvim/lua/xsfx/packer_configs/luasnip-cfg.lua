local ls = require("luasnip")

ls.setup({})

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("go", {
	ls.parser.parse_snippet(
		"tdd",
		'func Test$1(t *testing.T) {\n\ttables := []struct{\n\t\tname\tstring\n\t\t$2\n\t}{\n\t\t{\n\t\t\tname: "$3",\n\t\t\t$4\n\t\t},\n\t}\n\tfor _, tt := range tables {\n\t\ttt := tt\n\t\tt.Run(tt.name, func(t *testing.T) {\n\t\t\t$0\n\t\t})\n\t}\n}'
	),
})
