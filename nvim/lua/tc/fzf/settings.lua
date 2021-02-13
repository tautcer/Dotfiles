vim.g.fzf_layout = {
	window = {
		width = 0.8,
		height = 0.8
	}
}
vim.g.fzf_colors = {
	fg = {'fg', 'Normal'},
	bg = {'bg', 'Normal'},
	hl = {'fg', 'Comment'},
	["fg+"] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
	["bg+"] = {'bg', 'CursorLine', 'CursorColumn'},
	["hl+"] = {'fg', 'Statement'},
	info = { 'fg', 'PreProc' },
	border = { 'fg', 'Ignore' },
	prompt = { 'fg', 'Conditional' },
	pointer = { 'fg', 'Exception' },
	marker = { 'fg', 'Keyword' },
	spinner = { 'fg', 'Label' },
	header = { 'fg', 'Comment' },

}
vim.g.fzf_buffers_jump = 0
vim.g.fzf_preview_window = { 'down', 'ctrl-/' }
vim.env.FZF_DEFAULT_OPTS = '--reverse'
