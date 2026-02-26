return {
  {
      "zaldih/themery.nvim",
      lazy = false,
      config = function()
        require("themery").setup({
            themes = {"gruvbox", "melange"}, -- Your list of installed colorschemes.
            livePreview = true, -- Apply theme while picking. Default to true.
        })
      end
  },

  -- THEMES --
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("gruvbox").setup({
                terminal_colors = false, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
      -- Load the Gruvbox theme
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "savq/melange-nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      -- Load the Melange theme
      vim.cmd.colorscheme("melange")
    end,
  },
}
