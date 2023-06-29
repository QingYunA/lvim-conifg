local M = {}

-- bufferline config --
local bufferline_config = function()
  lvim.builtin.which_key.mappings.b = {
    name = " Buffer",
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
    c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
    p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
    j = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
    t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>b#<cr>", "Previous" },
    n = { "<cmd>n#<cr>", "Next" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right", },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory", },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
  }
end

-- vim key remap --
local key_remap = function()
  lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
  lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
  lvim.keys.normal_mode["<C-o>"] = "<C-o>zz"
  lvim.keys.insert_mode["jj"] = "<Esc>"
  -- lvim.keys.normal_mode["gd"] = "<cmd>Lspsaga peek_definition<CR>"
  lvim.lsp.buffer_mappings.normal_mode['gd'] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" }
  -- lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
  lvim.lsp.buffer_mappings.normal_mode['gD'] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" }

  -- set default to nil then set it --
  -- lvim.lsp.buffer_mappings.normal_mode["gd"] = nil
  -- lvim.keys.normal_mode["gd"] = "<cmd>Lspsaga peek_definition<CR>"
  -- lvim.lsp.buffer_mappings.normal_mode["gD"] = nil
  -- lvim.keys.normal_mode['gD'] = "<cmd>lua vim.lsp.buf.definition()<CR>"
end

M.config = function()
  bufferline_config()
  key_remap()
end
return M
