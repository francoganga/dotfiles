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

require("lazy").setup({
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {'nvim-telescope/telescope.nvim', config = function()
      require'telescope'.setup({
          pickers = {
              colorscheme = {
                  enable_preview = true
              }
          }
      })

  end },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "tpope/vim-fugitive",
  "mattn/emmet-vim",
  {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
      config = function()

          require("oil").setup({
              keymaps = {
                  ["g?"] = "actions.show_help",
                  ["l"] = "actions.select",
                  ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                  ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                  ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                  ["<C-p>"] = "actions.preview",
                  ["<C-c>"] = "actions.close",
                  ["<C-l>"] = "actions.refresh",
                  ["h"] = "actions.parent",
                  ["_"] = "actions.open_cwd",
                  ["`"] = "actions.cd",
                  ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
                  ["gs"] = "actions.change_sort",
                  ["gx"] = "actions.open_external",
                  ["g."] = "actions.toggle_hidden",
                  ["g\\"] = "actions.toggle_trash",
              },

          })

      end
  },
  -- "tamago324/lir.nvim",
  -- { "tamago324/lir-git-status.nvim", config = function()
  --     require'lir.git_status'.setup()
  -- end },
  "nvim-lua/plenary.nvim",
  --"kyazdani42/nvim-web-devicons",
  "tamago324/nlsp-settings.nvim",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "onsails/lspkind-nvim",
  {"neovim/nvim-lspconfig", config = function(lp, opts)
      require('lsp-config')
      end 
  },
  "RRethy/nvim-base16",
  {"terrortylor/nvim-comment", config = function()
      require'nvim_comment'.setup {
             marker_padding = true,
             comment_empty = true,
             create_mappings = true,
             line_mapping = "gcc",
             operator_mapping = "gc",
             hook = nil
         }
      end
  },
  "kazhala/close-buffers.nvim",
  "lewis6991/gitsigns.nvim",
  --"nvim-treesitter/playground",
  --{ "nvim-treesitter/nvim-treesitter", config = function()

  --    require("nvim-treesitter.configs").setup {
  --        -- indent = {
  --        --     enable = false
  --        -- },
  --        ensure_installed = "all",
  --        sync_install = false,
  --        highlight = {
  --            -- `false` will disable the whole extension
  --            enable = true,
  --            -- list of language that will be disabled
  --            disable = {"php", "vue", "html.twig.js.cshtml.twig.js.css", "markwdown", "python", "ocaml" },
  --            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  --            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  --            -- Using this option may slow down your editor, and you may see some duplicate highlights.
  --            -- Instead of true it can also be a list of languages
  --            additional_vim_regex_highlighting = false,
  --        },
  --    }

  --    end
  --},
  --"unblevable/quick-scope",
  "ThePrimeagen/harpoon",
  { "catppuccin/nvim", name = "catppuccin" },
  "mfussenegger/nvim-dap",
  {"rcarriga/nvim-dap-ui", config = function()
      require("dapui").setup()
  end, dependencies = {"nvim-neotest/nvim-nio"}
  },
  "theHamsta/nvim-dap-virtual-text",
  "leoluz/nvim-dap-go",
  { "simrat39/symbols-outline.nvim", config = function()
      require("symbols-outline").setup()
  end},
  {
      'Exafunction/codeium.vim',
      config = function ()
          -- Change '<C-g>' here to any keycode you like.
          vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
          vim.keymap.set('i', '<C-h>', function () return vim.fn['codeium#Complete']() end, { expr = true })
          -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
          -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
          -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
  },
  "mbbill/undotree",
  "joerdav/templ.vim",
    "folke/zen-mode.nvim",
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    "echasnovski/mini.align",
    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                -- See Setup section below
            })
        end
    },
    'rescript-lang/vim-rescript',
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    }
})

