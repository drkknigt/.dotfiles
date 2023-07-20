<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a>
      <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
    </a>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/jdhao/nvim-config/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/jdhao/nvim-config" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.9.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <a href="https://github.com/jdhao/nvim-config/search?l=vim-script">
      <img src="https://img.shields.io/github/languages/top/jdhao/nvim-config" alt="Top languages"/>
    </a>
    <a href="https://github.com/jdhao/nvim-config/graphs/commit-activity">
      <img src="https://img.shields.io/github/commit-activity/m/jdhao/nvim-config?style=flat-square" />
    </a>
    <a href="https://github.com/jdhao/nvim-config/releases/tag/v0.9.1">
      <img src="https://img.shields.io/github/commits-since/jdhao/nvim-config/v0.9.1?style=flat-square" />
    </a>
    <a href="https://github.com/jdhao/nvim-config/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/jdhao/nvim-config?style=flat-square" />
    </a>
    <a>
      <img src="https://img.shields.io/github/repo-size/jdhao/nvim-config?style=flat-square" />
    </a>
    <a href="https://github.com/jdhao/nvim-config/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/jdhao/nvim-config?style=flat-square&logo=GNU&label=License" alt="License"/>
    </a>
</p>
</div>
# NEOVIM STRUCTURE & USER-DEFINED BINDINGS  


## FOLDER STRUCTURE
                  
.config/nvim/  
```
├── ayu_mirage.lua  
├── doc.txt  
├── init.lua  
├── lazy-lock.json  
├── lua  
│   ├── core  
│   │   ├── autocmds  
│   │   │   └── init.lua  
│   │   ├── color-config  
│   │   │   └── init.lua  
│   │   ├── keymaps  
│   │   │   └── init.lua  
│   │   ├── lazy-nvim  
│   │   │   └── init.lua  
│   │   ├── packer-config  
│   │   │   └── init.lua  
│   │   ├── settings  
│   │   │   └── init.lua  
│   │   ├── statusline  
│   │   │   ├── icons.lua  
│   │   │   └── init.lua  
│   │   └── userFunctions  
│   │       └── init.lua  
│   └── userPlugins  
│       ├── autopairs-config  
│       │   └── init.lua  
│       ├── cmp-config  
│       │   └── init.lua  
│       ├── colorizer-config  
│       │   └── init.lua  
│       ├── comment-config  
│       │   └── init.lua  
│       ├── fzflua  
│       │   └── init.lua  
│       ├── gitsigns-config  
│       │   └── init.lua  
│       ├── goto-config  
│       │   └── init.lua  
│       ├── harpoon  
│       │   └── init.lua  
│       ├── indentline-config  
│       │   └── init.lua  
│       ├── init.lua  
│       ├── iswaaap-config  
│       │   └── init.lua  
│       ├── jaq-config  
│       │   └── init.lua  
│       ├── lsp-config  
│       │   └── init.lua  
│       ├── lspkind-config  
│       │   └── init.lua  
│       ├── lspsaga-config  
│       │   └── init.lua  
│       ├── lualine-config  
│       │   ├── custom.lua  
│       │   └── init.lua  
│       ├── mkdir-config  
│       │   └── init.lua  
│       ├── null-config  
│       │   ├── builtins  
│       │   │   └── formatting  
│       │   │       └── jsbeautify.lua  
│       │   └── init.lua  
│       ├── nvimtree-config  
│       │   └── init.lua  
│       ├── signature  
│       │   └── init.lua  
│       ├── staline-config  
│       │   └── init.lua  
│       ├── symbolline-config  
│       │   └── init.lua  
│       ├── tabbar-config  
│       │   └── init.lua  
│       ├── _telescope-setting  
│       │   └── init.lua  
│       ├── terminal-config  
│       │   └── init.lua  
│       ├── treesitter  
│       │   └── init.lua  
│       ├── which-config  
│       │   └── init.lua  
│       └── winbar  
│           └── init.lua  
└── snapshots  
    └── snap_1
```
    


## PLUGINS and their Mappings


#### leader-key = Space
-----------------------

### vim-startuptime: 
```viml
1. <leader>pt                    : find the startup time
2. K                             : Press `K` on events to get additional information.
3. gf                            : Press `gf` on sourcing events to load the corresponding file
4. :Startuptime --tries N        : `--tries` specifies how many startup times are averaged.
```


### nvim-tree:
```viml
1.   <leader>e : open nvim file explorer
2.   g?        : show the mappings
3.   <C-]>     : change directory
4.   <C-e>     : OPen in place
5.   <C-k>     : info on the file
6.   <2-LeftMouse> : Open                  
7.   <2-RightMouse> : CD                    
8.   <C-]>     : CD                    
9.   <C-E>     : Open: In Place        
10.  <C-K>     : Info                  
11.  <C-R>     : Rename: Omit Filename 
12.  <C-T>     : Open: New Tab         
13.  <C-V>     : Open: Vertical Split  
14.  <C-X>     : Open: Horizontal Split
15.  <BS>      : Close Directory       
16.  <CR>      : Open                  
17.  <Tab>     : Open Preview          
18.  -         : Up                    
19.  .         : Run Command           
20.  >         : Next Sibling          
21.  <         : Previous Sibling      
22.  B         : Toggle No Buffer      
23.  C         : Toggle Git Clean      
24.  D         : Trash                 
25.  E         : Expand All            
26.  F         : Clean Filter          
27.  H         : Toggle Dotfiles       
28.  I         : Toggle Git Ignore     
29.  J         : Last Sibling          
30.  K         : First Sibling         
31.  O         : Open: No Window Picker
32.  P         : Parent Directory      
33.  R         : Refresh               
34.  S         : Search                
35.  U         : Toggle Hidden         
36.  W         : Collapse              
37.  Y         : Copy Relative Path    
38.  a         : Create                
39.  bmv       : Move Bookmarked       
40.  c         : Copy                  
41.  ]c        : Next Git              
42.  [c        : Prev Git              
43.  d         : Delete                
44.  ]e        : Next Diagnostic       
45.  e         : CD                    
46.  [e        : Prev Diagnostic       
47.  f         : Filter                
48.  g?        : Help                  
49.  gy        : Copy Absolute Path    
50.  h         : Close Directory       
51.  l         : Open                  
52.  m         : Toggle Bookmark       
53.  o         : Open                  
54.  p         : Paste                 
55.  q         : Close                 
56.  r         : Rename                
57.  s         : Run System            
58.  u         : Up                    
59.  v         : Open: Vertical Split  
60.  x         : Cut                   
61.  y         : Copy Name             
62.  z         : Open: Horizontal Split

```

### themes: 
```viml
1. gruvbox
2. gruvbox baby
3. vscode
4. tokoyonight
5. zephyr
6. catpuccin
7. nord
8. monokai-pro
9. miasama
```

### nvim-cmp: 
```viml
        
1. <C-d>                  : scroll down docs
2. <C-v>                  : scroll up docs
3. <C-n>                  : select next item
4. <C-p>                  : select previous item
5. <C-y>                  : disable the cmp completion
6. <C-b>                  : abort the cmp suggestion or completion
7. <C-space>              : toggle the cmp completion
8. <C-f>                  : confirm or select the current selection completion option
```
        

### Telescope:
```viml
1. n = {
2. <c-o>         : action_layout.toggle_preview,
3. <c-e>         : actions.close,
4. <Tab>         : actions.toggle_selection + actions.move_selection_next,
5. <S-Tab>       : actions.toggle_selection + actions.move_selection_previous,
6. i = {
7. <Tab>         : actions.toggle_selection,
8. <S-Tab>       : actions.toggle_selection + actions.move_selection_previous,
9. <c-o>         : action_layout.toggle_preview,
10. <c-e>        : actions.close,
11. <c-j>        : actions.move_selection_next,
12. <c-k>        : actions.move_selection_previous,
13. <C-q>        : actions.smart_send_to_qflist,
14. <C-i>        : actions.smart_send_to_qflist,
15. <C-f>        : actions.smart_send_to_qflist + actions.open_qflist,
16. <C-c>        : close telescope
17. <C-/>        : show/toggle keymaps for particular telescope window in insert mode
18. ?            : show/toggle keymaps for particular telescope window in normal mode
19. <leader>go   : Telescope git status
20. <leader>gb   : Telescope git branches
21. <leader>gc   : Telescope git commits
22. <leader>sd   : file browser home directory
23. <leader>sm   : show manual pages in telescope
24. <leader>so   : show old files in telescope
25. <leader>sf   : fild files in telescope
26. <leader>sR   : show registers in telescope
27. <leader>sr   : resume telescope to last place
28. <leader>sk   : show all keympas in telescope
29. <leader>sc   : show all commands in telescope
30. <leader>sp   : show all projects in telescope
31. <leader>sq   : show quickfix in telescope
32. <leader>si   : show internet bookmarks in telescope
33. <leader>sb   : show buffers in telescope
34. <leader>se   : file browser current
35. <leader>ss   : live grep
36. <leader>sE   : env vairables in telescope
37. <leader>sl   : fuzzy find buffer content in telescope
38. <leader>sh   : search dotfiles in telescope

```

### Fzf-lua:
```viml
1.   <F1>       : "toggle-help",
2.   <F2>       : "toggle-fullscreen",
3.   <F3>       : "toggle-preview-wrap",
4.   <C-o>      : "toggle-preview",
5.   <F5>       : "toggle-preview-ccw",
6.   <F6>       : "toggle-preview-cw",
7.   <C-z>      : "preview-page-down",
8.   <C-u>      : "preview-page-up",
9.   <S-l>      : "preview-page-reset",
10.  ctrl-d     : "abort",
11.  ctrl-u     : "unix-line-discard",
12.  ctrl-f     : "half-page-down",
13.  ctrl-b     : "half-page-up",
14.  ctrl-a     : "select-all",
15.  ctrl-e     : "end-of-line",
16.  ctrl-g     : "toggle-all",
17.  f3         : "toggle-preview-wrap",
18.  f4         : "toggle-preview",
19.  shift-down : "preview-page-down",
20.  shift-up   : "preview-page-up",
21.  default    : actions.file_edit_or_qf,
22.  ctrl-s     : actions.file_split,
23.  ctrl-v     : actions.file_vsplit,
24.  ctrl-t     : actions.file_tabedit,
25.  ctrl-f     : actions.file_sel_to_qf,
26.  default    : actions.buf_edit,
27.  ctrl-s     : actions.buf_split,
28.  ctrl-v     : actions.buf_vsplit,
29.  ctrl-t     : actions.buf_tabedit,
30.  ctrl-t     : actions.buf_tabedit,
31.  <leader>qf : search for current word under cursor in all buffers
32.  <leader>ff : search for files in current dir
33.  <leader>fs : live grep with fzf
34.  <leader>fc : colorscheme select with fzf
35.  <leader>fb : search for lines in current buffer
36.  <leader>fl : search for lines in bufferlist
37.  <leader>fr : resume fzf 
38.  <leader>fh : search for files from home directory
39.  <leader>fw : search for current word under the cursor in active buffer
```
        

### lsp-signature:
```viml
1. <C-y>                     : toggle the signature toggle
```


### nvim-surround:
```viml

1.  ysi[object]               : surround object with object surround
2.  ysi[object]               : surround object with object surround
3.  yss                       : surround line
4.  css                       : change surround
5.  dss                       : delete surround
```


       
### nvim-treesitter:

```viml      
1.   <c-space>       : init_selection 
2.   <c-space>       : node_incremental 
3.   <c-s>           : scope_incremental 
4.   <c-backspace>   : node_decremental 
5.   <operation>[aa] : @parameter.outer
6.   <operation>[ia] : @parameter.inner
7.   <operation>[af] : @function.outer
8.   <operation>[if  : @function.inner
9.   <operation>[aq] : @conditional.outer
10.  <operation>[iq] : @conditional.inner
11.  <operation>[ar] : @loop.outer
12.  <operation>[ir] : @loop.inner
13.  <operation>[ac] : @class.outer
14.  <operation>[ic] : @class.inner
15.  <leader>fd      : function.outer
16.  <leader>fD      : class.outer
17.  ]f              : @function.outer forward search start
18.  ]c              : k@class.outer forward search start
19.  ]q              : k@conditional.outer forward search start
20.  ]r              : k@loop.outer forward search start
21.  ]s              : k@statement.outer forward search start
22.  [f              : k@function.inner backward search start
23.  [c              : k@class.inner backward search start
24.  [q              : k@conditional.inner backward search start
25.  [r              : k@loop.inner backward search start
26.  [s              : k@statement.inner backward search start
27.  <leader>nf      : @function.outer search end
28.  <leader>nc      : @class.outer search end
29.  <leader>nq      : @conditional.outer search end
30.  <leader>nr      : @loop.outer search end
31.  <leader>ns      : @statement.outer search end
32.  <leader>mf      : @function.outer search end
33.  <leader>mc      : @class.outer search end
34.  <leader>mq      : @conditional.outer search end
35.  <leader>mr      : @loop.outer search end
36.  <leader>ms      : @statement.outer search end
37.  <leader>lR      : smart_rename
38.  gnd             : goto_definition
39.  gnD             : list_definitions
40.  gO              : list_definitions_toc
41.  <C-*>           : goto_next_usage
42.  <C-#>           : goto_previous_usage
43.  <leader>a       : swap the args
44.  <leader>hs      : move to start of text object
45.  <leader>he      : move to end of text object


```


### Hop:
```viml
1 .  <leader>hw			           : HopWord
2 .  <leader>hp       	                   : HopPattern
3 .  <leader>hc				   : HopChar1
4 .  <leader>hC				   : HopChar2
5 .  <leader>hl				   : HopLine
6 .  <leader>hdw		           : delete till the HopWord
7 .  <leader>hdp			   : deltel till the HopPattern
8 .  <leader>hdc			   : delte till the HopChar1
9 .  <leader>hdC			   : delete till the HopChar2
10.  <leader>hdl			   : delete till theHopLine
11.  <leader>hkw			   : change till HopWord
12.  <leader>hkp			   : change till HopPattern
13.  <leader>hkc			   : change till HopChar1
14.  <leader>hkC			   : change till HopChar2
15.  <leader>hkl			   : change till HopLine
16.  <leader>hyw			   : copy till the HopWord
17.  <leader>hyp			   : copy till the  HopPattern
18.  <leader>hyc			   : copy till the HopChar1
19.  <leader>hyC			   : copy till the HopChar2
20.  <leader>hyl			   : copy till the HopLine
```



### vim-matchup: 
```viml   
1. %                                     : match parenthesis and other objects
```



## toggleterm:

```viml
1.  <C-\>                                :  open toggleterm
2.  <leader>tn                           :  open node terminal
3.  <leader>tm                           :  open glow 
4.  <leader>tu                           :  open ncdu disk utility
5.  <leader>tt                           :  open htop
6.  <leader>tp                           :  open python terminal
7.  <leader>tg                           :  open lazygit
8.  <leader>tl                           :  open lua terminal
9.  <leader>tf                           :  open float terminal
10. <leader>th                           :  open horizontal terminal
11. <leader>tv                           :  open vertical terminal
```

### comment:
 
```viml
1. gcc                                  : comment full line
2. gbc                                  : comment full block
3. gc[operator][object]                 : comment text object
4. gb[operator][object]                 : comment block object
5. gcO                                  : open a comment line above
6. gco                                  : open a comment line below
7. gcA                                  : Add comment at end of line
```
        




### mason:

```viml
1. <leader>lI                            : mason installer info
```


### lsp-config:

```viml
1. gD                                    : definition preview
2. gd                                    : goto definition
3. K                                     : hover definition
4. <leader>D                             : type definition
5. [d                                    : goto previous diagnostic
6. ]d                                    : goto next diagnostic
```
        


### symbol-outline:

```viml
1. <leader>st                           : open symbol-outline
2. <Esc>,q                              : close
3. <Cr>                                 : goto_location
4. o                                    : focus_location
5. <C-space>                            : hover_symbol
6. K                                    : toggle_preview
7. r                                    : rename_symbol
8. a                                    : code_actions
9. h                                    : fold
10. l                                   : unfold
11. W                                   : fold_all
12. E                                   : unfold_all
13. R                                   : fold_reset
```



### null-config:

```viml
1 <leader>lp                             : goto the definition but in a float buffer 
```



### git-signs:

```viml
1. ]g                                    : next hunk git
2. [g                                    : previous hunt git
3. <leader>gg                            : open lazygit
4. <leader>gj                            : next hunk git
5. <leader>gk                            : previous hunk git
6. <leader>ga                            : set changes in quickfix list
7. <leader>gl                            : see the line blame
8. <leader>gp                            : peview the hunk
9. <leader>gs                            : stage hunk
10. <leader>gf                           : stage buffer
11. <leader>gu                           : undo stage hunk
12. <leader>gd                           : use diff in git signs
```

### jaq-nvim:

```viml
1. <leader>r                             : Jaq run code
```




### codewindow-nvim:

```viml
1. <leader>mo                            : open the minimap
2. <leader>mc                            : close the minimap
3. <leader>mf                            : focus/unfocus the minimap
4. <leader>mm                            : toggle the minimap
```

       
### tabout.nvim:

```viml
1. <Tab>                                 : get out of the objecs
2. <S-Tab>                               : get out of the objecs
3. <C-t>
4. <C-d>
```


### undotree:

```viml
1. <leader>lu                            : open undo tree
```


### lazy-vim:

```viml
1. <leader>pi                            : Lazy install plugins
2. <leader>pu                            : Lazy update plugins
3. <leader>pc                            : Lazy clean / remove plugins
4. <leader>pp                            : Lazy open home window
```

### harpoon:

```viml
1.  <leader>ho                            : open harpoon
2.  <leader>ha                            : add file to harpoon
3.  <leader>hz                            : goto next file in harpoon
4.  <leader>hx                            : goto previous file in harpoon
5.  ]1                                    : go to 1st file in harpoon list
6.  ]2                                    : go to 2nd file in harpoon list
7.  ]3                                    : go to 3rd file in harpoon list
8.  ]4                                    : go to 4th file in harpoon list
9.  ]5                                    : go to 5th file in harpoon list
10. ]6                                    : go to 6th file in harpoon list
11. ]7                                    : go to 7th file in harpoon list
12. ]8                                    : go to 8th file in harpoon list
13. ]9                                    : go to 9th file in harpoon list
```

### editor config:

```viml
1.   [object]il                            : inside line
2.   [object]al                            : outside line
3.   <leader>hh                            : highlight current line
4.   <leader>hv                            : clear hls and clear highlight lines
5.   <leader>bo                            : delete all buffer except current
6.   <leader>be                            : delete all empty buffers
7.   <leader>be                            : delete all empty buffers
8.   jk                                    : enter normal mode
9.   kj                                    : enter normal mode
10.  <Tab>                                 : next buffer in normal mode
11.  <S-Tab>                               : previous buffer in normal mode
12.  <leader>d                             : delete the current buffer
13.  <leader>,                             : source the $MYVIMRC
14.  <leader>k                             : see the native docs
15.  <leader>c                             : make last saved session
16.  <leader>y                             : copy full text to + clipboard
17.  <leader>y                             : copy full text to + clipboard
18.  n                                     : goto next match but center the viewport
19.  N                                     : goto previous match but center the viewport
20.  <leader>z                             : open the $VIMRC
21.  <leader>n)                            : next bracket )
22.  <leader>n(                            : next bracket (
23.  <leader>m(                            : Previous bracket (
24.  <leader>m)                            : Previous bracket )
25.  ]a                                    : make a array of strings
26.  ]e                                    : make a array of chars without quotes
27.  ]e                                    : make a array of chars without quotes
28.  <leader>nv                            : find next variable
29.  <leader>mv                            : find previous variable
30.  <leader>O                             : open line above without moving cursor in normal mode
31.  <leader>o                             : open line above and below in normal mode
32.  <leader>nn                            : find next number 
33.  <leader>mn                            : find previous number 
34.  <leader>nt                            : find next bracket tag
35.  <leader>mt                            : find previous bracket tag
36.  <leader>n]                            : next bracket ]
37.  <leader>m]                            : prvious bracket ]
38.  <leader>n[                            : next bracket [
39.  <leader>m[                            : previous bracket [
40.  <leader>n{                            : next bracket {
41.  <leader>m}                            : previous bracket }
42.  <leader>n'                            : next bracket '
43.  <leader>m'                            : previous bracket '
44.  <leader>n"                            : next bracket "
45.  <leader>m"                            : previous bracket "
46.  <leader>n`                            : next bracket `
47.  <leader>m`                            : previous bracket `
48.  <leader>ne                            : next  =
49.  <leader>me                            : previous  =
50.  <leader>na                            : next  +
51.  <leader>ma                            : previous  +
52.  <leader>ns                            : next  -
53.  <leader>ms                            : previous  -
54.  <leader>nd                            : next  _
55.  <leader>md                            : previous  _
56.  <leader>w                             : save current buffer
57.  <leader>pz                            : open lazy config
58.  <leader>ps                            : source current file
59.  <leader>qw                            : search for current word under cursor place results in qfix
60.  <leader>qq                            : open qfixlist
61.  <leader>qe                            : close qfixlist
62.  <leader>ql                            : open locationlist
63.  <leader>qo                            : close locationlist
64.  <leader>la                            : code action
65.  <leader>ld                            : diagnostic results in qfix
66.  <leader>lx                            : make current file executable
67.  <leader>lw                            : workplace diagnostic in qfix
68.  <leader>li                            : lspinfo of current file
69.  <leader>ll                            : lspstart
70.  <leader>lq                            : lsp stop
71.  <leader>lr                            : document references
72.  <leader>ls                            : document symbols
73.  <leader>le                            : document diagnostic hover on current line
74.  <leader>lS                            : document symbols for workspace
```
