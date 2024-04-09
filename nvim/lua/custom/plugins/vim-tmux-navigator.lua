return {
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
{
  "vimpostor/vim-tpipeline",
  config = function()
      -- Disable the statusline when entering vim
      vim.g.tpipeline_autoembed = 0
      -- Restore the previous statusline after quitting vim
      -- vim.g.tpipeline_restore = 1
      -- vim.g.tpipeline_restore = 1
      -- Clear duplicate statusline when there is split windows
      vim.g.tpipeline_clearstl = 1
  end,
  },
}
