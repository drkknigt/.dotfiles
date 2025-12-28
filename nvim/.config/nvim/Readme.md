<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>    
</p>
</div>  

# Introduction  
Within this repository, you can find my Linux-based Nvim configuration. It encompasses the overall layout of my nvim setup, along with crucial plugins and mappings that I regularly utilize.

**This repo hosts my Nvim configuration for Linux.**  

## FOLDER STRUCTURE
                  
#### .config/nvim/  
```  

├── init.lua                                                            # init file for nvim
├── lazy-lock.json
├── lsp                                                                 # Native lsp config
│   ├── ansible.lua
│   ├── bash.lua
│   ├── clangd.lua
│   ├── css.lua
│   ├── emmet.lua
│   ├── go.lua
│   ├── html.lua
│   ├── lua.lua
│   ├── python.lua
│   ├── typescript.lua
│   ├── vimls.lua
│   └── yaml.lua
├── lua                                                                 # Plugins and config for editor
│   └── Drkknght
│       ├── core                                                        # Core editor configuration and functions
│       │   ├── autocmds                                                # auto commands for neovim
│       │   │   └── init.lua
│       │   ├── color-config                                            # highlights config for neovim
│       │   │   └── init.lua
│       │   ├── keymaps                                                 # Editor keymaps config
│       │   │   └── init.lua
│       │   ├── lazy-nvim                                               # Lazy package manager config
│       │   │   ├── init.lua
│       │   │   └── plugins.lua
│       │   ├── settings                                                # editor configs
│       │   │   └── init.lua
│       │   ├── statusline                                              # statusline config
│       │   │   └── init.lua
│       │   └── userFunctions                                           # helper functions and functionalities
│       │       └── init.lua
│       └── Plugins
│           ├── autopairs-config                                        # auto pairs for brackets and markup tags
│           │   └── init.lua
│           ├── blink-config                                            # completion plugin for nvim
│           │   └── init.lua
│           ├── colorizer-config                                        # show color for color code
│           │   └── init.lua
│           ├── comment-config                                          # comment plugin for neovim
│           │   └── init.lua
│           ├── dap-config                                              # debugger adapter protocol
│           │   └── init.lua
│           ├── flash-plugin                                            # instant jump to words 
│           │   └── init.lua
│           ├── fzflua                                                  # fzf-lua for fuzzy finding over stuff
│           │   └── init.lua
│           ├── gitsigns-config                                         # show git signs  and other git stuff
│           │   └── init.lua
│           ├── goto-config                                             # preview code in floats
│           │   └── init.lua
│           ├── indentline-config                                       # indents and line in code to show scopes
│           │   └── init.lua
│           ├── lsp-config                                              # setup mason and native lsp
│           │   ├── init.lua
│           │   └── mason.lua
│           ├── neovide                                                 # Neovide config
│           │   └── init.lua
│           ├── null-config                                             # Plugins for linters and formatters
│           │   ├── builtins
│           │   │   └── formatting
│           │   │       └── jsbeautify.lua
│           │   └── init.lua
│           ├── oil-config                                              # file explorer with vim like philosophy about navigation
│           │   └── init.lua
│           ├── surround                                                # surround text objects around text plugin
│           │   └── init.lua
│           ├── treesitter                                              # treesitter configuations and various treesitter plugins init
│           │   └── init.lua
│           ├── which-config                                            # track and set mappings for plugins
│              ├── buffer-mappings.lua
│              ├── debugger-mappings.lua
│              ├── fzf-mappings.lua
│              ├── git-mappings.lua
│              ├── init.lua
│              ├── lazy-mappings.lua
│              ├── lsp-mappings.lua
│              ├── misc-mappings.lua
│              ├── quickfix-mappings.lua
│              ├── telescope-mappings.lua
│              └── terminal-mappings.lua
├── Readme.md                                                          # overview of the nvim with description and some documentation 
└── snapshots                                                          # Lazy package manager snapshots for plugins
```
    


## Featured Plugins and Functionalities 
+ Plugin management is handled efficiently through [Lazy.nvim](https://github.com/folke/lazy.nvim).
+ Auto-completion for code, snippets, and words is powered by [blink-cmp](https://github.com/Saghen/blink.cmp).
+ The Language Server Protocol (LSP) support is enabled natively  
+ Seamless Git integration is achieved with [Git-signs](https://github.com/lewis6991/gitsigns.nvim) and [fugitive](https://github.com/tpope/vim-fugitive)
+ Ultra-fast project-wide fuzzy searching via [Fzf-lua](https://github.com/ibhagwan/fzf-lua).
+ Faster code commenting with [Comment.nvim](https://github.com/numToStr/Comment.nvim).
+ auto complete tags and brackets with [nvim-autopairs](https://github.com/windwp/nvim-autopairs).
+ Effortlessly manage matching pairs (add, replace, or delete) with  [nvim-surround](https://github.com/kylechui/nvim-surround).
+ jump around the buffer content  via [flash.nvim](https://github.com/folke/flash.nvim).
+ Simplify snippet insertion with the power of [Luasnip](https://github.com/rafamadriz/L3MON4D3/LuaSnip).
+ File tree explorer via [oil.nvim](https://github.com/stevearc/oil.nvim).
+ Better quickfix list with [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf).
+ Customize user-defined mapping hints with [which-key.nvim](https://github.com/folke/which-key.nvim).
+ Code highlighting and advanced code manipulation via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Beautiful colorscheme via [gruvbox-baby](https://github.com/luisiacc/gruvbox-baby) and other colorschemes.
+ Ensure consistent Code formatting and code linting via [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim).
+ Beautiful preview of definitions with [goto-previw](https://www.github.com/rmagatti/goto-preview).
+ Install language servers and linters and formatters with ease with [mason.nvim](https://www.github.com/williamboman/mason.nvim).
+ Color highlighter with [nvim-colorizer](https://www.github.com/norcalli/nvim-colorizer.lua).
+ Match parenthesis and code blocks with ease with [vim-mathcup](https://www.github.com/andymass/vim-matchup).
+ Debugging with ease using [nvim-dap](https://www.github.com/mfussenegger/nvim-dap)
+ Profile nvim startuptime [vim-startuptime](https://www.github.com/dstein64/vim-startuptime).

### Themes:  
1. gruvbox

# MAIN KEYMAPS I USE  
Most of the shortcuts i use start with Space-bar (my leader key), the shortcuts do not interfere with 
the builtin vim mappings . I dont reassign the builtin mappings because i think vim mappings should never be  
replaced as they are the core of editor. Learn vim first and then start using plugins.  
