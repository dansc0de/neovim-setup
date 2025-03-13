return {
  'akinsho/toggleterm.nvim', 
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shade_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = float,
      close_on_exit = true,
      shell = nil,
      float_opts = {
        boarder = "curved",
        winblend = 0,
        highlights = {
          boarder = "Normal",
          backgroud = "Normal"
        },
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
        return term.count
      end,
      },
    })
  end
}
