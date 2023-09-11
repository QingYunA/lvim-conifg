-- Plugin --
local M = {}

M.config = function()
  lvim.plugins = {
    -- colorschemes --
    { "lunarvim/colorschemes" },
    -- monokai pro colorscheme --
    {
      "loctvl842/monokai-pro.nvim",
      config = function()
        require('monokai-pro').setup()
      end
    },
    -- rainbow brackets --
    {
      "mrjones2014/nvim-ts-rainbow",
    },
    -- preview in a float window --
    {
      "rmagatti/goto-preview",
      config = function()
        require('goto-preview').setup {
          width = 120,              -- Width of the floating window
          height = 25,              -- Height of the floating window
          default_mappings = false, -- Bind default mappings
          debug = false,            -- Print debug information
          opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
          post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
          -- You can use "default_mappings = true" setup option
          -- Or explicitly set keybindings
          -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
          -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
          -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
        }
      end
    },
    -- auto save when change file --
    {
      "Pocco81/auto-save.nvim",
      config = function()
        require("auto-save").setup()
      end,
    },
    -- markdown preview --
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    -- comments plugins --
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    },
    -- vim tem
    {
      "lervag/vimtex",
    },
    -- catppuccin colorscheme --
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
    },
    -- {
    --   'hardhackerlabs/theme-vim',
    --   -- config = function()
    --   --   vim.cmd.colorscheme 'hardhacker'
    --   -- end,
    -- },
    -- leap (quick motion cursor) --
    -- {
    --   "ggandor/leap.nvim",
    --   name = "leap",
    --   config = function()
    --     require("leap").add_default_mappings()
    --   end,
    -- },
    -- diff view --
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },
    -- clever f --
    -- { "rhysd/clever-f.vim" },
    -- github copilot --
    {
      "zbirenbaum/copilot-cmp",
      event = "InsertEnter",
      dependencies = { "zbirenbaum/copilot.lua" },
      config = function()
        vim.defer_fn(function()
          require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
          require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
        end, 100)
      end,
    },
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      config = function()
        require("lspsaga").setup({})
      end,
      dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" }
      }
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s",     mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc =
        "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end,
                                                                                                    desc =
          "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc =
        "Toggle Flash Search" },
      },
    }
  }
end
return M
