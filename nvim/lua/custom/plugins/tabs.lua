local function toggle_nvim_plugin()
vim.opt.termguicolors = true
local bufferline = require('bufferline')
bufferline.setup({
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    }
})
end

return {
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config = toggle_nvim_plugin}
}
