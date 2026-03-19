return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php", "blade", "blade.php", },
  root_markers = { "composer.json", ".git", },
  settings = {
    intelephense = {
      format = {
        braces = "k&r",
      },
    },
  },
}
