-- colorscheme --
lvim.colorscheme = "catppuccin-mocha"


--
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
  return server ~= "pylsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
-- enable rainbow --
lvim.builtin.treesitter.rainbow.enable = true
-- user plugin --
require("user.plugin").config()
-- vimtex config --
require("user.vimtex").config()
-- key binding settings --
require("user.key_bindings").config()
