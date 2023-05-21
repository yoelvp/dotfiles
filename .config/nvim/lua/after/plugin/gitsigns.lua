local ok, git_signs = pcall(require, 'gitsigns')

if not ok then
  return
end

git_signs.setup({})
