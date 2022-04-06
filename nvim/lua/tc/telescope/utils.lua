local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')
local telescope_utils = require('telescope.utils')

local M = {}

local use_git_root = true

local get_filename = function()
  return vim.fn.expand('%:t')
end

local get_git_root = function()
  local git_root, ret = telescope_utils.get_os_command_output({
    'git',
    'rev-parse',
    '--show-toplevel',
  }, vim.loop.cwd())
  if ret ~= 0 then
    return vim.loop.cwd()
  end

  return git_root[1]
end

local get_root = function()
  local root = get_git_root()
  if not use_git_root then
    vim.loop.cwd()
  end
  return root
end

local root_name = function()
  local root = get_root()
  return root, string.upper(vim.fn.fnamemodify(root, ':t'))
end

M.find_files = function()
  local _, curr_dir = root_name()
  require('telescope.builtin').find_files({ prompt_title = curr_dir })
end

M.live_grep = function()
  local root, curr_dir = root_name()
  require('telescope.builtin').live_grep({ cwd = root, prompt_title = curr_dir })
end

M.grep_string = function(input)
  local root, curr_dir = root_name()
  vim.schedule(function()
    require('telescope.builtin').grep_string({ cwd = root, search = input, prompt_title = curr_dir })
  end)
end

M.buffers = function()
  require('telescope.builtin').buffers({ prompt_title = 'Buffers' })
end

M.lsp_references = function()
  local reference_word = 'References for: ' .. string.upper(vim.fn.expand('<cword>'))
  require('telescope.builtin').lsp_references({ prompt_title = reference_word })
end

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'log', '-p', entry.value .. '^!' }
  end
}

M.git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

M.delta_git_status = function(opts)
    opts = opts or {}
    opts.previewer = delta

    builtin.git_status(opts)
end

return M
