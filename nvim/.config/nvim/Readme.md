<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>    
</p>
</div>  

# Introduction  
Within this repository, you can find my Linux-based Nvim configuration. It encompasses the overall layout of my nvim setup, along with crucial plugins and mappings that I regularly utilize.

The primary emphasis is on ensuring durability and reducing the potential for interruptions, **achieved by providing full support exclusively for [the latest stable release of nvim](https://github.com/neovim/neovim/releases/tag/stable). Please note that backward compatibility with earlier versions is not a priority in the resource allocation.
This repo hosts my Nvim configuration for Linux.**  

## FOLDER STRUCTURE
                  
#### .config/nvim/  
```  
├── Readme.md                                          # description for the nvim config
├── init.lua                                           # entry point for nvim config
├── lazy-lock.json                                     # lazy-nvim stuff 
├── lua                                                # lua editor configs and plugin configs
│   ├── core                                           # core editor config
│   │   ├── autocmds                                   # user defined autocmds
│   │   │   └── init.lua  
│   │   ├── color-config                               # colorscheme config
│   │   │   └── init.lua  
│   │   ├── keymaps                                    # user defined mappings for editor
│   │   │   └── init.lua  
│   │   ├── lazy-nvim                                  # plugin manager
│   │   │   └── init.lua  
│   │   ├── packer-config                              # plugin manager
│   │   │   └── init.lua  
│   │   ├── settings                                   # core editor settings
│   │   │   └── init.lua  
│   │   ├── statusline                                 # user defined statusline
│   │   │   ├── icons.lua  
│   │   │   └── init.lua  
│   │   └── userFunctions                              # user defined functions
│   │       └── init.lua  
│   └── Plugins                                    # directory for plugins configuration
│       ├── autopairs-config                           # pair tags and brackets
│       │   └── init.lua  
│       ├── cmp-config                                 # completion plugins 
│       │   └── init.lua  
│       ├── colorizer-config                           # color highlighter
│       │   └── init.lua  
│       ├── comment-config                             # comment code config
│       │   └── init.lua  
│       ├── fzflua                                     # fast fuzzy finder fzf config
│       │   └── init.lua  
│       ├── gitsigns-config                            # git signs for git stuff
│       │   └── init.lua  
│       ├── goto-config                                # fancy goto definition
│       │   └── init.lua  
│       ├── harpoon                                    # marks on steriods 
│       │   └── init.lua  
│       ├── indentline-config                          # indent visuals
│       │   └── init.lua  
│       ├── init.lua  
│       ├── iswaaap-config                             # swap parameters with treesitter
│       │   └── init.lua  
│       ├── jaq-config                                 # run code in nvim
│       │   └── init.lua  
│       ├── lsp-config                                 # language server config
│       │   └── init.lua  
│       ├── lspkind-config                             # fancy symbol icons
│       │   └── init.lua  
│       ├── lspsaga-config                             # lsp-saga config
│       │   └── init.lua  
│       ├── lualine-config                             # fancy statusline
│       │   ├── custom.lua  
│       │   └── init.lua
|       |   └── ayu_mirage.lua
│       ├── mkdir-config                               # make dir within nvim 
│       │   └── init.lua  
│       ├── null-config                                # formatters and linters config
│       │   ├── builtins  
│       │   │   └── formatting  
│       │   │       └── jsbeautify.lua  
│       │   └── init.lua  
│       ├── nvimtree-config                            # main file explorer
│       │   └── init.lua  
│       ├── signature                                  # lsp signature config
│       │   └── init.lua  
│       ├── staline-config                             # fancy statusline
│       │   └── init.lua  
│       ├── symbolline-config                          # lsp and treesitter symbols
│       │   └── init.lua  
│       ├── tabbar-config                              # fancy tab bar
│       │   └── init.lua  
│       ├── _telescope-setting                         # telescope config ( fzf alternative)
│       │   └── init.lua  
│       ├── terminal-config                            # terminal within nvim
│       │   └── init.lua  
│       ├── treesitter                                 # treesitter plugins and config
│       │   └── init.lua  
│       ├── which-config                               # track keybindings while typing
│       │   └── init.lua  
│       └── winbar                                     # winbar config
│           └── init.lua  
└── snapshots                                          # editor snapshots
    └── snap_1
```
    


## Featured Plugins and Functionalities 
+ Plugin management is handled efficiently through [Lazy.nvim](https://github.com/folke/lazy.nvim).
+ Auto-completion for code, snippets, and words is powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ The Language Server Protocol (LSP) support is enabled with  [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Seamless Git integration is achieved with [Git-signs](https://github.com/lewis6991/gitsigns.nvim).
+ Better escaping from insert mode via [better-escape.vim](https://github.com/nvim-zh/better-escape.vim).
+ Ultra-fast project-wide fuzzy searching via [Telescope](https://github.com/nvim-telescope/telescope.nvim).
+ Faster code commenting with [Comment.nvim](https://github.com/numToStr/Comment.nvim).
+ auto complete tags and brackets with [nvim-autopairs](https://github.com/windwp/nvim-autopairs).
+ Effortlessly manage matching pairs (add, replace, or delete) with  [nvim-surround](https://github.com/kylechui/nvim-surround).
+ jump around the buffer content like spiderman via [hop.nvim](https://github.com/phaazon/hop.nvim).
+ Simplify snippet insertion with the power of [Luasnip](https://github.com/rafamadriz/L3MON4D3/LuaSnip).
+ Beautiful statusline with [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ File tree explorer via [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
+ Better quickfix list with [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf).
+ Command line auto-completion via [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline).
+ Customize user-defined mapping hints with [which-key.nvim](https://github.com/folke/which-key.nvim).
+ Execute code with [jaq-nvim](https://github.com/is0n/jaq-nvim).
+ Code highlighting and advanced code manipulation via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Beautiful colorscheme via [gruvbox-baby](https://github.com/luisiacc/gruvbox-baby) and other colorschemes.
+ Easily navigate throught code tags with [symbol-outline](https://github.com/simrat39/symbols-outline.nvim).
+ Ensure consistent Code formatting and code linting via [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim).
+ Undo management via [undo-tree](https://github.com/mbbill/undotree)
+ Effortlessly manage and navigate between project files with the [harpoon](https://github.com/ThePrimeagen/harpoon) plugin.
+ Get out of brackets and quotes easily with [tabout.nvim](https://github.com/abecodes/tabout.nvim)
+ Get the preview of the source code as a Map with [codewindow](https://www.github.com/gorbit99/codewindow.nvim).
+ Beautiful preview of definitions with [goto-previw](https://www.github.com/rmagatti/goto-preview).
+ Install language servers and linters and formatters with ease with [mason.nvim](https://www.github.com/williamboman/mason.nvim).
+ Open and run terminals and terminal apps with ease with [Floaterm.nvim](https://www.github.com/voldikss/vim-floaterm).
+ Color highlighter with [nvim-colorizer](https://www.github.com/norcalli/nvim-colorizer.lua).
+ Match parenthesis and code blocks with ease with [vim-mathcup](https://www.github.com/andymass/vim-matchup).
+ Check the lsp progress as file loads with [fidget.nvim](https://www.github.com/j-hui/fidget.nvim).
+ Debugging with ease using [nvim-dap](https://www.github.com/mfussenegger/nvim-dap)
+ Profile nvim startuptime [vim-startuptime](https://www.github.com/dstein64/vim-startuptime).
+ AND MUCH MORE

### Themes:  
1. gruvbox
2. gruvbox baby
3. vscode
4. tokoyonight
5. zephyr
6. catpuccin
7. nord
8. monokai-pro
9. miasama


# MAIN KEYMAPS I USE  
Most of the shortcuts i use start with Space-bar (my leader key), the shortcuts do not interfere with 
the builtin vim mappings . I dont reassign the builtin mappings because i think vim mappings should never be  
replaced as they are the core of editor. Learn vim first and then start using plugins.  
