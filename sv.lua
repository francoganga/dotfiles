local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
    "tamago324/lir.nvim",
    "nvim-lua/plenary.nvim",
    'kyazdani42/nvim-web-devicons'
}


require("lazy").setup(plugins, opts)
require('lir-config')


vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.expandtab = true
vim.opt.shiftwidth=4
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.number = true
--vim.opt.cursorline = true
--vim.opt.cursorcolumn = true
vim.opt.lazyredraw = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true


vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR><ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',t', ':vs term://zsh<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'p', 'P', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', 'p=l', { noremap = true })
vim.api.nvim_set_keymap('n', 'G', 'Gzz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<cr>', { noremap = true})
vim.api.nvim_set_keymap('', 'Q', '<NOP>', {silent = true})
vim.api.nvim_set_keymap('n', ',o', ':only<cr>:tabonly<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',l', ':e %:h<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-x>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jk',  '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj',  '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'mm',  'mM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m',  '`M', { noremap = true, silent = true })


vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall
    cnoreabbrev Wqa wqa
    cnoreabbrev E e
    cnoreabbrev Tabnew tabnew
    cnoreabbrev Vs vs
]])

vim.cmd("colorscheme slate")
