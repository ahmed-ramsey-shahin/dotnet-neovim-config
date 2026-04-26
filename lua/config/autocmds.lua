-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch", -- Highlight group to use
            timeout = 200, -- Time in ms to keep highlight
        })
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

local theme_fixes = vim.api.nvim_create_augroup("ThemeFixes", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = theme_fixes,
  pattern = { "vim", "darkblue", "default" },
  callback = function()
    local groups = {
      "NormalFloat",
      "FloatBorder",
      "Pmenu",
      "PmenuSel",
      "PmenuSbar",
      "PmenuThumb",
      "MiniFilesNormal",
      "MiniFilesBorder",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { link = "Normal" })
    end
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#444444", fg = "#FFFFFF", bold = true })
    vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#FFFFFF", bold = true })
  end,
})

local current = vim.g.colors_name or ""
if current == "vim" or current == "darkblue" then
    vim.api.nvim_exec_autocmds("ColorScheme", { pattern = current })
end
