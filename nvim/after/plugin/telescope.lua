local builtin = require('telescope.builtin')
local entry_display = require('telescope.pickers.entry_display')

local function tail_path(path, max_len)
    max_len = max_len or 60
    if #path <= max_len then
        return path
    end

    return '...' .. path:sub(-(max_len - 3))
end

local function result_path_len(with_position)
    local len = math.floor(vim.o.columns * 0.42) - 2
    if with_position then
        len = len - 12
    end

    if len < 20 then
        len = 20
    end

    return len
end

local function split_dir_and_file(path)
    local dir, file = path:match('^(.*[/\\])(.-)$')
    if not dir then
        return '', path
    end

    return dir, file
end

local find_files_displayer = entry_display.create({
    separator = '',
    items = {
        { remaining = true },
        { remaining = true },
    },
})

local live_grep_displayer = entry_display.create({
    separator = '',
    items = {
        { width = 10 },
        { remaining = true },
        { remaining = true },
    },
})

local function find_files_faded_path(line)
    if not line or line == '' then
        return nil
    end

    local relative_path = vim.fn.fnamemodify(line, ':.')
    local display_path = tail_path(relative_path, result_path_len(false))
    local dir, file = split_dir_and_file(display_path)

    return {
        value = line,
        ordinal = line,
        filename = line,
        path = line,
        display = function()
            return find_files_displayer({
                { dir, 'TelescopeResultsComment' },
                file,
            })
        end,
    }
end

local function live_grep_without_match_text(line)
    local filename, lnum, col = line:match('^(.-):(%d+):(%d+):')
    if not filename or not lnum or not col then
        return nil
    end

    lnum = tonumber(lnum)
    col = tonumber(col)

    local position = string.format('%d:%d', lnum, col)
    local relative_path = vim.fn.fnamemodify(filename, ':.')
    local display_path = tail_path(relative_path, result_path_len(true))
    local dir, file = split_dir_and_file(display_path)

    return {
        value = line,
        ordinal = line,
        filename = filename,
        path = filename,
        lnum = lnum,
        col = col,
        display = function()
            return live_grep_displayer({
                { string.format('%-10s', position), 'TelescopeResultsLineNr' },
                { dir, 'TelescopeResultsComment' },
                file,
            })
        end,
    }
end

require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = "> ",
        color_devicons = false,
        path_display = function(_, path)
            return tail_path(path, result_path_len(false))
        end,
        prompt_title = "",
        results_title = false,
        preview_title = false,
        dynamic_preview_title = false,
        layout_strategy = "horizontal",
        layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            width = 0.9,
            height = 0.85,
            horizontal = {
                preview_width = 0.5,
            },
        },
        borderchars = {
            prompt = { "─", "│", "─", "│", "┌", "┐", "┤", "├" },
            results = { " ", "│", "─", "│", "│", "│", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
    },
    pickers = {
        find_files = {
            disable_devicons = true,
            entry_maker = find_files_faded_path,
        },
        live_grep = {
            entry_maker = live_grep_without_match_text,
        },
        buffers = {
            disable_devicons = true,
        },
    },
    extensions = {
        fzf = {
            case_mode = 'smart_case',
        }
    }
})

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>ls", function()
  builtin.lsp_document_symbols()
end, { })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>en', function ()
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end)
