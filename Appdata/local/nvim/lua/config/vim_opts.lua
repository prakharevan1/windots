-- tabstops, QoL, etc.
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.termguicolors = true

-- Lazy load vim.version when required
vim.cmd([[autocmd VimEnter * lua require('vim.version')]])

-- keybinding for leader
vim.g.mapleader = " "

-- silence warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- auto save command with CTRL S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {})

-- automatically run screenkeys
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Screenkey toggle")
	end,
})
