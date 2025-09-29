require("conform").setup({
	log_level = vim.log.levels.DEBUG,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		go = { "gofumpt" },
		kotlin = { "ktfmt" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		sql = { "sqlfmt" },
        cs = { "csharpier" },
	},
})

local ktfmt = require("conform.formatters.ktfmt")
ktfmt.args = function()
	return { "--kotlinlang-style", "$FILENAME" }
end
ktfmt.stdin = false

local csharpier = require("conform.formatters.csharpier")
csharpier.args = function()
    return { "--stdin" }
end
csharpier.stdin = true

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Formatar arquivo", silent = true })
