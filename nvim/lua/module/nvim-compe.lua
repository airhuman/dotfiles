require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = true,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  allow_prefix_unmatch = false,

  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    ultisnips = true,
  },
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
  end

  vim.api.nvim_set_keymap('i', '<C-Space>', [[compe#complete()]], {
    expr = true,
    silent = true,
  })

  vim.api.nvim_set_keymap('i', '<C-e>', [[compe#close('<C-e>')]], {
    expr = true,
    silent = true,
  })

  vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]], {
    expr = true,
    silent = true,
  })

  vim.api.nvim_set_keymap('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], {
    expr = true,
    silent = true,
  })

  vim.api.nvim_set_keymap('i', '<C-b>', [[compe#scroll({ 'delta': -4 })]], {
    expr = true,
    silent = true,
  })

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t'<C-n>'
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t'<Plug>(vsnip-expand-or-jump)'
  elseif check_back_space() then
    return t'<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t'<C-p>'
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t'<Plug>(vsnip-jump-prev)'
  else
    return t'<S-Tab>'
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {
  expr = true,
  silent = true,
})

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {
  expr = true,
  silent = true,
})

vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {
  expr = true,
  silent = true,
})

vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {
  expr = true,
  silent = true,
})
