addEventListener('LuaHighlight', { 'TextYankPost * silent!' }, function()
  require'vim.highlight'.on_yank{ timeout = 250 }
end)
