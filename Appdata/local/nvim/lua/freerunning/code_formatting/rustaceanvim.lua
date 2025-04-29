return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false,   -- This plugin is already lazy
        config = function()
            local function win_cmd(cmd)
                local dir = vim.fn.fnamemodify(vim.fn.expand('%:p:h:h'), ':p')
                -- Escape backslashes and wrap the full command in quotes
                return { 'cmd.exe', '/C', 'cd /D "' .. dir .. '" && ' .. cmd }
            end

            vim.keymap.set("n", "<leader>rr",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo run') }) end,
                { noremap = true, silent = true, desc = "Run rust code with cargo (debug)" }
            )
            vim.keymap.set("n", "<leader>rR",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo run --release') }) end,
                { noremap = true, silent = true, desc = "Run rust code with cargo (release)" }
            )
            vim.keymap.set("n", "<leader>rt",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo test') }) end,
                { noremap = true, silent = true, desc = "Test rust code with cargo" }
            )
            vim.keymap.set("n", "<leader>rb",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo build') }) end,
                { noremap = true, silent = true, desc = "Build rust code with cargo (debug)" }
            )
            vim.keymap.set("n", "<leader>rB",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo build --release') }) end,
                { noremap = true, silent = true, desc = "Build rust code with cargo (release)" }
            )
            vim.keymap.set("n", "<leader>rc",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo check') }) end,
                { noremap = true, silent = true, desc = "Check rust code for errors with cargo" }
            )
            vim.keymap.set("n", "<leader>rl",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo clippy') }) end,
                { noremap = true, silent = true, desc = "Lint rust code with cargo clippy" }
            )
            vim.keymap.set("n", "<leader>rd",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo doc --open') }) end,
                { noremap = true, silent = true, desc = "Open rust docs with cargo" }
            )
            vim.keymap.set("n", "<leader>ra",
                function() require('FTerm').scratch({ cmd = win_cmd('cargo clean') }) end,
                { noremap = true, silent = true, desc = "Clean rust build artifacts with cargo clean" }
            )
        end,
    },
}
