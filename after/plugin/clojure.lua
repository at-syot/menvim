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
