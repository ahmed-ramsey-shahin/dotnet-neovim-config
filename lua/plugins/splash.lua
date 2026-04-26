local animation = "flyingdragon"

return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
        local splash = require("milli").load({ splash = animation })
        return {
            theme = "doom",
            config = {
                header = splash.frames[1],
                center = {
                },
            },
        }
    end,
    config = function(_, opts)
        require("dashboard").setup(opts)
        require("milli").dashboard({ splash = animation, loop = true })
    end,
}
