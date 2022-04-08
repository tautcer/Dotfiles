addEventListener('set to terraform', { 'BufNewFile,BufFilePre,BufRead *.tfvars' }, function()
  vim.cmd('set filetype=tf')
end)

addEventListener('scala_types', { 'BufNewFile,BufFilePre,BufRead *.sbt', 'BufNewFile,BufFilePre,BufRead *.sc' }, function()
  vim.cmd('set filetype=scala')
end)

addEventListener('pandoc_syntax', { 'BufNewFile,BufFilePre,BufRead *.md' }, function()
  vim.cmd('set filetype=pandoc')
end)
