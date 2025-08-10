-- lua/config/lspconfig.lua
local lspconfig = require("lspconfig")

lspconfig.ltex.setup({
  settings = {
    ltex = {
      language = "auto",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en-US",
      },
      dictionary = {
        ["en-US"] = {},
        ["uk"] = {},
        ["ru"] = {},
      },
      disabledRules = {
        ["en-US"] = {},
        ["uk"] = {},
        ["ru"] = {},
      },
    },
  },
})
