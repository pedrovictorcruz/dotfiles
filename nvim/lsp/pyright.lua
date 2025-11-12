return {
	name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
	filetypes = {
		"python",
	},
	root_markers = { 
        ".venv/",
        "pyproject.toml",
        "setup.cfg",
        "setup.py",
        "Pipfile",
        "requirements.txt",
        "pyrightconfig.json",
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", 
                typeCheckingMode = "basic", 
            },
        },
    },
}
