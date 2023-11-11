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
  { "nvim-telescope/telescope.nvim", config = function()

      require'telescope'.setup({
          defaults = {
              preview = false
          }
      })

  end

  },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "tpope/vim-fugitive",
  "mattn/emmet-vim",
  "tamago324/lir.nvim",
  { "tamago324/lir-git-status.nvim", config = function()
      require'lir.git_status'.setup()
  end },
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
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
  { "nvim-neorg/neorg", config = function()
      require('neorg').setup {
          load = {
              ["core.defaults"] = { },
              ["core.dirman"] = {
                  config = {
                      workspaces = {
                          work = "~/notes/work",
                          home = "~/notes/home",
                      }
                  }
              }
          }
      }
      end
  },
  "nvim-treesitter/playground",
  { "nvim-treesitter/nvim-treesitter", config = function()

      require("nvim-treesitter.configs").setup {
          -- indent = {
          --     enable = false
          -- },
          ensure_installed = "all",
          sync_install = false,
          highlight = {
              -- `false` will disable the whole extension
              enable = true,
              -- list of language that will be disabled
              disable = { "elixir", "php", "vue", "html.twig.js.cshtml.twig.js.css", "markwdown", "python", "ocaml" },
              -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
              -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
              -- Using this option may slow down your editor, and you may see some duplicate highlights.
              -- Instead of true it can also be a list of languages
              additional_vim_regex_highlighting = false,
          },
      }

      end
  },
  --"unblevable/quick-scope",
  "ThePrimeagen/harpoon",
  { "catppuccin/nvim", name = "catppuccin" },
  "mfussenegger/nvim-dap",
  {"rcarriga/nvim-dap-ui", config = function()
      require("dapui").setup()
  end
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
  "jose-elias-alvarez/null-ls.nvim",
  {"nvim-treesitter/nvim-treesitter-context", config = function()
        require'treesitter-context'.setup{
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        }
    end

    },
    "joerdav/templ.vim",
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    }
})

