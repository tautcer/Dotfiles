local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {'/tmp/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.typescript = {
  {
    type = 'node2',
    request = 'launch',
    name = 'Launch File',
    program = '${file}',
    args = {
      '--inspect',
      '-r',
      'ts-node/register',
      './src/main/server.ts'
    },
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    restart = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = {'**/node_modules/**', '<node_internals>/**'},
    outFiles = {'${workspaceFolder}/build/**/*.js', '!**/node_modules/**'},
  },
  {
    type = 'node2',
    request = 'attach',
    mode = 'remote',
    name = 'Remote Attach',
    cwd = vim.fn.getcwd(),
    localRoot = vim.fn.getcwd(),
    remoteRoot = '/usr/src/app',
    sourceMaps = true,
    skipFiles = {'**/node_modules/**', '<node_internals>/**'},
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = {'${workspaceFolder}/build/**/*.js', '!**/node_modules/**'},
    restart = true,
  },
}
