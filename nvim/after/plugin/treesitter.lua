require'nvim-treesitter'.install { 
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "cpp",
    "javascript",
    "typescript",
    "python",
    "kotlin",
    "java",
    "css",
    "json",
    "make",
    "sql",
    "terraform",
    "toml",
    "yaml",
}

vim.filetype.add({
  extension = {
    vert = "glsl",
    frag = "glsl",
  },
})
