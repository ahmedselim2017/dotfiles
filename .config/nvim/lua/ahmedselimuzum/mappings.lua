-- Leader keys
vim.g.mapleader = 'ş'
vim.g.maplocalleader = 'ç'


-- General mappings
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('c', 'Q', 'quitall!', { noremap = true, silent = false })
vim.keymap.set('c', 'Q', function()
    return vim.fn.getcmdtype() == ':' and 'quitall!' or 'Q'
end, { expr = true })

-- hlsearch
vim.api.nvim_set_keymap('n', '<Leader><Esc>', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Leader><Esc>', '<Esc>:set hlsearch!<CR>i', { noremap = true, silent = true })

-- Better movement
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '{', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', 'g_', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'J', '}', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', '{', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'L', 'g_', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Shift><C-H>', '<A-left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Shift><C-J>', '<A-down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Shift><C-K>', '<A-up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Shift><C-L>', '<A-right>', { noremap = true, silent = true })

-- Better indenting
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', '<C-k>', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-j>', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Better change
vim.api.nvim_set_keymap('o', 'in(', ':<C-u>normal! f(vi(<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in{', ':<C-u>normal! f{vi{<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in[', ':<C-u>normal! f[vi[<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in"', ':<C-u>normal! f"vi"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', "in'", ":<C-u>normal! f'vi'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in`', ':<C-u>normal! f`vi`<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'in<', ':<C-u>normal! f<vi<<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('o', 'ip(', ':<C-u>normal! F(vi(<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ip{', ':<C-u>normal! F{vi{<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ip[', ':<C-u>normal! F[vi[<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ip"', ':<C-u>normal! F"vi"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', "ip'", ":<C-u>normal! F'vi'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ip`', ':<C-u>normal! F`vi`<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ip<', ':<C-u>normal! F<vi<<CR>', { noremap = true, silent = true })
