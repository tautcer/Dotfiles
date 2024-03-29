local RELOAD = require('plenary.reload').reload_module

Util = {}

P = function(...)
  return print(vim.inspect({ ... }))
end
R = function(name)
  RELOAD(name)
  return require(name)
end

Util.check_backspace = function()
  local curr_col = vim.fn.col('.')
  local is_first_col = vim.fn.col('.') - 1 == 0
  local prev_char = vim.fn.getline('.'):sub(curr_col - 1, curr_col - 1)

  if is_first_col or prev_char:match('%s') then
    return true
  else
    return false
  end
end

Util.check_surroundings = function()
  local col = vim.fn.col('.')
  local line = vim.fn.getline('.')
  local prev_char = line:sub(col - 1, col - 1)
  local next_char = line:sub(col, col)
  local pattern = '[%{|%}|%[|%]]'

  if prev_char:match(pattern) and next_char:match(pattern) then
    return true
  else
    return false
  end
end

-- preview file using xdg_open
Util.xdg_open = function()
  local filename = vim.fn.expand('<cfile>')
  vim.loop.spawn('xdg-open', { args = { filename } })
end

local to_rgb = function(hex)
  local red, green, blue, alpha

  if #hex == 9 then
    _, red, green, blue, alpha = hex:match('(.)(..)(..)(..)(..)')
    return string.format(
      'rgba(%s, %s, %s, %s)',
      tonumber('0x' .. red),
      tonumber('0x' .. green),
      tonumber('0x' .. blue),
      tonumber('0x' .. alpha)
    )
  end

  _, red, green, blue = hex:match('(.)(..)(..)(..)')
  return string.format('rgb(%s, %s, %s)', tonumber('0x' .. red), tonumber('0x' .. green), tonumber('0x' .. blue))
end

local to_hex = function(rgb)
  local red, green, blue, alpha
  if #rgb >= 16 then
    red, green, blue, alpha = rgb:match('%((%d+),%s(%d+),%s(%d+),%s(%d+)')
    return string.format('#%x%x%x%x', red, green, blue, alpha)
  end

  red, green, blue = rgb:match('%((%d+),%s(%d+),%s(%d+)')
  return string.format('#%x%x%x', red, green, blue)
end

Util.get_word = function()
  local first_line, last_line = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  local first_col, last_col = vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3]
  local current_word = vim.fn.getline(first_line, last_line)[1]:sub(first_col, last_col)

  return current_word
end

Util.get_lines = function()
  local first_line, last_line = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  local lines = vim.fn.getline(first_line, last_line)

  return lines
end

Util.get_visual = function()
  local first_line, last_line = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  local first_col, last_col = vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3]
  local lines = vim.fn.getline(first_line, last_line)

  if #lines == 0 then
    return ''
  end

  lines[#lines] = lines[#lines]:sub(0, last_col - 2)
  lines[1] = lines[1]:sub(first_col - 1, -1)

  return lines
end

Util.convert_color = function(mode)
  local result

  if mode == 'rgb' then
    result = to_rgb(Util.get_word())
  else
    result = to_hex(Util.get_word())
  end

  vim.api.nvim_command(string.format('s/%s/%s', Util.get_word(), result))
end

vim.api.nvim_exec(
  [[
  command! -nargs=? -range=% ToRgb call v:lua.Util.convert_color('rgb')
  command! -nargs=? -range=% ToHex call v:lua.Util.convert_color('hex')
]],
  true
)

Util.is_cfg_present = function(cfg_name)
  -- this returns 1 if it's not present and 0 if it's present
  -- we need to compare it with 1 because both 0 and 1 is `true` in lua
  return vim.fn.empty(vim.fn.glob(vim.loop.cwd() .. cfg_name)) ~= 1
end

Util.set_hl = function(group, options)
  local bg = options.bg == nil and '' or 'guibg=' .. options.bg
  local fg = options.fg == nil and '' or 'guifg=' .. options.fg
  local gui = options.gui == nil and '' or 'gui=' .. options.gui
  local link = options.link or false
  local target = options.target

  if not link then
    vim.cmd(string.format('highlight %s %s %s %s', group, bg, fg, gui))
  else
    vim.cmd(string.format('highlight! link', group, target))
  end
end

return Util
