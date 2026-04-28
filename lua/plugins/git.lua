return {
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim", -- required

            -- Only one of these is needed.
            "sindrets/diffview.nvim", -- optional
        },
        cmd = "Neogit",
    },
}
