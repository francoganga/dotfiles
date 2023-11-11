local dap = require'dap'
local dap_go = require'dap-go'

dap_go.setup({
        showLog = true
})

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/fganga/misc/clones/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

dap.adapters.coreclr = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = {'--interpreter=cli'}
}


dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- dap.adapters.go = {
--   type = 'executable';
--   command = 'node';
--   args = {os.getenv('HOME') .. '/misc/clones/vscode-go/dist/debugAdapter.js'};
-- }
--

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}
