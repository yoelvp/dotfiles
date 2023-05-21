local ok, template_string = pcall(require, 'template-string')

if not ok then
  return
end

template_string.setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
  jsx_brackets = true,
  remove_template_string = false,
  restore_quotes = {
    normal = [[']],
    jsx = [["]]
  }
})
