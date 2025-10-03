-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--

-- Enable spell checking
vim.opt.spell = true

-- Set spell languages (English, Ukrainian, Russian)
vim.opt.spelllang = { "en", "uk", "ru" }

-- Use both tree-sitter and spell for better detection
vim.opt.spelloptions = "camel"

-- Disable smooth scrolling
vim.opt.smoothscroll = false

-- Set scroll jump to move multiple lines at once for faster scrolling
vim.opt.scrolljump = 5

-- Optional: Set scroll offset (lines to keep visible above/below cursor)
vim.opt.scrolloff = 8

-- Define custom highlight groups
-- In init.lua
vim.api.nvim_set_hl(0, "CheckMark", { fg = "#1DCF17" })
vim.api.nvim_set_hl(0, "CrossMark", { fg = "#E61A24" })

-- Add matches that work in all buffers
vim.fn.matchadd("CheckMark", "✔")
vim.fn.matchadd("CrossMark", "✗")

-- Define custom highlight groups for checkbox states
vim.api.nvim_set_hl(0, "RenderMarkdownTodo", { fg = "#FFA500", bold = true }) -- Orange
vim.api.nvim_set_hl(0, "RenderMarkdownRightArrow", { fg = "#00BFFF", bold = true }) -- Deep Sky Blue
vim.api.nvim_set_hl(0, "RenderMarkdownTilde", { fg = "#FFD700", bold = true }) -- Gold
vim.api.nvim_set_hl(0, "RenderMarkdownImportant", { fg = "#FF6B6B", bold = true }) -- Red
