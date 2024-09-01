return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      git = {
        enable = false,
    },
    renderer = {
        highlight_git = false,
        icons = {
        show = {
            git = false,
            },
        },
    },
    view = {
        side = "right",
    },
    }
  end,

  vim.keymap.set("n" , "<leader>t", ":NvimTreeToggle<CR>"),
}


