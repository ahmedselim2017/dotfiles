local set = vim.opt

-- General settings
set.showcmd = true
set.showmatch = true
set.title = true
set.lazyredraw = true
set.termguicolors = true
-- hi Normal guibg=NONE ctermbg=NONE
-- vim.api.nvim_set_hl(0, "Normal", { guibg=nil, ctermbg=nil })

-- Better tabs
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- Clipboard
set.pastetoggle = "<F2>"
set.clipboard = "unnamedplus"

-- Line numbers
set.number = true
set.relativenumber = true
set.wrap = false
set.colorcolumn = "80"
set.signcolumn = "yes"
-- vim.api.nvim_set_hl('ColorColumn', { ctermbg = 1 }, false)
-- vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=1 })
-- vim.highlight.create('LineNr', { term = bold, cterm = nil, ctermfg = DarkGrey, ctermbg = nil }, false) 

-- Fuzzy Search
set.wildmenu = true
-- set.path = set.path + "**"

-- Search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- Split
-- vim.highlight.create('VertSplit', { ctermfg = 0, ctermbg = 9}, false)
-- vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = 0, ctermbg = 9})
set.fillchars = "vert:|"
set.splitright = false
set.splitbelow = true

-- History and undo
set.history = 1000
set.undolevels = 1000
set.undofile = true
set.undodir = "/tmp"

