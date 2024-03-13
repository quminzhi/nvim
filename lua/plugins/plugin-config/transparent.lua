require("transparent").setup({
  -- enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    "Comment"
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})
