require('Navigator').setup({
    auto_save = 'current',
})

vim.keymap.set({ 'n', 't' }, '<leader>h', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<leader>l', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<leader>k', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<leader>j', '<CMD>NavigatorDown<CR>')
