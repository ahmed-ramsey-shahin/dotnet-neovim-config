return {
    {
        "mistweaverco/kulala.nvim",
        keys = {
            {
                "<leader>rr",
                function()
                    require("kulala").run()
                end,
                desc = "Run Request",
            },
        },
        opts = {},
    },
}
