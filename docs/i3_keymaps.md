# I3WM & SWAY KEYMAPS: 
                                 
## Volume:  
   - alt + ]               ----->   volume up 10% (pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status )
   - alt + [               ----->   volume down 10% (pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status )
   - alt + ctrl + m        ----->   mute volume (pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status)
   - XF86AudioLowerVolume  --->  volume down 10% pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
   - XF86AudioRaiseVolume  --->  volume up 10% (pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status)
   - XF86AudioMute         ----->  mute volume (pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status)
    
## Monitor & Screen:  
   - alt + s + s       ----->  set resolution for monitors (resolution.sh | resolution_sway.sh)
   - alt + s + c       ----->  set custom resolution for monitors (sway only)
   - alt + s + 1       ----->  scale monitor 1  (scale.sh 0 | scale_sway.sh 0)
   - alt + s + 2       ----->  scale monitor 2  (scale.sh 1 | scale_sway.sh 1)
   - alt + s + l       ----->  change monitor 1 background (change_background.sh 0 | change_bacground_sway.sh 0)
   - alt + s + r       ----->  change monitor 1 background (change_background.sh 1 | change_bacground_sway.sh 1)
   - alt + s + d       ----->  change sddm display manager background (change_sddm_background.sh)
   - alt + "+"         ----->  screen brightness up (brightnessctl set +3%)
   - alt + "-"         ----->  screen brightness down (brightnessctl set +3%)

## Starting Applications: 
   - alt + return     -------> open alacritty terminal (alacritty -t "startup")
   - alt + a + c      -------> open color picker (kcolorchooser)
   - alt + a + b      -------> open brave browser (brave-browser)
   - alt + a + f      -------> open firefox (firefox)
   - alt + a + t      -------> open telegram (telegram-desktop)
   - alt + a + n      -------> open file explore in nemo (nemo)
   - alt + a + q      -------> open calculator (qalc)
   - alt + a + h      -------> open htop (htop)
   - alt + a + l      -------> lock screen (i3lock/swaylock -c "000000)
   - alt + a + k      -------> open hyprpicker
   - alt + a + m      -------> open vscode (code)
   - alt + a + g      -------> open glow markdown reader (code)
   - alt + a + o      -------> open lf file explorer (lfrun)
   - alt + a + p + p  -------> capture screen with selection
   - alt + a + p + s  -------> capture current output screen
   - alt + a + p + f  -------> capture full desktops all the screens
   - alt + a + p + w  -------> capture selected window
   - alt + a + p + a  -------> capture active window
   - alt + a + r + r  -------> record screen with selection ( sway only)
   - alt + a + r + s  -------> record full screen ( sway only)
   - alt + a + r + q  -------> stop recording ( sway only) 
   - alt + a + v      -------> start vpn / close openvpn 

## Search:  
   - alt + f  + t     -------> open applications terminal mode (rofi -show run -dpi 171)
   - alt + f  + a     -------> open gui application (rofi -dpi 171 -show drun -show-icons)
   - alt + f  + w     -------> show all open windows in i3wm/sway (rofi -dpi 171 -show)
   - alt + f  + f     -------> search for files in home directory to open (file_exp.sh f)
   - alt + f  + d     -------> search for directory to open (file_exp.sh d)
   - alt + f  + g     -------> open lazygit in speciefied directory (lazy_git.sh)

## Systemctl commands: 
   - alt + d + s      -------> turn off the system (systemctl poweroff)
   - alt + d + r      -------> restart the system (systemctl restart)
   - alt + d + f      -------> send system to sleep (systemctl suspend)
   
## i3wm/sway movement commands: 
   - alt + control + a  -----> toggle fullscreen  (i3-msg fullscreen toggle)
   - alt + control + f  -----> toggle floatmode  (i3-msg floating toggle)
   - alt + p            -----> move current workspace to different monitor (i3-msg move workspace to output right)
   - alt + period     -------> show previous workspace (i3-msg workspace back_and_forth)
   - alt + n          -------> next workspace (i3-msg workspace next)         
   - alt + q          -------> kill window (i3-msg kill)
   - alt + e + h      -------> i3-msg/sway open new window in horizontal split ( split h)
   - alt + e + v      -------> i3-msg/sway open new window in vertical split (split v) 
   - alt + e + y      -------> i3-msg/sway open new window in stacking layout (layout stacking)
   - alt + e + t      -------> i3-msg/sway set layout to tabbed mode  (layout tabbed)
   - alt + e + e      -------> i3-msg/sway toggle tabbed mode for windows (layout toggle tabbed)
   - alt + e + space  -------> i3-msg/sway focus on floating window/main window ( focus toggle_mode)
   - alt + e + i      -------> i3-msg/sway focus on parent ( focus parent)
   - alt + e + r      -------> i3-msg restart
   - alt + e + q      -------> i3-msg/sway exit
   - alt + e + w      -------> i3-msg/sway reload config 
   - mouse-button-middle ----> i3-msg floating toggle

## scratchpad: 
   - alt + b  + b     -------> i3-msg move scratchpad
   - alt + b  + s     -------> i3-msg scratchpad show

## i3-wm navigation mode: 
   - alt + h          -------> goto left window ( i3-msg focus left )
   - alt + j          -------> goto down window ( i3-msg focus down )
   - alt + k          -------> goto top window (i3-msg focus up)
   - alt + l          -------> goto right window ( i3-msg focus right )
   - alt + left       -------> goto left window (i3-msg focus left)
   - alt + down       -------> goto down window ( i3-msg focus down )
   - alt + up         -------> goto up window ( i3-msg focus up )
   - alt + right      -------> goto right window ( i3-msg focus right )
   - alt + control + h ------> move window to left (i3-msg move left)
   - alt + control + j ------> move window to down (i3-msg move down)
   - alt + control + k ------> move window upwards (i3-msg move up)
   - alt + control + l ------> move window right (i3-msg move right)
   - alt + shift + left -----> move window to left (i3-msg move left)
   - alt + shift + right ----> move window to right (i3-msg move down)
   - alt + shift + up  ------> move window to up (i3-msg move up)
   - alt + shift + down -----> move window downwards (i3-msg move right)
   - alt + 1           ------> goto workspace 1 (i3-msg workspace 1)
   - alt + 2           ------> goto workspace 2 ( i3-msg workspace 2 )
   - alt + 3           ------> goto workspace 3 ( i3-msg workspace 3 )
   - alt + 4           ------> goto workspace 4 ( i3-msg workspace 4 )
   - alt + 5           ------> goto workspace 5 ( i3-msg workspace 5 )
   - alt + 6           ------> goto workspace 6 ( i3-msg workspace 6 )
   - alt + 7           ------> goto workspace 7 ( i3-msg workspace 7 )
   - alt + 8           ------> goto workspace 8 ( i3-msg workspace 8 )
   - alt + 9           ------> goto workspace 9 ( i3-msg workspace 9 )
   - alt + 0           ------> goto workspace 10 ( i3-msg workspace 0 )
   - alt + control +  1 -----> move window to workspace 1
   - alt + control +  2 -----> move window to workspace 2
   - alt + control +  3 -----> move window to workspace 3
   - alt + control +  4 -----> move window to workspace 4
   - alt + control +  5 -----> move window to workspace 5
   - alt + control +  6 -----> move window to workspace 6
   - alt + control +  7 -----> move window to workspace 7
   - alt + control +  8 -----> move window to workspace 8
   - alt + control +  9 -----> move window to workspace 9
   - alt + control +  0 -----> move window to workspace 0
   - button9            -----> move left

## Network commands: 
   - alt + i + i       ------> toggle wifi (wifi_connect.sh)
   - alt + i + l       ------> change wifi connection (wifi_fzf.sh)
   - alt + i + o       ------> open network connection editor

## User scripts:  
   - alt + z + a       ------> Run Ai locally or remotely via groq
   - alt + z + g       ------> change cpu governor (governor.sh)
   - alt + z + m       ------> mount disks (mount.sh)
   - alt + z + h       ------> open man pages (man_pages.sh )
   - alt + z + q       ------> kill applications (kill.sh)
   - alt + z + k       ------> show keymaps for i3wm/sway/zsh/tmux (keymaps.sh)
   - alt + z + x       ------> send mouse pointer to bottom (xdotool mousemove 800 1920 )
   - alt + z + e       ------> change cpu energe performance preference
   - alt + z + i       ------> info on cpu governor and driver
   - alt + z + w       ------> change wofi / rofi theme
   - alt + z + v       ------> kill all instances of wf-recorder
   - alt + z + b       ------> switch file picker for browser 


---------------------------------------------------------------------------------------------------
   
# ZSH KEYMAPS

   - ctrl + e + space  ------> create tmux session for any directory from home (tmux_create.sh 0)  
   - ctrl + e + r      ------> create recent tmux sessions (tmux_create.sh 1)
   - ctrl + e + ;      ------> make a project inside tmux
   - ctrl + e + \      ------> kill tmux sessions (tmux_kill.sh)
   - ctrl + e + y      ------> tmux session swithch (tmux_session_switch.sh)
   - ctrl + g          ------> open lazygit in current directory
   - ctrl + v          ------> open neovim in current directory
   - ctrl + \ + d      ------> open file from dotfiles in neovim in current shell
   - ctrl + \ + f      ------> serach file in current dir and open in neovim
   - ctrl + \ + h      ------> serach file in home dir and open in neovim
   - ctrl + \ + s      ------> start a tmux session in the current working dir in shell
   - ctrl + e + '      ------> open lf file browser in the searched directory
   - ctrl + p          ------> goto previous command in zsh
   - ctrl + n          ------> goto next command in zsh
   - ctrl + ]          ------> goto end of the line
   - ctrl + j          ------> goto back one char
   - ctrl + k          ------> goto forward one char
   - ctrl + a          ------> goto start of the line
   - ctrl + b          ------> goto back of the word
   - ctrl + f          ------> goto front of the word
   - ctrl + r          ------> search the command line history
   - ctrl + [          ------> enter vim mode
   - ctrl + t          ------> insert a file name completion to command

---------------------------------------------------------------------------------------------------
   
# TMUX KEYMAPS 
   
   - (ctrl + e)                            : send-prefix
   - (ctrl + e) + v                        : splits window horizontal with path as current path
   - (ctrl + e) + (ctrl + v)               :  splits window horizontal with path as current path 
   - (ctrl + e) + u                        : splits window vertical with path as current path
   - (ctrl + e) + (ctrl + u)               : splits window vertical with path as current path
   - (ctrl + e) + b                        : convert/break pane into window
   - (ctrl + e) + z                        : maximaze pane into window
   - (ctrl + e) + R                        : source .tmux.conf file on runtime
   - (ctrl + e) + Z                        : merge window (number) to a pane in current window
   - (ctrl + e) + /                        : kill session and move to next
   - (ctrl + e) + \                        :  Create a new project inside tmux and then start a tmux session in it
   - (ctrl + e) + y                        : This binding  is used to switch session in tmux
   - (ctrl + e) + Space                    :  This binding creates a new session in any directory from home,
   - (ctrl + e) + r                        : This binding creates a recently created  session( fzf list) 
   - (ctrl + e) + \                        : Kill selected session
   - (ctrl + e) + c                        : open a new window in selected directory from fzf
   - (ctrl + e) + g                        : search git directory and open the selected directory in lazy git
   - (ctrl + e) + m                        : open lf file manager in PROJECT ROOT
   - (ctrl + e) + a                        : run ai locally or online
   - (ctrl + e) + '                        : open lf file manager in directory from where binding was pressed
   - (ctrl + e) + i                        : create new window with current shell path as starting directory
   - (ctrl + e) + p                        : create new window in tmux root directory
   - (ctrl + e) + o                        : kill window
   - (ctrl + e) + x                        : kill pane
   - ( ctrl + e ) + ;                      : create a new project  and start tmux session in it
   - (ctrl + e) + (ctrl + o)               : kill all panes except the current one
   - (ctrl + e + o)                        : kill all panes except the current one
   - (ctrl + e) + O                        : kill all windows except the current active one
   - (ctrl + e + n )                       : goto next session
   - (ctrl + e + p )                       : goto previous session
   - (ctrl + e + ] )                       : goto previous active window
   - (ctrl + e) + q                        : kill tmux 
   - (ctrl + e + h )                       : goto next towards right
   - (ctrl + e + l )                       : goto next towards left
   - (ctrl + e + . )                       : goto right pane
   - (ctrl + e + , )                       : goto left pane
   - (ctrl + e) + k                        : goto upper pane
   - (ctrl + e) + j                        : goto lower pane
   - (ctrl + e) + U  (repeat)              : update pacman and notify if failed
   - (ctrl + e) + H  (repeat)              : resize pane towards left 5 units
   - (ctrl + e) + J  (repeat)              : resize pane towards down 5 units
   - (ctrl + e) + K  (repeat)              : resize pane towads up 5 units
   - (ctrl + e) + L  (repeat)              : resize pane towards right direction 5 units
   - (ctrl + e) + l                        : move to previous active window just like (ctrl + e) + ]
   - (ctrl + e  + [ )                      : goto copy mode
   - (ctrl + e) + Esc                      : enter the copy mode
   - v (copy-mode)                         : select text in copy mode
   - y (copy-mode)                         : copy selected in copy mode
   - q (copy-mode)                         : exit copy-mode

---------------------------------------------------------------------------------------------------

# lf mappings

   -   !                         ------> run shell command in key press mode
   -   "                         ------> remove marks
   -   $                         ------> run shell in normal stdout/in mode shell 
   -   %                         ------> run shell with output visible only in cmdline
   -   &                         ------> run async shell
   -   '                         ------> load mark 
   -   ,                         ------> find previous
   -   .                         ------> set hidden!
   -   /                         ------> normal native search
   -   [                         ------> native search prev 
   -   ]                         ------> native search next
   -   :                         ------> read  command
   -   ;                         ------> find next 
   -   ctrl + b                  ------> page up 
   -   ctrl + d                  ------> half down 
   -   ctrl + e                  ------> scroll down 
   -   ctrl + f                  ------> page down 
   -   ctrl + j                  ------> toggle selection and move down
   -   ctrl + k                  ------> toggle selection and move up
   -   ctrl + l                  ------> clear all selections
   -   ctrl + m + down           ------> scroll down 
   -   ctrl + m + up             ------> scroll up
   -   ctrl + n                  ------> cmd history next 
   -   ctrl + o                  ------> toggle preview 
   -   ctrl + p                  ------> cmd history prev 
   -   ctrl + r                  ------> reload 
   -   ctrl + space              ------> toggle  selection but stay at place
   -   ctrl + u                  ------> half up 
   -   ctrl + y                  ------> scroll up 
   -   down                      ------> move down
   -   end                       ------> goto bottom 
   -   enter                     ------> open file under selection if normal lf instance, if in browser instance, then select or save 
   -   f1                        ------> open docs
   -   home                      ------> goto top 
   -   left                      ------> go to previous dir 
   -   pgdn                      ------> page down 
   -   pgup                      ------> page up 
   -   right                     ------> open file or enter dir
   -   F                         ------> search dir with pcre regex
   -   f                         ------> search file with pcre regex
   -   n                         ------> go to next match in regex file
   -   N                         ------> goto previos match in regex
   -   space + c + r             ------> copy files in regex selections to current dir
   -   space + c + s             ------> copy files in selected selection from fzf to current dir
   -   space + d + r             ------> delete files in regex selections 
   -   space + d + s             ------> delete files in selected selections from fzf 
   -   space + x + r             ------> move files in regex selectiosn to current dir
   -   space + x + s             ------> move files in selected selectiosn from fzf
   -   up                        ------> move selection up 
   -   ?                         ------> native search back 
   -   D                         ------> make dir or file if name ends with / make dir else file
   -   G                         ------> goto bottom
   -   H                         ------> goto highest position on screen
   -   I                         ------> preview all regex selections
   -   L                         ------> goto lowest position on screen
   -   M                         ------> goto middle selection on screen
   -   O                         ------> open with gui
   -   R                         ------> source config 
   -   V                         ------> toggle selection below current cursor
   -   a + e                     ------> edit current dir in oil
   -   a + f                     ------> search files in current dir or selected dirs
   -   a + i                     ------> preview selected files
   -   a + n                     ------> copy current cursor file name
   -   a + p                     ------> print current path
   -   a + s                     ------> get size in Mb,Kb, or Gb or current file or selected files
   -   a + u                     ------> unarchive packages
   -   a + y                     ------> copy current cursor path
   -   c                         ------> clear copied, cut selections
   -   d                         ------> delete current cursor selection or toggled selections
   -   e + .                     ------> rename current dir files
   -   e + l                     ------> rename current files in fzf select lists
   -   e + r                     ------> rename regex selected files
   -   e + s                     ------> rename toggled files
   -   f                         ------> regex search files
   -   g + a                     ------> change dir to ~/.arch-pull
   -   g + c                     ------> change dir to ~/.dotfiles
   -   g + d                     ------> change dir to ~/Downloads
   -   g + f                     ------> change dir to ~/Documents
   -   g + g                     ------> goto top
   -   g + h                     ------> change dir to $HOME
   -   g + j                     ------> jump to any file or dir using fzf
   -   g + m                     ------> change dir to ~/Music
   -   g + p                     ------> change dir to ~/Pictures
   -   g + u                     ------> change dir to /run/media
   -   g + v                     ------> change dir to ~/Videos
   -   h                         ------> goto back dir
   -   i                         ------> open current selection in less and preview
   -   j                         ------> go down 
   -   k                         ------> go up 
   -   l                         ------> open file or go inside dir
   -   m                         ------> save mark
   -   o                         ------> open in cli
   -   p                         ------> paste files
   -   q                         ------> quit lf
   -   r                         ------> rename selected files or current cursor file
   -   s + a                     ------> set sortby atime; set info atime
   -   s + c                     ------> set sortby ctime; set info ctime
   -   s + e                     ------> set sortby ext; set info 
   -   s + n                     ------> set sortby natural; set info 
   -   s + s                     ------> set sortby size; set info size
   -   s + t                     ------> set sortby time; set info time
   -   t                         ------> tag toggle files
   -   u                         ------> unselect  files
   -   v                         ------> invert files
   -   w                         ------> ${{ $SHELL }}
   -   x                         ------> cut  files
   -   y                         ------> copy files
   -   z + a                     ------> set info size:time
   -   z + h                     ------> set hidden!
   -   z + n                     ------> set info
   -   z + r                     ------> set reverse!
   -   z + s                     ------> set info size
   -   z + t                     ------> set info time


---------------------------------------------------------------------------------------------------

# Brave keymaps

    - ctrl + o ----------------> goto previous page in history
    - ctrl + i ----------------> goto forward page in history
    - ctrl + r ----------------> reload
    - ctrl + n ----------------> new-window
    - ctrl + t ----------------> new-tab
    - ctrl + w ----------------> close tab
    - ctrl + k ----------------> next tab
    - ctrl + j ----------------> previous tab
    - ctrl + shift + l --------> move tab next
    - ctrl + shift + h --------> move tab previous
    - ctrl + , ----------------> bookmark tab
    - ctrl + u ----------------> view source
    - ctrl + shift + j --------> open js console
    - ctrl + h ----------------> open history
    - ctrl + b ----------------> bookmark manager
    - ctrl + d ----------------> Download history
    - ctrl + g ----------------> settings
    - ctrl + m ----------------> mute
    - ctrl + space ------------> run commands
    - ctrl + enter ------------> open file
    - ctrl + . ----------------> copy link of current page
    - ctrl + ; ----------------> bring all the tabs in any window to the current window


---------------------------------------------------------------------------------------------------

# Neovim user keymaps

### Plugin mappings

-- Misc mappings 

- `<leader>e`      -> show  oil explorer
- `<leader>r`      -> run current file in terminal according to its type
- `<leader>,`      -> open previous session


-- Lazy mappings

- `<leader>pz`     -> open plugins.lua inside lazy-nvim directory
- `<leader>ps`     -> source current lua file 
- `<leader>pi`     -> run Lazy install clean and install missing plugins
- `<leader>pu`     -> run Lazy update
- `<leader>pc`     -> remove plugins that are no longer needed
- `<leader>pp`     -> open Lazy.nvim UI
- `<leader>pt`     -> see startup time for nvim using vim-startuptime plugin
- `<leader>pd`     -> open lazy snapshots directory inside oil.nvim
- `<leader>pb`     -> goto prevoiusly saved snapshots of plugin saved via fzf and then running lazy restore


-- Git mappings 

- `<leader>gg`     -> open git fugitive
- `<leader>gw`     -> see all the changes in the current git directory inside quickfix list
- `<leader>ga`     -> list all the changes in current file inside location list
- `<leader>gl`     -> show git blame line
- `<leader>gp`     -> show git hunk previews
- `<leader>gr`     -> reset git hunk
- `<leader>gR`     -> reset current buffer
- `<leader>gs`     -> stage git hunk under cursor
- `<leader>gf`     -> stage entire buffer to git staging area
- `<leader>gu`     -> undo staged hunks
- `<leader>gd`     -> use gitdiff with the head


-- quickfix mappings


- `<leader>qw`     ->  find word under the cursor and list in quickfix list
- `<leader>qq`     ->  open quickfix list
- `<leader>qe`     ->  close quickfix list
- `<leader>ql`     ->  open location list
- `<leader>ql`     ->  open location list
- `<leader>qf`     ->  see current word under cursor in fzf-lua
- `<leader>qo`     -> close location list

-- Lsp mappings


- `<leader>la`     -> show code actions from lsp
- `<leader>ld`     -> list document diagnostics in quickfix list
- `<leader>lx`     -> make current file executable
- `<leader>lw`     -> list workspace diagnostics in the quickfix list
- `<leader>li`     -> checkhealth LSP
- `<leader>lI`     -> open mason installer
- `<leader>lk`     -> :pwd ( show current working directory in the commandline)
- `<leader>lh`     -> change current working directory to the tmux $PROJECT_ROOT
- `<leader>lp`     -> open goto-preview and preview current function/class/variable in a floating window
- `<leader>ll`     -> start lsps
- `<leader>lq`     -> stop lsps
- `<leader>lr`     -> show document references in quickfix list
- `<leader>lg`     -> show document implementation in quickfix list
- `<leader>ls`     -> list document symbols inside quickfix list
- `<leader>le`     -> list document error of current line in floating box
- `<leader>lS`     -> list document Symbols in quickfix  list
- `<C-s>`          -> toggle signature help for lsp
- `gd`             -> goto defintion
- `gD`             -> goto type definition
- `K`              ->  Displays hover information about the symbol under the cursor in a floating window


-- Fzf-lua mappings

- `<leader>st`     -> show lsp symbols in fzf
- `<leader>sd`     -> open directory in oil.nvim via fzf-lua
- `<leader>so`     -> open oldfiles
- `<leader>sR`     -> resume fzf-lua
- `<leader>sm`     -> open nvim help manual in fzf-lua
- `<leader>sk`     -> search keymaps in fzf-lua
- `<leader>sC`     -> search commands in fzf-lua
- `<leader>sp`     -> search file in PROJECT_ROOT of tmux
- `<leader>sp`     -> live grep inside PROJECT_ROOT of tmux
- `<leader>sg`     -> live grep inside PROJECT_ROOT of tmux
- `<leader>sr`     -> open PROJECT_ROOT of tmux inside oil.nvim
- `<leader>sq`     -> search quickfix list entries
- `<leader>ss`     -> live grep from current directory
- `<leader>sc`     -> browse colorschemes with fzf-lua
- `<leader>sb`     -> search for buffer lines in fzf-lua
- `<leader>sl`     -> search for buffer lines in all open buffers in fzf-lua
- `<leader>sh`     -> search for dotfiles with fzf-lua
- `<leader>sa`     -> search for ansible_sync/.arch_pull with fzf-lua
- `<leader>sn`     -> search for files inside plugin source code in .local/share/nvim/
- `<leader>sf`     -> search for files from current directory
- `<leader>o`      -> list buffers in fzf-lua 


-- Terminal mappings 

- `<leader>tn`     -> open terminal in floating window with node running
- `<leader>tm`     -> open terminal in floating window with glow markdown reader running
- `<leader>tt`     -> open terminal in floating window with htop running in it
- `<leader>tp`     -> open terminal in floating window with python shell running in it
- `<leader>tg`     -> open terminal in floating window with lazy git running in it
- `<leader>tl`     -> open terminal in floating window with lua shell running in it
- `<leader>tf`     -> open terminal in floating window  with zsh shell running
- `<leader>th`     -> open terminal in vertical window  with zsh shell running
- `<leader>tv`     -> open terminal in horizontal window  with zsh shell running



-- Buffer mappings


- `<leader>bo`     ->  Delete all buffers except current one
- `<leader>be`     ->  Delete all empty buffers
- `<leader>bb`     ->  run shell command in adjacent tmux pane
- `<leader>bl`     ->  Run current lines under cursor in tmux pane
- `<leader>br`     ->  run commands like emacs in a buffer
- `<C-k>`           -> goto next buffer
- `<C-j>`           -> goto previous buffer



-- Treesitter mappings


- `af`              -> inside a function object
- `if`              -> outside a function object
- `ac`              -> inside a class object
- `ic`              -> outside a class object
- `ar`              -> inside a loop object
- `ir`              -> outside a loop object
- `aq`              -> inside a condition object
- `iq`              -> outside a condition object
- `aa`              -> inside a parameter object
- `ia`              -> outside a condition object
- `<leader>an`      -> swap parameter inside function to next parameter
- `<leader>ap`      -> swap parameter inside function to previous parameter
- `<leader>aN`      -> swap parameter of current function to parameter of next parameter
- `<leader>aP`      -> swap parameter of current function to parameter of previous parameter
- `<leader>fn`      -> swap function code of current fucntion with next function
- `<leader>fp`      -> swap function code of current fucntion with previous function
- `<leader>fN`      -> swap function declartion of current function with next function
- `<leader>fP`      -> swap function declartion of current function with previous function
- `]f`              -> goto next function declaration
- `[f`              -> goto previous function declaration
- `<leader>nf`      -> goto end of next function
- `<leader>mf`      -> goto end of previous function
- `]c`              -> goto next class declaration
- `[c`              -> goto previous class declaration
- `<leader>nc`      -> goto end of next class
- `<leader>mc`      -> goto end of previous class
- `]q`              -> goto next condition declaration
- `[q`              -> goto previous condition declaration
- `<leader>nq`      -> goto end of next condition
- `<leader>mq`      -> goto end of previous condition
- `]r`              -> goto next loop declaration
- `[r`              -> goto previous loop declaration
- `<leader>nr`      -> goto end of next loop
- `<leader>mr`      -> goto end of previous loop
- `]s`              -> goto next statment declartion
- `[s`              -> goto previous statment declartion
- `<leader>ns`      -> goto end of next statement
- `<leader>ms`      -> goto end of previous statement


-- flash-plugin mappings

- `[w`              -> jump to next char
- `[t`              -> jump to next treesitter node
- `[a`              -> remote flash
- `[z`              -> treesitter search


-- Normal mode keymap

- `j/k` -> maps j & k to gj and gk to move along virtual lines as well
- `<leader>hh` -> higlights current line 
- `<leader>lf` -> create new with !touch 
- `<leader>lc` -> create new directory / subdirectories
- `<leader>hv` -> clear highlighted lines ( highlighed lines from <leader>hh)
- `<leader>bk` ->  send ctrl-d signal to the adjacent tmux pane
- `<leader>bx` -> send ctrl-c signal to the adjacent tmux pane
- `kj`  ->  goto normal mode
- `<leader>d` -> force delete current buffer
- `<leader>w` -> write the buffer to file / also create directories 
- `<leader>k` -> open man page for the keyword under the cursor
- `<leader>c` -> exit vim but also save current session before exiting
- `<leader>y` -> copy full file
- `n` -> goto next match but also center the window 
- `N` -> goto previous match but also center the window 
- `<leader>z` -> open init.lua 
- `<leader>n)` -> goto next bracket `)`
- `<leader>m)` -> goto previous bracket `)`
- `<leader>n(` -> goto next bracket `(`
- `<leader>m(` -> goto previous bracket `(`
- `<leader>n]` -> goto previous bracket `]`
- `<leader>m]` -> goto previous bracket `]`
- `<leader>n[` -> goto previous bracket `[`
- `<leader>m[` -> goto previous bracket `[`
- `<leader>n{` -> goto previous bracket `{`
- `<leader>m{` -> goto previous bracket `{`
- `<leader>n}` -> goto previous bracket `}`
- `<leader>m}` -> goto previous bracket `}`
- `<leader>n'` -> goto previous bracket `'`
- `<leader>m'` -> goto previous bracket `'`
- `<leader>n"` -> goto previous bracket `"`
- `<leader>m"` -> goto previous bracket `"`
- `<leader>n`` -> goto previous bracket ```
- `<leader>m`` -> goto previous bracket ```
- `<leader>ne` -> goto previous = (equal to)
- `<leader>me` -> goto previous = (equal to)
- `<leader>na` -> goto previous + (add)
- `<leader>ma` -> goto previous +  (add)
- `<leader>ns` -> goto previous -  (minus)
- `<leader>ms` -> goto previous -  (minus)
- `<leader>nd` -> goto previous _  (dash)
- `<leader>md` -> goto previous _  (dash)
- `<leader>nn` -> goto previous number  (number)
- `<leader>mn` -> goto previous number  (number)
- `<leader>nt` -> goto previous tag  (<...>)
- `<leader>mt` -> goto previous tag  (<...>)
- `<leader>nv` -> goto previous variable
- `<leader>mv` -> goto previous variable
- `]a`  -->  convert words into arrays with bracket syntax and surround each item with `'` quotes
- `]e`  -->  convert words into arrays with bracket syntax but do not surround each item with `'` quotes

-- terminal mode keymaps
- `<c-[>` -> goto normal mode in terminal mode
- `kj` -> goto normal mode in terminal mode
- `<C-d>` -> exit terminal mode

-- visual mode keymaps 
- `.` -> repeat dot command in visual mode
- `<leader>bl` -> send current selected text in nvim to the adjacent tmux pane
- `J` -> in visual mode move the current selection downwards
- `K` -> in visual mode move the current selection upwards
- `>` -> in visual mode move the selection towards right but preserve the selection
- `<` -> in visual mode move the selection towards left but preserve the selection
- `il/al` -> selects current line visually inside/outside

-- Command line keymaps
- `<C-J>`  --> behave like down arrow in command line mode
- `<C-K>`  --> behave like up arrow in command line mode
