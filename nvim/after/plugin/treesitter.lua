require("nvim-treesitter.configs").setup({
	ensure_installed = {
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
	},
    auto_install = true,
    ignore_install = {},
    modules = {},
	sync_install = false,
	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},

})

vim.filetype.add({
  extension = {
    vert = "glsl",
    frag = "glsl",
  },
})
