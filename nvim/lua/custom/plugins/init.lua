-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    local config = {
      cmd = { vim.fn.stdpath 'data' .. '/mason/bin/jdtls' },

      root_dir = require('jdtls.setup').find_root { '.root_here', '.git', 'mvnw', 'gradlew' },
      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        configuration = {
          runtimes = {
            {
              name = 'JavaSE-21',
              path = '/usr/bin/java',
            },
          },
        },
        project = {
          referencedLibraries = { '/lib/my_java_libs/gson-2.13.1.jar' },
        },
      },
    }
    require('jdtls').start_or_attach(config)
  end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
