-- you can configure Hop the way you like here; see :h hop-config
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

nnoremap('f', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true }) end)
nnoremap('F', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true }) end)
onoremap('f', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true }) end)
onoremap('F', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true }) end)
mapall('t', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true }) end)
mapall('T', function () require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true }) end)
