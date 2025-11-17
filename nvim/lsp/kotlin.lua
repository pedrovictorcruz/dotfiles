return {
	name = "kotlin",
	cmd = { "kotlin-lsp", "--stdio" },
	filetypes = {
		"kotlin",
	},
	root_markers = { "build.gradle.kts", "settings.gradle.kts" },
}
