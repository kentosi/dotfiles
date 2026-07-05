-- git push for vimwiki

local M = {}

local vimwiki_path = vim.fn.expand("~/Documents/vimwiki")

local function open_floating_window(lines, title)
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = title or "Output",
    title_pos = "center",
  })

  -- Convenience mappings
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })

  return buf, win
end

function M.setup()
  vim.api.nvim_create_user_command("VimWikiGitPush", function()
    -- Sanity check
    if vim.fn.isdirectory(vimwiki_path .. "/.git") == 0 then
      print("Error: vimwiki is not a git repository")
      return
    end

    -- Check for changes
    if vim.fn.system({ "git", "-C", vimwiki_path, "status", "--porcelain" }) == "" then
      print("No changes to commit")
      return
    end

    local msg = vim.fn.input("Commit message: ")
    if msg == "" then
      print("Aborted")
      return
    end

    local cmd = {
      "sh",
      "-c",
      "git -C " .. vim.fn.shellescape(vimwiki_path)
        .. " add -A && "
        .. "git -C " .. vim.fn.shellescape(vimwiki_path)
        .. " commit -m " .. vim.fn.shellescape(msg)
        .. " && "
        .. "git -C " .. vim.fn.shellescape(vimwiki_path)
        .. " push"
    }

    local output = {}

    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      stderr_buffered = true,

      on_stdout = function(_, data)
        if data then
          vim.list_extend(output, data)
        end
      end,

      on_stderr = function(_, data)
        if data then
          vim.list_extend(output, data)
        end
      end,

      on_exit = function(_, code)
        vim.schedule(function()
          if code == 0 then
            print("Vimwiki git push complete")
          else
            if #output == 0 then
              output = { "Git command failed with no output." }
            end
            open_floating_window(output, "Vimwiki Git Error")
          end
        end)
      end,
    })
  end, {})
end

return M
