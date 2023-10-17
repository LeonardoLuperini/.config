local h = require("user.lsp.handlers")

local opts = {
  cmd = {},
  settings = {
    java = {
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {},
        filteredTypes = {
          -- "com.sun.*",
          -- "io.micrometer.shaded.*",
          -- "java.awt.*",
          -- "jdk.*",
          -- "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
      configuration = {
--[[
        runtimes = {
          {
            name = "Java-1.8",
            path = "/usr/lib/jvm/java-8-openjdk/",
            default = true,
          },
        },
--]]
      },
    },
  },
}

local function setup()
  local jdtls = require("jdtls")

  -- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

  local root_markers = {".rootfile", ".git" }
  local root_dir = jdtls.setup.find_root(root_markers)
  local home = os.getenv("HOME")
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

  opts.cmd = {
    jdtls_bin,
    "-data",
    workspace_dir,
  }

  opts.on_attach = h.on_attach
  opts.capabilities = h.capabilities

  return opts
end

return { setup = setup }
