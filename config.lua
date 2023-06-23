-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- key binding remap--
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.insert_mode["jj"] = "<Esc>"
--lvim.keys.normal_mode["<leader-1>"]=":b 1"
--lvim.keys.normal_mode["<leader-2>"]=":b 2"
--lvim.keys.normal_mode["<leader-3>"]=":b 3"
-- colorscheme -- 
lvim.colorscheme= "monokai-pro-octagon"
-- lualine settings --
lvim.builtin.lualine.style = "default" -- or "none"
-- diable lsp virtual text --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = true,
        -- delay update diagnostics
        update_in_insert = false,
      }
)

--lvim.builtin.nvimtree.setup.view.relativenumber = true
vim.opt.relativenumber = true -- relative line numbers
lvim.builtin.treesitter.rainbow.enable = true
-- remove pyright
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)
-- enable rainbow --
lvim.builtin.treesitter.rainbow.enable = true
-- Plugin --
lvim.plugins={
  -- colorschemes --
  {"lunarvim/colorschemes"},
  -- smooth scroll -- 
  -- {"karb94/neoscroll.nvim",
  --   config= function ()
  --     require('neoscroll').setup()
  --   end
  -- },
  -- monokai pro colorscheme --
  {
    "loctvl842/monokai-pro.nvim",
    config = function ()
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
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
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
    config = function ()
      require("Comment").setup()
    end,
  },
}
