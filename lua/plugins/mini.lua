return {
    {
        'nvim-mini/mini.nvim',
        version = '*',
        config = function ()
            -- mini.starter
            local starter = require('mini.starter')
            starter.setup({
                silent = true,
                footer = '',
                header =
[[  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆        
   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      
     ⠈   ⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    
          ⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   
         ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  
  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿  
 ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄  ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  
⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ 
⠙⠃   ⣼⣿⡟⠌ ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇ ⠛⠻⢷⣄
     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆   ⠁
      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣤⣾⡿⠃    
⢀⣀⠀⣠⣀⣠⣾⣿⣿⡿⠛⠋⠉⠉⠉   ⠉⠉⠉⠉⠛⠻⣿⣿⣷⣄⣀⢿⡽⢻⣦
⠻⠶⠾⠿⠿⠿⠋⠉   R A M S E Y   ⠉⠻⠿⠿⠿⠿⠿⠋]],
                items = {
                    starter.sections.recent_files(5, false),
                    starter.sections.sessions(5, true),
                    starter.sections.builtin_actions(),
                    { name = 'Lazy Update', action = 'Lazy update', section = 'Config' },
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.aligning('center', 'center'),
                },
            })
            -- mini.sessions
            local sessions = require('mini.sessions')
            sessions.setup({
                autoread = false,
                autowrite = false,
                directory = '~/.config/nvim/sessions/',
            })
            -- keymaps
            local map = vim.keymap.set
            map("n", "<leader>xs", function() MiniSessions.select() end, { desc = "Select session" })
            map("n", "<leader>xn", function()
                local name = vim.fn.input("Session name: ")
               if name ~= "" then
                    MiniSessions.write(name)
                end
            end, { desc = "Save named session" } )
            map("n", "<leader>xo", function() MiniSessions.read(MiniSessions.get_latest()) end, { desc = "Load last session" })
            map("n", "<leader>xw", function() MiniSessions.write() end, { desc = "Save the current session" })
        end,
    },
}
