:set number 
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set wrap
:syntax on
:set cursorline
:set cursorcolumn
:set clipboard=unnamedplus

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

call plug#begin()

Plug 'numToStr/Comment.nvim'
" Plug "rafamadriz/friendly-snippets"
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'https://github.com/preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'https://github.com/vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'wakatime/vim-wakatime' " Wakatime integration
Plug 'mhinz/vim-startify'
Plug 'andweeb/presence.nvim'
Plug 'dominikduda/vim_current_word'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'

call plug#end()

set encoding=UTF-8

" Keymapping
nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-k> :NERDTreeToggle<CR>
nnoremap <C-h> :ToggleTerm size=20 dir=./ direction=horizontal<CR>
nnoremap <C-v> :ToggleTerm size=80 dir=./ direction=vertical<CR> 

nnoremap <C-z> :set number
nnoremap <C-x> :set relativenumber

" Airline 

let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v']) 
:let g:airline_theme='kolor'
" let g:airline_extensions = ['hunks', 'branch', 'tabline']

" Plugin afterwork 

au BufWritePost * GitGutter
au BufEnter * GitGutter

hi CurrentWord ctermbg=23
hi CurrentWordTwins ctermbg=237

lua require("toggleterm").setup()
nmap <F8> :TagbarToggle<CR>
:set completeopt-=preview " For No Previews
:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Enable deoplete
let g:deoplete#enable_at_startup = 1

let g:startify_custom_header =
	\ startify#pad(readfile('/home/sidon/.config/nvim/ascii.txt'))




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'"

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","





lua require('Comment').setup()

" let g:vsnip_filetypes.ruby = ['rails']


lua << EOF
require("nvim-autopairs").setup {}
   -- Set up nvim-cmp.
  local cmp = require'cmp' 

  cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })



EOF
