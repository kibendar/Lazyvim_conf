return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    config = function()
      require("render-markdown").setup({
        checkbox = {
          enabled = true,
          unchecked = {
            -- Fix the visual artifacts by using proper Unicode characters
            icon = "󰄱",
            highlight = "RenderMarkdownUnchecked",
          },
          checked = {
            -- Fix the visual artifacts by using proper Unicode characters
            icon = "󰱒",
            highlight = "RenderMarkdownChecked",
          },
        },
      })
    end,
  },
}
