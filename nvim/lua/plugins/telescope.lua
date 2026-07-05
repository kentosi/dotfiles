return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "ElPiloto/telescope-vimwiki.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find config files",
    },
    { "<leader><leader>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in buffer" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")

    -- Skip previewing files bigger than a certain threshold
    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
          return
        end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    telescope.setup({
      defaults = {
        buffer_previewer_maker = new_maker,
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        preview = {
          -- Neovim's bundled markdown highlight query crashes on fenced
          -- code blocks (neovim/neovim#39032); skip treesitter for the
          -- preview pane and fall back to regex highlighting.
          treesitter = { disable = { "markdown", "vimwiki" } },
        },
      },
    })

    telescope.load_extension("fzy_native")
    telescope.load_extension("vimwiki")
  end,
}
