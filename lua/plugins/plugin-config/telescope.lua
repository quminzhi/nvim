local builtin = require('telescope.builtin')

vim.keymap.set('n', ']h', builtin.help_tags, {})


local actions = require('telescope.actions')
require('nvim-web-devicons').setup({
  override = {},
  default = true
})
require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  },
  pickers = {
    picker_name = {
      picker_config_key = builtin.lsp_workspace_symbols,
    }
  }
}
