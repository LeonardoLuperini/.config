local modes = { 'n', 'i', 'v' }
local keys = { '<Up>', '<Down>', '<Left>', '<Right>' }
for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
      -- Setting the mapping
      vim.keymap.set(mode, key, '<Nop>', {
        noremap = true,
        silent = true,
        desc = 'Practice Mode: Arrows Disabled'
      })
  end
end
