return {
	name = "clang",
    cmd = {'clangd', '--background-index', '--clang-tidy'},
	filetypes = {
		"c",
        "cpp"
	},
	root_markers = { "./build/compile_commands.json" },
}
