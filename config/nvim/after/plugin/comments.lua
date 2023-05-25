local comment_ok, comment = pcall(require, 'Comment')
local todo_comments_ok, todo_comments = pcall(require, 'todo-comments')

if (not comment_ok) then return end
if (not todo_comments_ok) then return end

-- config to Comment
comment.setup({})

-- config to todo-comments
todo_comments.setup({})
