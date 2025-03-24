-- Neovim init.lua configuration

-- General settings
vim.opt.expandtab = true           -- Converts tabs to white space
vim.opt.number = true              -- Show line numbers
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Set specific tab settings for HTML files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.htm", "*.html"},
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2"
})

vim.opt.smarttab = true
-- vim.opt.filetype = "plugin indent on"   -- Enable filetype-specific plugins and indent settings
vim.opt.syntax = "on"                  -- Enable syntax highlighting
vim.opt.mouse = "a"                    -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

-- TTY performance optimizations
vim.opt.ttyfast = true               -- Speed up scrolling in Vim

-- Disable swap files
vim.opt.swapfile = false


require("config.lazy")

local cmp = require('cmp')
local lspconfig = require('lspconfig')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-K>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-[>'] = cmp.mapping.scroll_docs(-4),
    ['<C-]>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    ['<C-Esc>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
})

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
lspconfig.java_language_server.setup {
    cmd = "java-language-server"
}
--lspconfig.zls.setup({})
lspconfig.zls.setup {
    capabilities = capabilities
  }

-- Key mappings (using Lua syntax)
-- You can create mappings using `vim.api.nvim_set_keymap` or `vim.keymap.set`

-- Normal mode key mappings
vim.keymap.set('n', '<C-c>', '0i//<esc>j')
vim.keymap.set('n', '<C-x>', '0xxj')
vim.keymap.set('n', 'C', 'J')
vim.keymap.set('n', 'D', '"1dd')
vim.keymap.set('n', 'dd', '"0dd')
vim.keymap.set('n', 'p', '"0p')
vim.keymap.set('n', 'L', 'o<esc>')
vim.keymap.set('n', '<C-J>', '0i<CR><esc>')
vim.keymap.set('n', '<C-K>', '0i<BS><esc>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<A-q>', ':q!<CR>')
vim.keymap.set('n', '<S-w>', ':w<CR>')
vim.keymap.set('n', '<S-q>', ':wq!<CR>')
vim.keymap.set('n', '<S-J>', '<PageDown>')
vim.keymap.set('n', '<S-K>', '<PageUp>')
vim.keymap.set('n', 'z', '.jj')


-- Insert mode key mappings
vim.keymap.set('i', '<CR>', '<C-G>u<CR>')  -- Handle <CR> in insert mode (insert spaces for undo support)

-- Set the colorscheme
vim.cmd('colorscheme tokyonight')

-- Highlighting options
vim.cmd('highlight Normal guibg=none')

