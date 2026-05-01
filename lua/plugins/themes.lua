return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "L-Colombo/oldschool.nvim",
        config = true,
    },
    {
        "sainnhe/gruvbox-material",
    },
    {
        "https://github.com/dgox16/oldworld.nvim",
    },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
    },
    {
        "scottmckendry/cyberdream.nvim",
    },
    {
        "loctvl842/monokai-pro.nvim",
    },
    {
        "davidscotson/sonokai-nvim",
        dependencies = { "rktjmp/lush.nvim" },
        config = function ()
            require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
            })
            vim.cmd("colorscheme cyberdream")
        end
    },
}
