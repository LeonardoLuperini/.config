local path_to_mason_jdtls_packages = vim.fn.stdpath 'data' .. '/jdtls'
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace' .. project_name

local config = {
  cmd = {
    -- 💀
    'java', -- or '/path/to/java21_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar',
    path_to_mason_jdtls_packages .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    -- ^^^^^^^^^^^^^                                                       ^^^^^^^^^^^^^^^^^^^^
    -- Must point to the                                                   Change this to
    -- eclipse.jdt.ls installation                                         the actual version

    -- 💀
    '-configuration',
    path_to_mason_jdtls_packages .. '/config_linux',
    -- ^^^^^^^^^^^^                 ^^^^^
    -- Must point to the            Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls               Depending on your system.
    -- installation

    -- 💀
    -- See `data directory configuration` section in the README
    '-data',
    workspace_dir,
  },
  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    configuration = {
      runtimes = {
        {
          name = 'JavaSE-21',
          path = '/home/leo/.sdkman/candidates/java/current/bin/java',
        },
      },
    },
    project = {
      referencedLibraries = { '/lib/my_java_libs/gson-2.13.1.jar' },
    },
  },
}
require('jdtls').start_or_attach(config)
