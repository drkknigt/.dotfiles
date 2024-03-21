# I3WM & SWAY KEYMAPS: 
                                 
## Volume:  
   - alt + ]           ----->   volume up (pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status )
   - alt + [           ----->   volume up (pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status )
   - alt + ctrl + m    ----->   pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
   - XF86AudioLowerVolume --->   pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
   - XF86AudioRaiseVolume --->   pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
   - XF86AudioMute      ----->   pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
    
## Monitor & Screen:  
   - alt + s + s       ----->  set resolution for 2nd monitor (resolution.sh)
   - alt + s + 1       ----->  scale monitor 1  (scale.sh 0)
   - alt + s + 2       ----->  scale monitor 2  (scale.sh 1)
   - alt + s + l       ----->  change monitor 1 background (change_background.sh 0)
   - alt + s + r       ----->  change monitor 1 background (change_background.sh 1)
   - alt + s + d       ----->  change sddm display manager background
   - alt + "+"         ----->  screen brightness up (brightnessctl set +3%)
   - alt + "-"         ----->  screen brightness down (brightnessctl set +3%)

## Starting Applications: 
   - alt + return     -------> open alacritty terminal (alacritty -t "startup")
   - alt + a + c      -------> open color picker (kcolorchooser)
   - alt + a + v      -------> open vlc media player (vlc)
   - alt + a + b      -------> open brave browser (brave-browser)
   - alt + a + f      -------> open firefox (firefox)
   - alt + a + t      -------> open telegram (telegram-desktop)
   - alt + a + n      -------> open file explorere nemo (nemo)
   - alt + a + q      -------> open calculator (qalc)
   - alt + a + h      -------> open htop (htop)
   - alt + a + l      -------> lock screen (i3lock -c "000000)
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

## Search:  
   - alt + f  + t     -------> open applications terminal mode (rofi -show run -dpi 171)
   - alt + f  + a     -------> open applications desktop environment (rofi -dpi 171 -show drun -show-icons)
   - alt + f  + w     -------> show all open windows in i3wm (rofi -dpi 171 -show)
   - alt + f  + f     -------> search for files in home directory to open (file_exp.sh f)
   - alt + f  + d     -------> search for directory to open (file_exp.sh d)
   - alt + f  + g     -------> open lazygit in speciefied directory (lazy_git.sh)

## Systemctl commands: 
   - alt + d + s      -------> turn off the system (systemctl poweroff)
   - alt + d + r      -------> restart the system (systemctl restart)
   - alt + d + f      -------> send system to sleep (systemctl suspend)
   
## i3wm movement commands: 
   - alt + control + a  -----> toggle fullscreen  (i3-msg fullscreen toggle)
   - alt + control + f  -----> toggle floatmode  (i3-msg floating toggle)
   - alt + p            -----> move current workspace to different monitor (i3-msg move workspace to output right)
   - alt + period     -------> show previous workspace (i3-msg workspace back_and_forth)
   - alt + q          -------> kill window (i3-msg kill)
   - alt + e + h      -------> i3-msg split h
   - alt + e + v      -------> i3-msg split v
   - alt + e + y      -------> i3-msg layout stacking
   - alt + e + t      -------> i3-msg layout tabbed
   - alt + e + e      -------> i3-msg layout toggle tabbed
   - alt + e + space  -------> i3-msg focus toggle_mode
   - alt + e + i      -------> i3-msg focus parent
   - alt + e + r      -------> i3-msg restart
   - alt + e + q      -------> i3-msg exit
   - alt + e + w      -------> i3-msg reload config for i3wm
   - mouse-button-middle ----> i3-msg floating toggle

## scratchpad: 
   - alt + b  + s     -------> i3-msg move scratchpad
   - alt + b  + d     -------> i3-msg scratchpad show

## i3-wm navigation mode: 
   - alt + h          -------> i3-msg focus left
   - alt + j          -------> i3-msg focus down
   - alt + k          -------> i3-msg focus up
   - alt + l          -------> i3-msg focus right
   - alt + left       -------> i3-msg focus left
   - alt + down       -------> i3-msg focus down
   - alt + up         -------> i3-msg focus up
   - alt + right      -------> i3-msg focus right
   - alt + control + h ------> i3-msg move left
   - alt + control + j  -----> i3-msg move down
   - alt + control + k  -----> i3-msg move up
   - alt + control + l  -----> i3-msg move right
   - alt + 1           ------> i3-msg workspace 1
   - alt + 2           ------> i3-msg workspace 2
   - alt + 3           ------> i3-msg workspace 3
   - alt + 4           ------> i3-msg workspace 4
   - alt + 5           ------> i3-msg workspace 5
   - alt + 6           ------> i3-msg workspace 6
   - alt + 7           ------> i3-msg workspace 7
   - alt + 8           ------> i3-msg workspace 8
   - alt + 9           ------> i3-msg workspace 9
   - alt + 0           ------> i3-msg workspace 0
   - alt + control +  1 -----> i3-msg move container to workspace 1
   - alt + control +  2 -----> i3-msg move container to workspace 2
   - alt + control +  3 -----> i3-msg move container to workspace 3
   - alt + control +  4 -----> i3-msg move container to workspace 4
   - alt + control +  5 -----> i3-msg move container to workspace 5
   - alt + control +  6 -----> i3-msg move container to workspace 6
   - alt + control +  7 -----> i3-msg move container to workspace 7
   - alt + control +  8 -----> i3-msg move container to workspace 8
   - alt + control +  9 -----> i3-msg move container to workspace 9
   - alt + control +  0 -----> i3-msg move container to workspace 0
   - button9            -----> i3-msg move left

## Network commands: 
   - alt + i + i       ------> toggle wifi (wifi_connect.sh)
   - alt + i + l       ------> change wifi connection (wifi_fzf.sh)
   - alt + i + o       ------> open network connection editor

## User scripts:  
   - alt + z + g       ------> change cpu governor (governor.sh)
   - alt + z + m       ------> mount disks (mount.sh)
   - alt + z + h       ------> open man pages (man_pages.sh )
   - alt + z + q       ------> kill applications (kill.sh)
   - alt + z + k       ------> show keymaps for i3wm (keymaps.sh)
   - alt + z + x       ------> send mouse pointer to bottom (xdotool mousemove 800 1920 )
   - alt + z + e       ------> change cpu energe performance preference
   - alt + z + i       ------> info on cpu governor and driver
   - alt + z + w       ------> change wofi / rofi theme
   - alt + z + v       ------> kill all instances of wf-recorder
   
# ZSH KEYMAPS

   - ctrl + e + space  ------> create tmux session for any directory from home (tmux_create.sh 0)  
   - ctrl + e + r      ------> create recent tmux sessions (tmux_create.sh 1)
   - ctrl + e + a      ------> make a directory and start a session there (tmux_create.sh 2)
   - ctrl + e + \      ------> kill tmux sessions (tmux_kill.py)
   - ctrl + e + y      ------> tmux session swithch (tmux_session_switch.sh)
   - ctrl + e + g      ------> open lazy git in prefered directory (tmux_git.sh)
   - ctrl + g          ------> open lazygit in current directory
   - ctrl + v          ------> open neovim in current directory
   - ctrl + \ + d      ------> open file from dotfiles in neovim in current shell
   - ctrl + \ + f      ------> serach file in current dir and open in neovim
   - ctrl + \ + h      ------> serach file in home dir and open in neovim
   - ctrl + \ + g      ------> open git dir
   - ctrl + \ + s      ------> start a tmux session in the current working dir in shell
   - ctrl + e + '      ------> open lf file browser in the searched directory
   - ctrl + p          ------> goto previous command in zsh
   - ctrl + n          ------> goto next command in zsh
   - ctrl + ]          ------> goto end of the line
   - ctrl + j          ------> goto start of the word
   - ctrl + k          ------> goto end of the word
   - ctrl + space      ------> go back one char
   - ctrl + a          ------> goto start of the line
   - ctrl + r          ------> search the command line history
   - kj                ------> enter vim mode
   
# TMUX KEYMAPS 
   
   - ctrl + e          ------> send prefix
   - ctrl + e + v      ------> open a horizontal pane with current shell path as starting path 
   - ctrl + e + b      ------> break current pane into a new window
   - ctrl + e + R      ------> reload the tmux configuration
   - ctrl + e + Z      ------> join panes from windows
   - ctrl + e + u      ------> split windows vertically with current shell path as starting path
   - ctrl + e + p      ------> create new window with root tmux path
   - ctrl + e + t      ------> create new window with current shell path as startin path
   - ctrl + e + o      ------> kill window 
   - ctrl + e + O      ------> kill all window  except the current ones
   - ctrl + e + x      ------> kill pane 
   - ctrl + e + q      ------> exit tmux 
   - ctrl + e + /      ------> kill curent session and move to next
   - ctrl + e + z      ------> maxamize pane
   - ctrl + e + [      ------> pager mode
   - ctrl + e + ]      ------> goto last window
   - ( ctrl + e + n )  ------> next session
   - ( ctrl + e + p )  ------> previous session
   - ( ctrl + e + [ )  ------> pager mode 
   - ( ctrl + e + h )  ------> move to next window left
   - ( ctrl + e + l )  ------> move to next window right
   - ( ctrl + e + o )  ------> kill all panes except the current one
   - (ctrl + e) H      ------> resize 5 units to left
   - (ctrl + e) L      ------> resize 5 units to right
   - (ctrl + e) J      ------> resize 5 units to bottom
   - (ctrl + e) K      ------> resize 5 units to top
   - ctrl + e + l      ------> move to next right
   - ctrl + e + i      ------> kill current pane
   - ctrl + e + h      ------> move to next left
   - ctrl + e + j      ------> move to next bottom
   - ctrl + e + k      ------> move to next top
   - ctrl + e + n      ------> move to next window
   - ctrl + e + space  ------> create a tmux session from home directory
   - ctrl + e + r      ------> create a tmux session from recent sessions
   - ctrl + e + a      ------> create a new directory and create a session inside it
   - ctrl + e + y      ------> switch tmux session
   - ctrl + e + \      ------> kill tmux session from the list
   - ctrl + e + c      ------> open a new window with selected directory from fzf
   - ctrl + e + g      ------> open a lazygit in selected directory from fzf
   - ctrl + e + m      ------> get info on command with cheat sheet
   - ctrl + e + ;      ------> open lf file manger in current shell path
   - ctrl + e + '      ------> open lf file manger in path choosen from fzf


# lf mappings


     - d               ------> delete
     - y               ------> copy 
     - .               ------> set hidden!
     - p               ------> paste
     - x               ------> cut
     - <enter>         ------> open
     - R               ------> source-config
     - F               ------> mkfile
     - D               ------> mk_dir
     - r               ------> bulk_rename
     - f               ------> push :/<space>
     - <c-l>           ------> :clear; unselect
     - <space>         ------> :toggle; down
     - <c-space>       ------> :toggle
     - gm              ------>  cd ~/.ansible_sync
     - gh              ------>  cd ~
     - ga              ------>  cd ~/arch-pull
     - gc              ------>  cd ~/.dotfiles
     - gp              ------>  cd ~/Pictures
     - gd              ------>  cd ~/Downloads
     - gf              ------>  cd ~/Documents
     - gv              ------>  cd ~/Videos
     - g.              ------>  fzf_jump
     - as              ------>  get_size
     - ay              ------>  copypath
     - au              ------>  unarchive
     - an              ------>  copyname
     - ar              ------>  edit_dir
     - O               ------>  push :open-with-gui<space> ## input application
     - o               ------>  push :open-with-cli<space> ## input application
     - /               ------>  normal_search
     - <c-o>           ------>  toggle_preview
