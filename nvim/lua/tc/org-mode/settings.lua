local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
}

require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = { '~/Projects/notes/orgmode/**/*' },
  org_default_notes_file = '~/Projects/notes/orgmode/notes.org',
  org_agenda_templates = {
    j = {
      description = 'Journal',
      template = '*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '~/Projects/notes/orgmode/journal.org',
    },
  },
})
