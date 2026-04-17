return {
    {
        "rmagatti/auto-session",
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            auto_create = false,
            allowed_dirs = vim.fn.glob("~/Documents/WS/*/", false, true),
            git_use_branch_name = true,
            git_auto_restore_on_branch_change = true,
        },
    }
}
