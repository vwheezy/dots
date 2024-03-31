local Plugin = { 'nvim-lualine/lualine.nvim' }
Plugin.dependencies = { 'nvim-tree/nvim-web-devicons' }

Plugin.event = 'VeryLazy'
Plugin.config = true

-- See :help lualine.txt
Plugin.opts = {
    options = {
        theme = 'modus-vivendi',
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        },
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 4,
            }
        }
    },
}

function Plugin.init()
    vim.opt.showmode = false
end

return Plugin
