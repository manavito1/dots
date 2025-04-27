return {
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Your configuration here (or leave empty for defaults)
  },
  config = function(_, opts)
    vim.opt.timeout = true
    vim.opt.timeoutlen = 300 -- Time to wait after pressing <leader>
    require("which-key").setup(opts)
  end,
}
}
