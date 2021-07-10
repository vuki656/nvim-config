local module = {
    remap = {
        opts = {
            noremap = true,
            silent = true,
        },
        fn = vim.api.nvim_set_keymap
    },
}

return module
