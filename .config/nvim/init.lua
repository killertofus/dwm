vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 30
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
        if require("lazy.status").has_updates then
            require("lazy").update({ show = false, })
        end
    end,
})



vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]



vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})



-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Plugins
local plugins = 
{'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },





{'tpope/vim-sleuth'},
{ 'Bilal2453/luvit-meta', lazy = true },
{'ap/vim-css-color'},








{
  'saghen/blink.cmp',
  lazy = false,

  dependencies = 'rafamadriz/friendly-snippets',

   version = 'v0.*',
   opts = {

    keymap = { preset = 'super-tab' },

    highlight = {
      use_nvim_cmp_as_default = true,
    },
       nerd_font_variant = 'mono',


  }
},



{
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end
},













{
  "roobert/tailwindcss-colorizer-cmp.nvim",

  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
},



  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",

    config = function()
      require("sniprun").setup({
	      display = {"NvimNotify"},
      })
    end,
  },

{
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },

{
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	keys = {
		{
			"<C-f>",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
},




{
    "OXY2DEV/markview.nvim",
    lazy = false,


    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    }
},




{
    "rolv-apneseth/tfm.nvim",
    config = function()
        vim.api.nvim_set_keymap("n", "<C-t>", "", {
            noremap = true,
            callback = require("tfm").open,
        })
    end,
},

{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},




{
  "lervag/vimtex",
  lazy = false,
  init = function()
      vim.g.vimtex_view_method = "zathura"
  end
},






{"folke/noice.nvim",
	event = "VeryLazy",
  opts = {
  },
  dependencies = {
       "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    },







}




    }








local opts ={ }
require("lazy").setup(plugins, opts)



vim.o.inccommand = "split"






require('lualine').setup { 
options = { theme = 'dracula' 
}
}





-- KeyBindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-r>', '<Cmd>SnipRun<CR>')
vim.keymap.set('n','/', builtin.live_grep, { desc = 'Telescope live grep' })
