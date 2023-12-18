require('plugins2')
require('nvim-cmp-config')
require('keyMaps')
--require('diffview-config')
-- require('nvim-autopairs').setup({})
require('snippets')
require('Luasnip-config')
require('gitsigns-config')
require('null-ls-config')
require('autocmds')
require("nvim-dap-virtual-text").setup()
require('dap-config')
require('globals')
--require('symbols-config')
require('lir-config')
require('mason-config')



---- CONFIG

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
vim.opt.lazyredraw = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
-- vim.opt.list = true

vim.g.codeium_disable_bindings = 1
vim.g.codeium_manual = true

-- vim.g.dashboard_default_executive = 'telescope'
-- vim.opt.formatoptions = vim.opt.formatoptions - {"c", "r", "o"}

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         -- disable virtual text
--         virtual_text = false,
--
--         -- show signs
--         signs = true,
--
--         -- delay update diagnostics
--         update_in_insert = false,
--         -- display_diagnostic_autocmds = { "InsertLeave" },
--
--     }
-- )


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

vim.cmd([[
highlight link LirGitStatusBracket Comment
highlight link LirGitStatusIndex Special
highlight link LirGitStatusWorktree WarningMsg
highlight link LirGitStatusUnmerged ErrorMsg
highlight link LirGitStatusUntracked Comment
highlight link LirGitStatusIgnored Comment
]])


local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
treesitter_parser_config.templ = {
  install_info = {
    url = "https://github.com/vrischmann/tree-sitter-templ.git",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "master",
  },
}

vim.treesitter.language.register('templ', 'templ')



-- Cambiar al CWD cuando se hace new tab
vim.cmd([[
function! OnTabEnter(path)
  if isdirectory(a:path)
    let dirname = a:path
  else
    let dirname = fnamemodify(a:path, ":h")
  endif
  execute "tcd ". dirname
endfunction()

autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
]])

vim.cmd("colorscheme base16-dracula")
vim.cmd([[
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
set listchars+=trail:.
]])
