function StartTSRepl()
  local cwd = vim.fn.getcwd()
  local ts_rootdir = "%/thongsuy%/clj%-ts"
  if string.find(cwd, ts_rootdir) ~= nil then
    vim.cmd("Clj -M:dev:mob-ts")
  else
    print('not in -> thongsuy/clj-ts project')
  end
end

vim.keymap.set("n", "<leader>st", StartTSRepl)

vim.g['conjure#filetypes'] = { "clojure", "fennel", "python" }
 
local paredit = require("nvim-paredit");
paredit.setup({
  keys = {
    [">S"] = { paredit.api.slurp_forwards, "Slurp forwards" },
    ["<S"] = { paredit.api.slurp_backwards, "Slurp backwards" },
    [">B"] = { paredit.api.barf_backwards, "Barf backwards" },
    ["<B"] = { paredit.api.barf_forwards, "Barf forwards" },
  }
})
