-- Name:
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/vim-vsnip

vim.g.vsnip_snippet_dir = '~/.config/nvim/lua/plugins/snippet'          -- Display indent markers

-- Navigate to next snippet placeholder with tab
vim.cmd([[
    imap <expr> <Tab>   pumvisible() ? "<C-n>" : vsnip#jumpable(1)   ? "<Plug>(vsnip-jump-next)" : "<Tab>"
    imap <expr> <S-Tab> pumvisible() ? "<C-p>" : vsnip#jumpable(-1)  ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"

    smap <expr> <Tab>   vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<Tab>"
    smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"
]])
