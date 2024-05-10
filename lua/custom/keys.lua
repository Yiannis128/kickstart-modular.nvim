-- Contain keybindings

local function key_map(m, lhs, rhs)
  vim.keymap.set(m, lhs, rhs, { noremap = true, silent = true })
end

local function key_map_opts(m, lhs, rhs, eopts)
  local opts = { noremap = true, silent = true }
  for k, v in pairs(eopts) do
    opts[k] = v
  end
  vim.api.nvim_set_keymap(m, lhs, rhs, opts)
end

-- Remap resizing panels
local panel_shift_size = 4
key_map('n', '<C-Left>', panel_shift_size .. '<C-w><')
key_map('n', '<C-Right>', panel_shift_size .. '<C-w>>')
key_map('n', '<C-Down>', panel_shift_size .. '<C-w>-')
key_map('n', '<C-Up>', panel_shift_size .. '<C-w>+')

-- Remap switching panels
key_map('n', '<C-l>', '<C-W>l')
key_map('n', '<C-k>', '<C-W>k')
key_map('n', '<C-j>', '<C-W>j')
key_map('n', '<C-h>', '<C-W>h')

-- Remap changing panel orientation
key_map('n', '<C-S-r>', '<C-w><S-h>')
key_map('n', '<C-S-e>', '<C-w><S-k>')

-- Remap saving
key_map({ 'n', 'i' }, '<C-s>', ':w<CR>')

-- Barbar Keymap

key_map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>')
key_map('n', '<A-Right>', '<Cmd>BufferNext<CR>')
key_map('n', '<A-z>', '<Cmd>BufferPin<CR>')
key_map('n', '<A-x>', '<Cmd>BufferClose<CR>')
key_map('n', '<A-Down>', '<Cmd>BufferMovePrevious<CR>')
key_map('n', '<A-Up>', '<Cmd>BufferMoveNext<CR>')

key_map_opts('n', 'tt', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle the filesystem [t]ree.' })

-- Toggle AutoPairs
key_map('n', '<A-p>', function()
  if NvimAutopairsEnabled == nil then
    NvimAutopairsEnabled = true
  end

  local ap = require 'nvim-autopairs'
  if NvimAutopairsEnabled then
    ap.disable()
    print 'AP Disabled'
  else
    ap.enable()
    print 'AP Enabled'
  end
  NvimAutopairsEnabled = not NvimAutopairsEnabled
end)

-- Which-key mappings https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings
local wk = require 'which-key'
wk.register {
  ['t'] = { name = '+Tree' },
}
