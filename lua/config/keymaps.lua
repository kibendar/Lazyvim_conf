-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local dapui = require("dapui")
dapui.setup() -- Make sure DAP UI is properly set up

-- Spell checking keymaps
map("n", "<leader>s", function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spell check" })

map("n", "]s", "]s", { desc = "Next misspelled word" })

map("n", "[s", "[s", { desc = "Previous misspelled word" })

map("n", "z=", "z=", { desc = "Suggest corrections" })

map("n", "zg", "zg", { desc = "Add word to dictionary" })

map("n", "zw", "zw", { desc = "Mark word as incorrect" })

map("n", "<leader>sen", function()
  vim.opt.spelllang = "en"
end, { desc = "English spell check" })

map("n", "<leader>suk", function()
  vim.opt.spelllang = "uk"
end, { desc = "Ukrainian spell check" })

map("n", "<leader>sru", function()
  vim.opt.spelllang = "ru"
end, { desc = "Russian spell check" })

map("n", "<leader>sall", function()
  vim.opt.spelllang = { "en", "uk", "ru" }
end, { desc = "All languages spell check" })

-- Terminal
map("n", "<C-\\>", function()
  require("nvchad.term").toggle({ pos = "sp", size = 0.2 })
end, { desc = "Toggle Terminal Horizontal" })

map("t", "<C-\\>", function()
  require("nvchad.term").toggle({ pos = "sp" })
end, { desc = "Toggle Terminal Horizontal" })

--Basic
map("i", "jj", "<ESC>")
map("n", "<leader><leader>", ":w<CR>")

-- Obsidian keymaps
-- Note: These will only work when obsidian.nvim is loaded (in markdown files)
map("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return require("obsidian").util.gf_passthrough()
  else
    return "gf"
  end
end, { desc = "Obsidian follow link", expr = true })

-- Toggle check-boxes
map("n", "<leader>ch", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Obsidian Check Checkbox" })
-- Smart action depending on context, either follow link or toggle checkbox
map("n", "<cr>", function()
  return require("obsidian").util.smart_action()
end, { desc = "Obsidian Smart Action", buffer = true })
-- Create a new note after prompting for its title
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian New Note" })
-- Open a note in the Obsidian app
map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open in Obsidian App" })
-- Search for or create notes
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian Quick Switch" })
-- Follow a link under your cursor
map("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { desc = "Obsidian Follow Link" })
-- Go back to your last note
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian Back Links" })
-- Search for notes in a sub-folder
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian Search" })
-- Open today's daily note
map("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian Today" })
-- Open tomorrow's daily note
map("n", "<leader>om", "<cmd>ObsidianTomorrow<cr>", { desc = "Obsidian Tomorrow" })
-- Open yesterday's daily note
map("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Obsidian Yesterday" })
-- Create a new note from a template
map("n", "<leader>oT", "<cmd>ObsidianTemplate<cr>", { desc = "Obsidian Template" })
-- Paste an image from the clipboard
map("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "Obsidian Paste Image" })
-- Rename the note of the current buffer or reference under the cursor
map("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Obsidian Rename" })
-- Create a new note and link it under the cursor
map("n", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Obsidian Link" })
-- Create a new note in a specific location and link it under the cursor
map("n", "<leader>oL", "<cmd>ObsidianLinkNew<cr>", { desc = "Obsidian Link New" })
-- Extract the current selection into a new note and link to it
map("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "Obsidian Extract Note" })
-- Navigate to/from daily notes
map("n", "<leader>otd", "<cmd>ObsidianDailies<cr>", { desc = "Obsidian Daily Notes" })
-- Show all tags
map("n", "<leader>ogt", "<cmd>ObsidianTags<cr>", { desc = "Obsidian Tags" })
-- Workspace switcher (if you have multiple workspaces)
map("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "Obsidian Switch Workspace" })

-- Debugger
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debug Continue" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Debug Step Over" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Debug Step Into" })
map("n", "<leader>du", function()
  require("dap").step_out()
end, { desc = "Debug Step Out" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug Toggle Breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug Conditional Breakpoint" })
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "Debug UI Toggle" })
map("n", "<leader>lD", function() end)

-- Tests
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Test Nearest" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test File" })
map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Test Summary" })
map("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Test Output" })
