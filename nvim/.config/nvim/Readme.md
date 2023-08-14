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
+ Open and run terminals and terminal apps with ease with [toggleterm.nvim](https://www.github.com/akinsho/toggleterm.nvim).
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

# SHORTCUTS

### vim-startuptime: 

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<leader>pt`           |   Normal   |  Find the startup time |                                                    |
| 2. K                      |   Normal   |  Press `K` on events to get additional information.                        |
| 3. gf                     |   Normal   |  Press `gf` on sourcing events to load the corresponding file              |
| 4. :Startuptime --tries N |    Ex      |  `--tries` specifies how many startup times are averaged.                  |


### nvim-tree:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.   `<leader>e` | Normal  |  open nvim file explorer |
| 2.   g?        | Normal  |  show the mappings       |
| 3.   `<C-]>`     | Normal  |  change directory        |
| 4.   `<C-e>`     | Normal  |  OPen in place           |
| 5.   `<C-k>`     | Normal  | info on the file         |
| 6.   `<2-LeftMouse>` | Normal |  Open      |            
| 7.   `<2-RightMouse>` | Normal |   CD      |              
| 8.   `<C-]>`     | Normal   |  CD     |               
| 9.   `<C-E>`     | Normal   |  Open: In Place |        
| 10.  `<C-K>`     | Normal   | Info  |                
| 11.  `<C-R>`     | Normal   | Rename: Omit Filename |
| 12.  `<C-T>`     | Normal   |  Open: New Tab       |        
| 13.  `<C-V>`     | Normal   | Open: Vertical Split | 
| 14.  `<C-X>`     | Normal   | Open: Horizontal Split  |
| 15.  `<BS>`      | Normal   | Close Directory         |
| 16.  `<CR>`      | Normal   | Open                    |
| 17.  `<Tab>`     | Normal   |: Open Preview            |
| 18.  -         | Normal   | Up                      |
| 19.  .         | Normal   | Run Command             |
| 20.  >         | Normal   | Next Sibling            |
| 21.  <         | Normal   | Previous Sibling        |
| 22.  B         | Normal   | Toggle No Buffer        |
| 23.  C         | Normal   | Toggle Git Clean        |
| 24.  D         | Normal   | Trash                   |
| 25.  E         | Normal   | Expand All              |
| 26.  F         | Normal   | Clean Filter            |
| 27.  H         | Normal   | Toggle Dotfiles         |
| 28.  I         | Normal   | Toggle Git Ignore       |
| 29.  J         | Normal   | Last Sibling            |
| 30.  K         | Normal   | First Sibling           |
| 31.  O         | Normal   | Open: No Window Picker  |
| 32.  P         | Normal   | Parent Directory        |
| 33.  R         | Normal   | Refresh                 |
| 34.  S         | Normal   | Search                  |
| 35.  U         | Normal   | Toggle Hidden           |
| 36.  W         | Normal   | Collapse                |
| 37.  Y         | Normal   | Copy Relative Path      |
| 38.  a         | Normal   | Create                  |
| 39.  bmv       | Normal   | Move Bookmarked         |
| 40.  c         | Normal   | Copy                    |
| 41.  ]c        | Normal   | Next Git                |
| 42.  [c        | Normal   | Prev Git                |
| 43.  d         | Normal   | Delete                  |
| 44.  ]e        | Normal   | Next Diagnostic         |
| 45.  e         | Normal   | CD                      |
| 46.  [e        | Normal   | Prev Diagnostic         |
| 47.  f         | Normal   | Filter                  |
| 48.  g?        | Normal   | Help                    |
| 49.  gy        | Normal   | Copy Absolute Path      |
| 50.  h         | Normal   | Close Directory         |
| 51.  l         | Normal   | Open                    |
| 52.  m         | Normal   | Toggle Bookmark         |
| 53.  o         | Normal   | Open                    |
| 54.  p         | Normal   | Paste                   |
| 55.  q         | Normal   | Close                   |
| 56.  r         | Normal   | Rename                  |
| 57.  s         | Normal   | Run System              |
| 58.  u         | Normal   | Up                      |
| 59.  v         | Normal   | Open: Vertical Split    |
| 60.  x         | Normal   | Cut                     |
| 61.  y         | Normal   | Copy Name               |
| 62.  z         | Normal   | Open: Horizontal Split  |


### nvim-cmp: 
|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<C-d>`   | Insert |                   scroll down docs |
| 2. `<C-v>`   | Insert |                   scroll up docs |
| 3. `<C-n>`   | Insert |                   select next item |
| 4. `<C-p>`   | INsert |                   select previous item |
| 5. `<C-y>`   | Insert |                   disable the cmp completion |
| 6. `<C-b>`   | Insert |                   abort the cmp suggestion or completion |
| 7. `<C-space>`   | Insert |               toggle the cmp completion |
| 8. `<C-f>`   | Insert |                   confirm or select the current selection completion option |


### Telescope:
|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<c-o>`         | Normal | action_layout.toggle_preview, |
| 2. `<c-e>`         | Normal | actions.close, |
| 3. `<Tab>`         | Normal | actions.toggle_selection + actions.move_selection_next, |
| 4. `<S-Tab>`       | Normal | actions.toggle_selection + actions.move_selection_previous, |
| 5. `<Tab>`         | insert | actions.toggle_selection, |
| 6. `<S-Tab>`       | insert | actions.toggle_selection + actions.move_selection_previous, |
| 7. `<c-o>`         | insert | action_layout.toggle_preview, |
| 8. `<c-e>`         | insert | actions.close, |
| 9. `<c-j>`         | insert | actions.move_selection_next, |
| 10. `<c-k>`        | insert | actions.move_selection_previous, |
| 11. `<C-q>`        | insert | actions.smart_send_to_qflist, |
| 12. `<C-i>`        | insert | actions.smart_send_to_qflist, |
| 13. `<C-f>`        | insert | actions.smart_send_to_qflist + actions.open_qflist, |
| 14. `<C-c>`        | insert | close telescope |
| 15. `<C-/>`        | insert | show/toggle keymaps for particular telescope window in insert mode |
| 16. ?            | Normal | show/toggle keymaps for particular telescope window in normal mode |
| 17. `<leader>`go   | Normal | Telescope git status |
| 18. `<leader>`gb   | Normal | Telescope git branches |
| 19. `<leader>`gc   | Normal | Telescope git commits |
| 20. `<leader>`sd   | Normal | file browser home directory |
| 21. `<leader>`sm   | Normal | show manual pages in telescope |
| 22. `<leader>`so   | Normal | show old files in telescope |
| 23. `<leader>`sf   | Normal | fild files in telescope |
| 24. `<leader>`sR   | Normal | show registers in telescope |
| 25. `<leader>`sr   | Normal | resume telescope to last place |
| 26. `<leader>`sk   | Normal | show all keympas in telescope |
| 27. `<leader>`sc   | Normal | show all commands in telescope |
| 28. `<leader>`sp   | Normal | show all projects in telescope |
| 29. `<leader>`sq   | Normal | show quickfix in telescope |
| 30. `<leader>`si   | Normal | show internet bookmarks in telescope |
| 31. `<leader>`sb   | Normal | show buffers in telescope |
| 32. `<leader>`se   | Normal | file browser current |
| 33. `<leader>`ss   | Normal | live grep |
| 34. `<leader>`sE   | Normal | env vairables in telescope |
| 35. `<leader>`sl   | Normal | fuzzy find buffer content in telescope |
| 36. `<leader>`sh   | Normal | search dotfiles in telescope |



### Fzf-lua:

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.   `<F1>`       | Normal |   "toggle-help", |
| 2.   `<F2>`       | Normal |   "toggle-fullscreen", |
| 3.   `<F3>`       | Normal |   "toggle-preview-wrap", |
| 4.   `<C-o>`      | Normal |   "toggle-preview", |
| 5.   `<F5>`       | Normal |   "toggle-preview-ccw", |
| 6.   `<F6>`       | Normal |   "toggle-preview-cw", |
| 7.   `<C-z>`      | Normal |   "preview-page-down", |
| 8.   `<C-u>`      | Normal |   "preview-page-up", |
| 9.   `<S-l>`      | Normal |   "preview-page-reset", |
| 10.  ctrl-d     | Normal |   "abort", |
| 11.  ctrl-u     | Normal |   "unix-line-discard", |
| 12.  ctrl-f     | Normal |   "half-page-down", |
| 13.  ctrl-b     | Normal |   "half-page-up", |
| 14.  ctrl-a     | Normal |   "select-all", |
| 15.  ctrl-e     | Normal |   "end-of-line", |
| 16.  ctrl-g     | Normal |   "toggle-all", |
| 17.  f3         | Normal |   "toggle-preview-wrap", |
| 18.  f4         | Normal |   "toggle-preview", |
| 19.  shift-down | Normal |   "preview-page-down", |
| 20.  shift-up   | Normal |   "preview-page-up", |
| 21.  default    | Normal |   actions.file_edit_or_qf, |
| 22.  ctrl-s     | Normal |   actions.file_split, |
| 23.  ctrl-v     | Normal |   actions.file_vsplit, |
| 24.  ctrl-t     | Normal |   actions.file_tabedit, |
| 25.  ctrl-f     | Normal |   actions.file_sel_to_qf, |
| 26.  default    | Normal |   actions.buf_edit, |
| 27.  ctrl-s     | Normal |   actions.buf_split, |
| 28.  ctrl-v     | Normal |   actions.buf_vsplit, |
| 29.  ctrl-t     | Normal |   actions.buf_tabedit, |
| 30.  ctrl-t     | Normal |   actions.buf_tabedit, |
| 31.  `<leader>`qf | Normal |   search for current word under cursor in all buffers |
| 32.  `<leader>`ff | Normal |   search for files in current dir |
| 33.  `<leader>`fs | Normal |   live grep with fzf |
| 34.  `<leader>`fc | Normal |   colorscheme select with fzf |
| 35.  `<leader>`fb | Normal |   search for lines in current buffer |
| 36.  `<leader>`fl | Normal |   search for lines in bufferlist |
| 37.  `<leader>`fr | Normal |   resume fzf  |
| 38.  `<leader>`fh | Normal |   search for files from home directory |
| 39.  `<leader>`fw | Normal |   search for current word under the cursor in active buffer |

        

### lsp-signature:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<C-y>`                | Normal / insert |      toggle the signature toggle |



### nvim-surround:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.  ysi[object]               | Normal |  surround object with object surround |
| 2.  ysi[object]               | Normal |  surround object with object surround |
| 3.  yss                       | Normal |  surround line |
| 4.  css                       | Normal |  change surround |
| 5.  dss                       | Normal |  delete surround |




       
### nvim-treesitter:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.   `<c-space>`       | Normal |   init_selection  |
| 2.   `<c-space>`       | Normal |   node_incremental  |
| 3.   `<c-s>`           | Normal |   scope_incremental  |
| 4.   `<c-backspace>`   | Normal |   node_decremental  |
| 5.   `<operation>`[aa] | Normal |   @parameter.outer |
| 6.   `<operation>`[ia] | Normal |   @parameter.inner |
| 7.   `<operation>`[af] | Normal |   @function.outer |
| 8.   `<operation>`[if  | Normal |   @function.inner |
| 9.   `<operation>`[aq] | Normal |   @conditional.outer |
| 10.  `<operation>`[iq] | Normal |   @conditional.inner |
| 11.  `<operation>`[ar] | Normal |   @loop.outer |
| 12.  `<operation>`[ir] | Normal |   @loop.inner |
| 13.  `<operation>`[ac] | Normal |   @class.outer |
| 14.  `<operation>`[ic] | Normal |   @class.inner |
| 15.  `<leader>`fd      | Normal |   function.outer |
| 16.  `<leader>`fD      | Normal |   class.outer |
| 17.  ]f              | Normal |   @function.outer forward search start |
| 18.  ]c              | Normal |   k@class.outer forward search start |
| 19.  ]q              | Normal |   k@conditional.outer forward search start |
| 20.  ]r              | Normal |   k@loop.outer forward search start |
| 21.  ]s              | Normal |   k@statement.outer forward search start |
| 22.  [f              | Normal |   k@function.inner backward search start |
| 23.  [c              | Normal |   k@class.inner backward search start |
| 24.  [q              | Normal |   k@conditional.inner backward search start |
| 25.  [r              | Normal |   k@loop.inner backward search start |
| 26.  [s              | Normal |   k@statement.inner backward search start |
| 27.  `<leader>`nf      | Normal |   @function.outer search end |
| 28.  `<leader>`nc      | Normal |   @class.outer search end |
| 29.  `<leader>`nq      | Normal |   @conditional.outer search end |
| 30.  `<leader>`nr      | Normal |   @loop.outer search end |
| 31.  `<leader>`ns      | Normal |   @statement.outer search end |
| 32.  `<leader>`mf      | Normal |   @function.outer search end |
| 33.  `<leader>`mc      | Normal |   @class.outer search end |
| 34.  `<leader>`mq      | Normal |   @conditional.outer search end |
| 35.  `<leader>`mr      | Normal |   @loop.outer search end |
| 36.  `<leader>`ms      | Normal |   @statement.outer search end |
| 37.  `<leader>`lR      | Normal |   smart_rename |
| 38.  gnd             | Normal |   goto_definition |
| 39.  gnD             | Normal |   list_definitions |
| 40.  gO              | Normal |   list_definitions_toc |
| 41.  `<C-*>`           | Normal |   goto_next_usage |
| 42.  `<C-#>`           | Normal |   goto_previous_usage |
| 43.  `<leader>`a       | Normal |   swap the args |
| 44.  `<leader>`hs      | Normal |   move to start of text object |
| 45.  `<leader>`he      | Normal |   move to end of text object |




### Hop: 

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1 .  `<leader>`hw	| Normal |		            HopWord |
| 2 .  `<leader>`hp 	| Normal |      	                    HopPattern |
| 3 .  `<leader>`hc 	| Normal |  			    HopChar1 |
| 4 .  `<leader>`hC 	| Normal |  			    HopChar2 |
| 5 .  `<leader>`hl 	| Normal |  			    HopLine |
| 6 .  `<leader>`hdw	| Normal |		            delete till the HopWord |
| 7 .  `<leader>`hdp	| Normal |			    deltel till the HopPattern |
| 8 .  `<leader>`hdc	| Normal |			    delte till the HopChar1 |
| 9 .  `<leader>`hdC	| Normal |			    delete till the HopChar2 |
| 10.  `<leader>`hdl	| Normal |			    delete till theHopLine |
| 11.  `<leader>`hkw	| Normal |			    change till HopWord |
| 12.  `<leader>`hkp	| Normal |			    change till HopPattern |
| 13.  `<leader>`hkc	| Normal |			    change till HopChar1 |
| 14.  `<leader>`hkC	| Normal |			    change till HopChar2 |
| 15.  `<leader>`hkl	| Normal |			    change till HopLine |
| 16.  `<leader>`hyw	| Normal |			    copy till the HopWord |
| 17.  `<leader>`hyp	| Normal |			    copy till the  HopPattern |
| 18.  `<leader>`hyc	| Normal |			    copy till the HopChar1 |
| 19.  `<leader>`hyC	| Normal |			    copy till the HopChar2 |
| 20.  `<leader>`hyl	| Normal |			    copy till the HopLine |




### vim-matchup:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. % | Normal |   match parenthesis and other objects  |




### toggleterm:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.  `<C-\>`      | Normal |                             open toggleterm |
| 2.  `<leader>`tn | Normal |                             open node terminal |
| 3.  `<leader>`tm | Normal |                             open glow  |
| 4.  `<leader>`tu | Normal |                             open ncdu disk utility |
| 5.  `<leader>`tt | Normal |                             open htop |
| 6.  `<leader>`tp | Normal |                             open python terminal |
| 7.  `<leader>`tg | Normal |                             open lazygit |
| 8.  `<leader>`tl | Normal |                             open lua terminal |
| 9.  `<leader>`tf | Normal |                             open float terminal |
| 10. `<leader>`th | Normal |                             open horizontal terminal |
| 11. `<leader>`tv | Normal |                             open vertical terminal |



### comment:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. gcc                                  | Normal |  comment full line |
| 2. gbc                                  | Normal |  comment full block |
| 3. gc[operator][object]                 | Normal |  comment text object |
| 4. gb[operator][object]                 | Normal |  comment block object |
| 5. gcO                                  | Normal |  open a comment line above |
| 6. gco                                  | Normal |  open a comment line below |
| 7. gcA                                  | Normal |  Add comment at end of line |


        




### mason:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<leader>`lI                            : mason installer info



### lsp-config:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. gD                                    | Normal |  definition preview |
| 2. gd                                    | Normal |  goto definition |
| 3. K                                     | Normal |  hover definition |
| 4. `<leader>`D                             | Normal |  type definition |
| 5. [d                                    | Normal |  goto previous diagnostic |
| 6. ]d                                    | Normal |  goto next diagnostic |


        


### symbol-outline:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<leader>`st                           | Normal | open symbol-outline | 
| 2. `<Esc>`,q                              | Normal | close | 
| 3. `<Cr>`                                 | Normal | goto_location | 
| 4. o                                    | Normal | focus_location | 
| 5. `<C-space>`                            | Normal | hover_symbol | 
| 6. K                                    | Normal | toggle_preview | 
| 7. r                                    | Normal | rename_symbol | 
| 8. a                                    | Normal | code_actions | 
| 9. h                                    | Normal | fold | 
| 10. l                                   | Normal | unfold | 
| 11. W                                   | Normal | fold_all | 
| 12. E                                   | Normal | unfold_all | 
| 13. R                                   | Normal | fold_reset | 




### null-config:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1 `<leader>`lp  | Normal |                             : goto the definition but in a float buffer | 



### git-signs:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. ]g          | Normal |                             next hunk git |
| 2. [g          | Normal |                             previous hunt git |
| 3. `<leader>`gg  | Normal |                             open lazygit |
| 4. `<leader>`gj  | Normal |                             next hunk git |
| 5. `<leader>`gk  | Normal |                             previous hunk git |
| 6. `<leader>`ga  | Normal |                             set changes in quickfix list |
| 7. `<leader>`gl  | Normal |                             see the line blame |
| 8. `<leader>`gp  | Normal |                             peview the hunk |
| 9. `<leader>`gs  | Normal |                             stage hunk |
| 10. `<leader>`gf | Normal |                             stage buffer |
| 11. `<leader>`gu | Normal |                             undo stage hunk |
| 12. `<leader>`gd | Normal |                             use diff in git signs |




### jaq-nvim:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<leader>`r | Normal |                              : Jaq run code |





### codewindow-nvim:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<leader>`mo | Normal |                              open the minimap | 
| 2. `<leader>`mc | Normal |                              close the minimap | 
| 3. `<leader>`mf | Normal |                              focus/unfocus the minimap | 
| 4. `<leader>`mm | Normal |                              toggle the minimap | 



       
### tabout.nvim:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1. `<Tab>` |    Insert |                             get out of the objecs | 
| 2. `<S-Tab>` |  Insert |                              get out of the objecs | 
| 3. `<C-t>` |    Insert |                                                       | 
| 4. `<C-d>` |    Insert |                                                    | 




### undotree:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------| 
| 1. `<leader>`lu             | Normal     |                 open undo tree                                              |


### lazy-vim:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------| 
| 1. `<leader>`pi | Normal    |                            Lazy install plugins   |
| 2. `<leader>`pu | Normal    |                        Lazy update plugins        |
| 3. `<leader>`pc | Normal    |                       Lazy clean / remove plugins  |
| 4. `<leader>`pp | Normal    |                        Lazy open home window       |


### harpoon:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.  <leader>ho | Normal |                             open harpoon |
| 2.  <leader>ha | Normal |                             add file to harpoon |
| 3.  <leader>hz | Normal |                             goto next file in harpoon |
| 4.  <leader>hx | Normal |                             goto previous file in harpoon |
| 5.  ]1         | Normal |                             go to 1st file in harpoon list |
| 6.  ]2         | Normal |                             go to 2nd file in harpoon list |
| 7.  ]3         | Normal |                             go to 3rd file in harpoon list |
| 8.  ]4         | Normal |                             go to 4th file in harpoon list |
| 9.  ]5         | Normal |                             go to 5th file in harpoon list |
| 10. ]6         | Normal |                             go to 6th file in harpoon list |
| 11. ]7         | Normal |                             go to 7th file in harpoon list |
| 12. ]8         | Normal |                             go to 8th file in harpoon list |
| 13. ]9         | Normal |                             go to 9th file in harpoon list |


### editor config:  

|     Shortcut              |   Mode     |       Description                                                           |  
|---------------------------|------------|-----------------------------------------------------------------------------|  
| 1.   [object]il | Normal |                             inside line |
| 2.   [object]al | Normal |                             outside line |
| 3.   `<leader>`hh | Normal |                             highlight current line |
| 4.   `<leader>`hv | Normal |                             clear hls and clear highlight lines |
| 5.   `<leader>`bo | Normal |                             delete all buffer except current |
| 6.   `<leader>`be | Normal |                             delete all empty buffers |
| 7.   `<leader>`be | Normal |                             delete all empty buffers |
| 8.   jk         | Normal |                             enter normal mode |
| 9.   kj         | Normal |                             enter normal mode |
| 10.  `<Tab>`      | Normal |                             next buffer in normal mode |
| 11.  `<S-Tab>`    | Normal |                             previous buffer in normal mode |
| 12.  `<leader>`d  | Normal |                             delete the current buffer |
| 13.  `<leader>`,  | Normal |                             source the $MYVIMRC |
| 14.  `<leader>`k  | Normal |                             see the native docs |
| 15.  `<leader>`c  | Normal |                             make last saved session |
| 16.  `<leader>`y  | Normal |                             copy full text to + clipboard |
| 17.  `<leader>`y  | Normal |                             copy full text to + clipboard |
| 18.  n          | Normal |                             goto next match but center the viewport |
| 19.  N          | Normal |                             goto previous match but center the viewport |
| 20.  `<leader>`z  | Normal |                             open the $VIMRC |
| 21.  `<leader>`n) | Normal |                             next bracket ) |
| 22.  `<leader>`n( | Normal |                             next bracket ( |
| 23.  `<leader>`m( | Normal |                             Previous bracket ( |
| 24.  `<leader>`m) | Normal |                             Previous bracket ) |
| 25.  ]a         | Normal |                             make a array of strings |
| 26.  ]e         | Normal |                             make a array of chars without quotes |
| 27.  ]e         | Normal |                             make a array of chars without quotes |
| 28.  `<leader>`nv | Normal |                             find next variable |
| 29.  `<leader>`mv | Normal |                             find previous variable |
| 30.  `<leader>`O  | Normal |                             open line above without moving cursor in normal mode |
| 31.  `<leader>`o  | Normal |                             open line above and below in normal mode |
| 32.  `<leader>`nn | Normal |                             find next number  |
| 33.  `<leader>`mn | Normal |                             find previous number  |
| 34.  `<leader>`nt | Normal |                             find next bracket tag |
| 35.  `<leader>`mt | Normal |                             find previous bracket tag |
| 36.  `<leader>`n] | Normal |                             next bracket ] |
| 37.  `<leader>`m] | Normal |                             prvious bracket ] |
| 38.  `<leader>`n[ | Normal |                             next bracket [ |
| 39.  `<leader>`m[ | Normal |                             previous bracket [ |
| 40.  `<leader>`n{ | Normal |                             next bracket { |
| 41.  `<leader>`m} | Normal |                             previous bracket } |
| 42.  `<leader>`n' | Normal |                             next bracket ' |
| 43.  `<leader>`m' | Normal |                             previous bracket ' |
| 44.  `<leader>`n" | Normal |                             next bracket " |
| 45.  `<leader>`m" | Normal |                             previous bracket " |
| 46.  `<leader>`n` | Normal |                             next bracket ` |
| 47.  `<leader>`m` | Normal |                             previous bracket ` |
| 48.  `<leader>`ne | Normal |                             next  = |
| 49.  `<leader>`me | Normal |                             previous  = |
| 50.  `<leader>`na | Normal |                             next  + |
| 51.  `<leader>`ma | Normal |                             previous  + |
| 52.  `<leader>`ns | Normal |                             next  - |
| 53.  `<leader>`ms | Normal |                             previous  - |
| 54.  `<leader>`nd | Normal |                             next  _ |
| 55.  `<leader>`md | Normal |                             previous  _ |
| 56.  `<leader>`w  | Normal |                             save current buffer |
| 57.  `<leader>`pz | Normal |                             open lazy config |
| 58.  `<leader>`ps | Normal |                             source current file |
| 59.  `<leader>`qw | Normal |                             search for current word under cursor place results in qfix |
| 60.  `<leader>`qq | Normal |                             open qfixlist |
| 61.  `<leader>`qe | Normal |                             close qfixlist |
| 62.  `<leader>`ql | Normal |                             open locationlist |
| 63.  `<leader>`qo | Normal |                             close locationlist |
| 64.  `<leader>`la | Normal |                             code action |
| 65.  `<leader>`ld | Normal |                             diagnostic results in qfix |
| 66.  `<leader>`lx | Normal |                             make current file executable |
| 67.  `<leader>`lw | Normal |                             workplace diagnostic in qfix |
| 68.  `<leader>`li | Normal |                             lspinfo of current file |
| 69.  `<leader>`ll | Normal |                             lspstart |
| 70.  `<leader>`lq | Normal |                             lsp stop |
| 71.  `<leader>`lr | Normal |                             document references |
| 72.  `<leader>`ls | Normal |                             document symbols |
| 73.  `<leader>`le | Normal |                             document diagnostic hover on current line |
| 74.  `<leader>`lS | Normal |                             document symbols for workspace |
| 74.  `<leader>`lg | Normal |                             document implementation |


