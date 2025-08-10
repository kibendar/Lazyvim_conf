return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Alternative: load only for files in your vault
    -- event = {
    --   "BufReadPre " .. vim.fn.expand "~" .. "/Obsidian/*.md",
    --   "BufNewFile " .. vim.fn.expand "~" .. "/Obsidian/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "studing",
          path = "~/Obsidian/Ajax Studing/",
        },
        {
          name = "theory",
          path = "~/Obsidian/Theory_of_testing/",
        },
      },

      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per attachment by passing a full path to the command instead of just a filename.
        img_folder = "Screenshots", -- This is the default
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
    },
  },
}
