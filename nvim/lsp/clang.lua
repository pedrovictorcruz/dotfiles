return {
	name = "clang",
    cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
	filetypes = {
		"c",
        "cpp"
	},
	root_markers = { "compile_commands.json" },
}
