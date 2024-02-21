vim.g.mapleader = ' '
-- vim.api.nvim_set_keymap('n', '<space>', '<NOP>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', ',h', ':noh<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ',o', ':only<cr>:tabonly<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',O', ':lua require("utils").close_all()<CR>', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('i', 'jk',  '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj',  '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h',  ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j',  ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k',  ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l',  ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mm',  'mM', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m',  '`M', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\v',  '`[v`]', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require'fzf-lua'.files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',b', "<cmd>lua require'fzf-lua'.buffers()<CR>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', ',v', ':tabnew $HOME/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',g', ':G<cr>:only<cr>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', ',n', ':noh<cr>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', ',l', ':e %:h<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', '<C-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', 'Q', '<NOP>', {silent = true})

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua require("harpoon.term").gotoTerminal(1)<cr>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', ',fo', ':set foldmethod=marker foldmarker={,}<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ',f', '<cmd>lua vim.lsp.buf.format()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':setlocal buftype=nofile bufhidden=hide<cr>', { noremap = true })
-- dap
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require("dap").continue()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua require("dap").step_over()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua require("dap").step_into()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>do', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>du', '<Cmd>lua require("dapui").open()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'T', ':tabnew<cr>', { noremap = true})

vim.api.nvim_set_keymap('x', '<leader>g', ':norm! ', { noremap = true})

vim.api.nvim_set_keymap('n', '<C-s>', ':w<cr>', { noremap = true})

-- Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>1', [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>2', [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>3', [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>4', [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'G', 'Gzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', 'p=l', { noremap = true })
vim.api.nvim_set_keymap('n', ',e', '<cmd>NvimTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ',r', '<Cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:e!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '<Cmd>lua require("go_tests").fuzzy_dirs()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'n:silent set hlsearch<cr>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>', ':w<cr>:source %<cr>', { noremap = true })


-- vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'D', '"_D', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'C', '"_C', { noremap = true })
vim.api.nvim_set_keymap('x', 'p', 'P', { noremap = true })

-- :nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
-- :nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
-- :nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
-- :xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
-- :xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

vim.api.nvim_set_keymap('n', '<c-Up>', ':resize -1<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-Down>', ':resize +1<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-left>', ':vertical resize -1<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-right>', ':vertical resize +1<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('t', '<esc><esc>', '<C-\\><C-n>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR><ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',n', ':cnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',p', ':cprev<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',t', ':vs<cr>', { noremap = true, silent = true })
