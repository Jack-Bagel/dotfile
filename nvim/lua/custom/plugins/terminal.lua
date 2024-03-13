-- Modes
local function toggleterm_nvim_config()
  require('toggleterm').setup({
    start_in_insert = true,
    persist_size = false,
  })
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<M-d>', ':set autochdir<CR>', opts)
vim.keymap.set('n', '<M-CR>', ':ToggleTerm<CR>', opts)
vim.keymap.set('t', '<M-CR>', '<CR>exit<CR>', opts)

return {
  {
    {'akinsho/toggleterm.nvim', version = "*", opts = toggleterm_nvim_config,}
  },
}

