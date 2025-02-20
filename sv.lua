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
    'kyazdani42/nvim-web-devicons',
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                winopts = {
                    split = "belowright new",
                    preview = {
                        hidden = "hidden"
                    }
                }
            })
        end
    },
    "echasnovski/mini.align",
    "Tetralux/odin.vim",
    "mattn/emmet-vim",
    --"cohama/lexima.vim",
    { "EdenEast/nightfox.nvim" },
    'rescript-lang/vim-rescript',
}


require("lazy").setup(plugins, opts)
require('lir-config')


vim.opt.swapfile = false
vim.opt.wrap = true
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
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10


vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR><ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',t', ':vs term://zsh<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'p', 'P', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', 'p=l', { noremap = true })
vim.api.nvim_set_keymap('n', 'G', 'Gzz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<cr>', { noremap = true})
vim.api.nvim_set_keymap('', 'Q', '<NOP>', {silent = true})
vim.api.nvim_set_keymap('n', ',o', ':only<cr>:tabonly<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',O', ':%bd!|e#|bd#<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',l', ':e %:h<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<ESC><ESC>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jk',  '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj',  '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'mm',  'mM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m',  '`M', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require'fzf-lua'.files()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>h', "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\'', '`', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom_terminal', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

vim.keymap.set('n', '<space>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
    vim.api.nvim_buf_set_mark(0, "A", 1, 0, {})
end)


vim.cmd([[set errorformat+=%f(%l:%c)\ %m]])

local odin_make = vim.api.nvim_create_augroup("odin_make", {})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.odin",
    group = odin_make,
    command = "setlocal makeprg=odin\\ run\\ ."
})



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



vim.cmd("colorscheme carbonfox")
