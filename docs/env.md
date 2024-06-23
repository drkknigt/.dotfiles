# Env setup

## Contents

- **Arch-linux** : done
- **Linux-mint** : done
- **Ansible-playbook** : done
- **dotfiles**
- **bin**


-------------------------------------------------------------------------------------------------------------
## ARCH LINUX

### BASICS

- source[https://wiki.archlinux.org/title/Arch_Linux]
- Arch linux is x86-64 general purpose gnu/linux distribution that serves to provide latest software and follows the rolling release model
- Arch linux follows the philosophy of simplicity with providing the packages with minimal changes done to it. It ships software as released by the upstream devs with minimal changes.
- Arch encourages users to perform most config from terminal and text editors
- Arch Linux strives to maintain the latest stable release versions of its software as long as systemic package breakage can be reasonably avoided.
- Arch is based on rolling release model with one time install and then continous upgrades
- Arch usually has the lastest and the greatest in package manager repos
- Arch is a pragmatic distro with decisions making based on technical analysis and debate about the os rather then politics or popular opinion
- Arch linux is user centric distro with philosophy of do it yourself . Arch can be molded to whatever you want it to be
- Arch is people's distro with the users actively encouraged to contribute and fix issues themselves
- Arch Linux is a general-purpose distribution. Upon installation, only a command-line environment is provided
- Rather than tearing out unneeded and unwanted packages, the user is offered the ability to build a custom system
- User can choose among thousands of high-quality packages provided in the official repositories for the x86-64 architecture.
- Arch is a rolling-release model backed by pacman, a lightweight, simple and fast package manager that allows for continuously upgrading the entire system with one command. 
- Arch also provides the Arch build system, a ports-like system to make it easy to build and install packages from source, which can also be synchronized with one command. 
- the Arch User Repository contains many thousands of community-contributed PKGBUILD scripts for compiling installable packages from source using the makepkg application. 
- It is also possible for users to build and maintain their own custom repositories with ease.
- Arch linux was made by Judd Vinet. 

-------------------------------------------------------------------------------------------------------------
### ABS (ARCH BUILD SYSTEM)
- source[https://wiki.archlinux.org/title/Arch_build_system]
- The Arch build system (ABS) is a system for building and packaging software from source code.
- While pacman is the specialized Arch tool for binary package management, the Arch build system is a collection of tools for compiling source into installable .pkg.tar.zst packages.
- The Arch build system can be compared to ports for *BSD.
- Ports automates the process of building software from source code.
- The system uses a port to download, unpack, patch, compile, and install the given software.
- A port is merely a small directory on the user's computer, named after the corresponding software to be installed, that contains a few files with the instructions for building and installing the software from source. 
- This makes installing software as simple as typing make or make install clean within the port's directory.
- The Arch build system is based on a similar concept.
- It comprises a collection of git repositories for every package available in Arch Linux.
- Each repository contains a PKGBUILD file (and sometimes other files), and does not contain the software source nor binary.
- By running makepkg inside a directory, the software sources are downloaded, the software is compiled, and then packaged within the build directory.
- Then you can use pacman to install the package
- The Arch build system includes and relies on several components and tools that are used in the process of building packages from source:
```
1 . Repository: The directory structure containing files needed to build all official packages but not the packages themselves nor the source files of the software. It is available in the form of Git repositories hosted on gitlab.archlinux.org.
2. PKGBUILD: A bash script that contains the url of the source code along with the compilation and packaging instructions
3.makepkg : A shell command tool which reads the PKGBUILDs automatically and downloads and compiles the source and creates  a .pks.tar according to PKGEXT array in makepgk.conf
4.pacman : Pacman is invoked either by makepkg or manually to install and remove the built packages and for fetching dependencies
5.Aur : Aur is (Arch user repository ) and is seperate from the official repo of pkgbuilds , packages from aur can be build using the same method.

```
- The core , core-testing, extra-testing,extra official repos are hosted on arch linux gitlab instance
- Each package has its own repo in the official arch namespace.
- Each package contains the pkgbuild and files used in official builds 
- The source code for the package is not present in the directory. Instead , the pkgbuild contains a url that will download the source code when the package is built
- arch compared to other distro's [https://wiki.archlinux.org/title/Arch_compared_to_other_distributions]

-------------------------------------------------------------------------------------------------------------
### Arch installation


#### 1.) Booting into bootable arch
- To install arch first one has to make a bootable arch usb 
- You can either use dd command or use software like rufus on windows and ventory on linux 
- Boot into arch usb by selecting the boot device at startup and you will be greeted by arch tty 

#### 2.) Set the console keyboard layout and font
- By default the console assumes that you have US keyboard layout.
- This can be changed with loadkeys command
- To list all the available keyboard layout use `localectl list-keymaps`
- To select a particular keymap use `loadkeys <keyboard-layout-name>`
- you can also list the keyboard layouts with `ls /usr/share/kbd/keymaps/**/*.gz`
- We can also change the font in similar way 
- To list all the available fonts use `ls /usr/share/kbd/consolefonts/`
- Then we can use following command to set console font `setfont <font-name>`
- Both these commands for changing the keyboard layout and font are part of kbd package
- To check if you are in uefi mode or bios mode we can use the following command `ls /sys/firmware/efi/efivars`
- To verify the boot mode check the UEFI binaries : `cat /sys/firmware/efi/fw_platform_size`
- If the command returns 64, then system has booted in UEFI mode and has 64 bit x64 UEFI .
- If the command returns 32, then system is booted in UEFI mode and has a 32-bit IA32 UEF

#### 3.) Connect to the internet

- Next step is to connect to internet
- If you are connected to internet via wired connection then you should have working internet connection from the get go
- One can use ping to check the status of the internet
- To connect to internet via wireless network arch comes with iwd or Inet wireless daemon
- We can use this package to connect to the internet using wifi
- To connect to the internet use to following commands:
```
1.) type [ iwctl ] to start wifi connection terminal program in interactive mode
2.) type [ device list ] to list all available wireless devices or wireless nics on your computer
3.) type [ station <device-name> scan ] to scan all the nearby wirelss access points
4.) type [ station <device-name> get-networks ] to see all the list of availabe networks nearby
5.) type [ station <device-name> connect <SSID> ] to connect to a network

```
- To connect to internet via mobile broadband modem use `mmcli command`

#### 4.) Update system clock
- In linux NTP or network time protocol is used to sync the computer system clocks over a network
- On live arch environment systemd-timesynced is enabled by default and time will be synced automatically via internet
- to ensure if time is set correctly use `timedatectl`
- To enable NTP on arch live env if its not running use following command `timedatectl set-ntp true`

- #### 5.) Partitioning the disks
- Next step is to partition the disk where arch linux is to be installed
- Before partitioning the disk inquire about the disk layout using the `fdisk -l`
- The above command lists the partition table of all the disks on the computer
- One will usually work either with /dev/sda or /dev/nvme disks when installing arch or any other OS
- To check the device layout of the particular disk where one has to install arch use fdisk -l /dev/devic-name
- A much simpler and easier disk partition program cfdisk should be preffered to make partitions for easy , hassle free partitioning
- Cfdisk is ncurses based and is therfore interactive and user friendly
- Use the following command to stat the cfdisk on preffered device `cfdisk /dev/device-name`
- If device already has a partition table then the cfdisk will directly show all the availabe partitions
- Otherwise you will get to choose a partition table type to begin with
- Choose gpt for UEFI based system
- Then you will land on list of partitions / freespace on the device
- To install arch or any other distro you would need three main paritions namely: 
```

1.) Efi system partition : for storing files required by UEFI firmware to locate bootloader and boot system'
2.) Root    : For installting the distribution itself
3.) SWAP    : For serving as the overflow space for your RAM

```
- To create the partition of desired size enter size either by M(megabytes) or G(gigabytes) or T(terabytes)
- For Efi system partition allocate at least 500M and change the type of partition to EFI SYSTEM
- For root file partition highlight remaning space and assign size and the keep the type to linux filesystem
- Create a swap partition with size upto 4gb and change the type to Linux swap
- Write the changes and quit cfdisk
- For dual booting with windows if there is already a partition table and available partition dont mess with the EFI system parition as it is already there
- For disks with mbr parition table only two partition types are needed swap and root 

#### 6.) Formatting the paritions
- After creating the partition the next step is to format the paritions with appropriate file systems
- To achieve this once can use mkfs and mkswap programs
- To list all the partitions use `lsblk` or `fdisk -l`
- Format the root parittion to ext4 using `mkfs.ext4 /dev/root_partition`
- Format the efi parition if created newly using `mkfs.fat -F 32 /dev/efi_parition`
- Format the swap parition using `mkswap /dev/swap_partition`

#### 7.) Mount the file systems
- Now after creating paritions and file systems we will mount the file systems 
- mount the root file system using `mount /dev/root_partition /mnt`
- mount the efi file system using `mount --mkdir /dev/efi_parition /mnt/boot`
- if swap was created use `swapon /dev/swap_parition`

#### 8.) Configuring the mirror
- Configuring mirrors are done to install the packages .
- Mirrors can be configured via file /etc/pacman.d/mirrorlist
- On the live system, after connecting to the internet, reflector updates the mirror list by choosing 20 most recently synchronized HTTPS mirrors and sorting them by download rate.
- The higher a mirror is placed in the list, the more priority it is given when downloading a package. 
- Reflector can be used to generate mirrors based on various parameters 
- This command searches for mirrors and then saves them based on the latest , https and country `reflector --verbose --latest 12 --protocol https --country "$country_selected" --save /etc/pacman.d/mirrorlist`

#### 9.) Installing the system

- Before installing the system its a good idea to update the pacman using `pacman -Syy`
- Execute the following command to install the system `pacstrap /mnt base base-devel linux linux-firmware sudo vim networkmanager ntfs-3g`
- Heres what these packages do 
```
    base – Minimal package set to define a basic Arch Linux installation.
    base-devel – Group of packages required for building software from source.
    linux – The kernel itself.
    linux-firmware – Drivers for common hardware.
    sudo – You want to run commands as root right?
    nano – A pico editor clone with some enhancements.
    vim  - vim terminal text editor
    ntfs-3g – NTFS filesystem driver and utilities required for working with NTFS drives.
    networkmanager – Provides detection and configuration for systems to automatically connect to networks.
```
- Arch linux is installed , you may now configure the system according to your needs

#### 10.) Generating fstab
- The fstab file defines how disk partitions , various other block devices , or remote file systems should be mounted into the file system
- To generate the fstab file use `genfstab -U /mnt >> /mnt/etc/fstab`

#### 11.) Chrooting in new system
- To configure the system you have to login into the newly installed system from live user env 
- To accomplish this use `arch-chroot /mnt`
- This command lets one change to the newly installed root user without reboot

#### 12.) Generating Swapfile if swap parition was not used
- use the following commadn to make a swapfile of 2gb `fallocate -l 2GB /swapfile`
- change permisiions to `chmod 600 /swapfile`
- Then do the `mkswap /swapfile` to make swap
- Active the swap by typing `swapon /swapfile`
- The write this swapfile in the fstab file by following command `echo '/swapfile none swap defaults 0 0' >> /etc/fstab`

#### 13.) Time
- First thing we will configure is time
- To see list of all availabe time zones execute `ls /usr/share/zoneinfo`
- To set the time to any location in /usr/share/zoneinfo use following command `ln -sf /usr/share/zoneinfo/time_zone /etc/localtime`
- Then to sync the hardware clock to the system clock use `hwclock --systohc`

#### 14.) Configuring the locale
- Next we will configure our language 
- To do this we will edit the /etc/locale.gen file
- We will uncomment the preffered language in the locale.gen file and then run locale-gen command
- The locale-gen will read the locale.gen file in /etc and then configure the locale accordingly
- Now we set up default language of system by editing the /etc/locale.conf file and writint following line in it `LANG=en_US.UTF-8`
- If you set the console font at the start make changes persist by editing the /etc/vconsole.conf file and writing the following line in it `KEYMAP=<name>`


#### 15.) Network Configuration
- set the hostname in the /etc/hostname file
- make /etc/hosts file and add following lines to it
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   <user-name>.localdomain <user-name>
```
- install the network tools if not already installed useing `pacman -S networkmanager`
- enable the network manager using `systemctl enable NetworkManager`

#### 16.) enable multilib

- in /etc/pacman.conf file find and uncomment the following code
```
#[multilib]
#Include = /etc/pacman.d/mirrorlist

```

#### 17.) user account and password
- To set the root password use `passwd`
- By defalt passwd sets the password of the current user
- use `useradd -m -G wheel your_user_name` to create user 
- use `passwd your_user_name` to set user password
- enable sudo privileges for the users in the wheel group by uncommenting following line in /etc/sudoers file
`# %wheel ALL=(ALL) ALL`

#### 18.) Bootloader
- We will be using systemd-boot as our default bootloader to load into linux
- For dual booting grub should be preffered
- To install systemd use `bootctl --path=/boot install`
- Then edit the loader config file located in /esp/loader/loader.conf
- write the following in the loader.conf
```
default  arch-*
timeout  4
console-mode max
editor   no
```
- Edit the esp/loader/entries/arch.conf
- Enter the following command in it
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx|/dev/<root_partition> rw
```
- To install  grub use the following commands `pacman -S grub efibootmgr os-probber`
- next use `grub-install --target=x86_64-efi --bootloader-id=grub --efi-directory=/boot/efi`
- next generate the config file for grub using `grub-mkconfig -o /boot/grub/grub.cfg`
#### 19.) Misc

- install amd-ucode or intel-ucode using `pacman -S amd-ucode/intel-ucode`
- install gui budgie `pacman -S budgie nemo papirus-icon-theme mate-terminal arc-gtk-theme wireless_tools nano smartmontools wpa_supplicant htop nemo vim xdg-utils iwd openssh wget`
- install graphics drivers for desired gpu unit `pacman -S libva-mesa-driver vulkan-radeon xf86-video-ati xorg-xinit mesa xf86-video-amdgpu xorg-server `
- insall audio `pacman -S pipewire pipewire-alsa wireplumber pipewire-pulse`

Note: arch can also be installed using archinstall script

-------------------------------------------------------------------------------------------------------------

## Linux Mint

- Linux mint installation is fairly simple and one is guided via gui installer
- Linux mint is based on ubuntu  and uses apt package manager
- Linux mint is not bleeding edge and follows 6 monthly release cycle


-------------------------------------------------------------------------------------------------------------


## Ansible playbook

- Ansible Playbook is used to setup the arch or linux mint installation and set them to desired state
- We will use Ansible to install and set up config for our arch and linux mint installation
- for this we will make a playbook and host it on github
- We will have different repos for linux mint and arch 
- Our ansible-playbook repo will have a bootstrap bash script which will install the ansible,git and then use ansible-pull to run the remote playbook on our system
- Ansible playbook for Arch linux is at the https://www.github.com/drkknigt/arch-pull
- Ansible playbook for linux mint is at the https://www.github.com/drkknigt/.ansible_sync
- we will focus on the Arch ansilbe playbook here
- The structure of the repo is as follows

```
bootstrap.sh*  : bootstrap script to install and setup system
clone          : github private ssh key for authentication 
group_vars/    : variables used in ansible-playbook
LICENSE        : License file
local.yml      : main entry file for playbook to start
README.md      : readme file for repo
roles/         : various parts of the playbook

```

### bootstrap.sh arch

- bootstrap script is named bootsrap.sh and is a bash script 
- Bootstrap script basically pulls the ansible-playbook from github and runs it
- The bash script starts with asking user if they want to install rtl8821ce wifi driver 
- script saves the answer in wifi_info bash variable
- Then the script adds the option for parallel downloads in /etc/pacman.conf file
- Pacman updates and syncs package 
- If script is continued for execution it installs git , ansible ,  reflector via pacman
- It starts the ssh-agent next that will be later used for setting up git config 
- Script then checks if the argument provided to scripts are greater than one , if yes then the script passes those arguments as tags to the Ansible-pull and also passes the value of wifi_info variable to ansible-pull 
- After executing the playbook script exits
- If no args were passed to script then it runs the full playbook with wifi_info variable passed to the script and rtl8821ce wifi drivers are installed only if the value of wifi_info is yes
- At the end of execution of playbook script runs a bash file systemd-disabled to set default application for various file types
- The playbook  can be run either by cloning the https://www.github.com/drkknigt/arch-pull/ repo and then runing the ansible-playbook from within it or by this command 
```
curl -s https://raw.githubusercontent.com/drkknigt/arch-pull/main/bootstrap.sh -o bootstrap.sh && chmod +x bootstrap.sh && ./bootstrap.sh
```


### Clone

- Clone file is a private encrypted ssh ed25519 key
- It is encrypted using ansible-vault
- This key is cloned using ansible-playbook and then is unencrypted on local system and is then later used to clone dotfiles and other stuff from personal repo
- To clone this key use curl https://raw.githubusercontent.com/drkknigt/arch-pull/main/clone
- To decrypt is use ansible-vault decrypt clone
- Ansible-playbook sets up this key while running the Git roles automatically


### group_vars

- group_vars directory is used to set host-group specific global variables in ansible playbook
- using group_vars one can set variables either for all for some specific group
- in our group_vars we have a varible for all hosts (we only have one local host) which stores the value for the username of user executing the playbook


### License

- The license of the repo is Mit license

### local.yml

- local.yml is the entry point for the current bootstrap playbook
- local.yml holds the syntax for calling various roles that will be executed to achiver certain state
- local.yml update the arch using pacman and then starts the roles
- The roles in local.yml are as follows
```
1.) Git : sets up email , name , branch name , editor, pager,diff, github authentication keys
2.) pacman : set up scripts and tools for pacman and  reflector for mirrors
3.) directory : set up user directories like Downloads, Documents etc
4.) yay : install yay
5.) editor :  install code editors like vim , neovim and vs code
6.) languages : install various language runtimes and languages like rust, go , python , lua , etc
7.) terminals : set up and install terminals like alacritty , wezterm
8.) core : install various core tools e.g fzf, tmux, i3, dunst, pipewire, budgie , zsh, graphics, picom etc
9.) addons : install system software, multimedia software, network tools, power tools + essential software 
10.) config : set up dotfiles, wallpapers, fonts, and symbolic links
11.) game :  install wine, lutris, linux kenels and their headers
12.) wayland : install sway,wayland,sddm, hyprpicker,idle inhibit etc
13.) docker : install and setup docker
14.) systemd : enable and disable various systemd services
15.) wifi : install rtl8821ce kernel wifi driver
```

-------------------------------------------------------------------------------------------------------------

### README.md

- README.md is a simple markdown file that described the repo 


-------------------------------------------------------------------------------------------------------------

### Roles

- Ansible roles are structured way to organize tasks, variables,files, templates
- Roles lets one automatically load related vars, files, tasks, handlers and other artifacts
- Roles are group of variables,tasks, files  and handlers that are stored in a file structure
- Roles are used to modularize ansible-playbook
- Roles in our arch-pull playbook are as follows

```
1.) Git 
2.) pacman 
3.) directory 
4.) yay 
5.) editor 
6.) languages 
7.) terminals 
8.) core 
9.) addons 
10.) config 
11.) game 
12.) wayland 
13.) docker 
14.) systemd 
15.) wifi 
```
#### Git roles

- sets up the email  and name.
- sets the default branch name to main  and sets editor to nvim
- sets the pager to delta  and sets the pager options like asdf and other git options
- sets up the ssh dir and sets up lightweight passphrase dialog for ssh using x11-ssh-askpass
- sets ed25519 keys using ansible vault and adds ssh private key identites to openssh agent

#### Pacman roles

- Pacman roles install pacman-contrib and reflector 
- pacman-contrib installs tools and scripts for pacman systems
- reflector is used to get the latest mirrors for pacman

#### Directory roles

- Directory roles install xdg-user-dirs and sets up directories like ~/Downloads ~/Music

#### Yay roles

- Yay roles first install base-devel package for building software
- Yay roles then clones yay repo from archlinux
- Yay roles then builds yay with makepkg

#### Editor roles

- Editor roles install gvim and xclip 
- Editor roles also installs neovim , makes undodir for vim and neovim
- Editor roles installs vscode and neovide

#### Language roles

- Language roles install base-devel first
- Langugae roles installs python , make , tk , python-pip, python libraries like black,flake8,mypy,pylint, pytest,pyftpdlib,autopep8
- Language roles then installs poetry and pyenv
- Language roles installs clang after python stuff
- Language roles install lua53,luarocks,stylua,jsregexp,luacheck for lua language
- Language roles installs rustup, and then rust stable
- Language roles installs go, node,npm,n and node lts

#### Terminal roles

- Terminal roles make bin directory inside at `$HOME/.local`
- Terminal roles install alacritty, wezterm 

#### Core roles

- Core roles installs core tools 
- Core roles install tmux , fzf , picom , dunst, zsh
- Core roles install i3wm, i3blocks,i3lock, i3status 
- Core roles then install pipewire, wireplumber,pipewire-pulse,pipewire-alsa
- Core roles then install amd graphics and budgie and also sets up udev rules for brightness
- Core roles install zsh-defer, powerlevel10k theme and zsh suggestions

#### Addons roles

- Addons roles start with insalling some essential utilities
- Addons roles installs system-softwares like cmake,brightnessctl,vnstat,sysstat,cpupower,inxi,lsof
- Addons roles then installs multimedia utilities for videos like  mpv,ffmpeg,mediainfo,cheese,pavucontrol,vlc,imv,ffmpegthumbnailer,webp-pixbuf-loader
- Addons roles then installs multimedia utilities for images like nitrogen,lxappearance,arandr,xwallpaper,kcolorchooser,feh,gimp,chafa
- Next Addons roles install user-utilities programs like tldr,htop,rofi,bat,tree,xautolock,qbittorrent,libqalculate,sddm,xdotool,git-delta
- Next addons roles install disk-utilities namely smartmontools,gsmartcontrol,testdisk,udiskie
- Addons roles installs power-temp-utilities next e.g lm_sensors,psensor,acpi,tlp,tlp-rdw,powertop,thermald
- Next addons roles install telegram-desktop
- Next addons roles install network tools like Openssh,proxychains-ng,tor,torbrowser-launcher,nmap,whois,wireshark-qt,wireshark-cli,macchanger,bind,dnsutils
- Addons roles next install xorg and friends which includes pkpkgstats,  gst-libav,  jre8-openjdk, amd-ucode, xorg , xterm , perl-file-mimeinfo , less , coreutils , man-db , man-pages 
- Next Addons roles install downgrade package using yay and makes ~/usr/bin directory and updates mandb database
- Next we remove iptables
- Then we setup virtual machine in addons role in which we install virt-manager,dnsmasq,dmidecode,iptables-nft,qemu-full and add current user to group libvirt
- Addons roles next install lazygit, glow markdown reader for cli and firefox
- Next in addons role we install file searching tools for cli like fd , rg,mlocate
- Next we install zathura,brave browser,protonvpn using yay,gnome-keyring,lf,nnn,flameshot

#### Config roles

- In config roles we first clone our dotfiles to ~/.dotfiles, bootstrap repo for arch and mint to ~/arch-pull and ~/.ansible_sync respectievely
- Next we clone wallpaper repos to ~/wall and copy wallpapers to ~/Pictures
- Next we remove all build diretories and unneccesary directories  and install stow and set up .dotfiles using stow
- Next in config roles we make directory for fonts in ~/.local/share/fonts and install unzip,clone fonts,install noto-fonts-emoji and set up fonts using fc-cache
- Next in config roles we setup  lfrun and copy brave config from dotfiles to .config/brave
- Config roles then sets up symbolic links for brave,bat,fd,alacritty


#### Game roles

- In Game roles we install wine,lutris and gamemode using pacman
- Then we install linux-lts,linux-zen,linux-lts-headers,linux-zen-headers


#### Wayland roles

- Wayland roles start with installing sddm and settting up sddm theme
- Then in wayland we install sway dependencies like wlroots,sway,wayland,wayland-protocols,wayland-utils,wayvnc,waylandpp,xdg-desktop-portal-wlr,xorg-xwayland
- Then next we install tools for sway e.g swayimg,swaybg,grim,slurp,swayidle,swaylock,wl-clipboard,wmctrl,wofi,wev,wf-recorder
- Then in wayland we install grimshot,wlr-randr
- Next in wayland roles we install hyprpicker,audio-idle-inhibit-git using yay

#### Docker roles 

- In Docker roles we install docker,docker-compose and make a docker group and add user to it

#### Systemd roles

- In Systemd roles we enable and disable services, we enable tlp,thermald,cpupower,libvirtd,and disable webcam,network-wait-online service,and networkmanager-dispatcher service
- We also blacklist webcam, bluetooth,snd_hda_codec_hdmi in systemd roles

#### Wifi roles

- In wifi roles we build and install rtl8821ce driver using yay

-------------------------------------------------------------------------------------------------------------

## Dotfiles

- Dotfiles are  various config files for various applications in unix like systems

### Structure

```
1)  alacritty   : A fast gpu powered terminal emulator
2)  bash        : Bourne again shell default on most linux distros
3)  bin         : scripts for window manager and tmux and developing
4)  brave       : Brave browser config
5)  docs        : Docs for the workflow
6)  dunst       : lightweight notification daemon
7 ) fd          : fast enteries in filesystem using cli
8)  feh         : image viewer and background setter light weight
9)  i3          : dynamic tiling window manager
10)  i3blocks    : Define blocks for your i3bar status line
11)  imv         : Image viewer for Wayland and X11
12)  kitty      : A modern, hackable, featureful, OpenGL-based terminal emulator
13)  lazygit    : Simple terminal UI for git commands
14)  lf         : A terminal file manager inspired by ranger
15)  mpv        : a free, open source, and cross-platform media player
16)  nitrogen   : Background browser and setter for X windows
17)  nvim       : Fork of Vim aiming to improve user experience, plugins, and GUIs
18)  picom      : A lightweight compositor for X11
19)  polybar    : A fast and easy-to-use status bar
20)  pypoetry   : Python dependency management and packaging made easy
21)  rofi       : A window switcher, application launcher and dmenu replacement
22)  sddm       : QML based X11 and Wayland display manager
23)  sway       : Tiling Wayland compositor and replacement for the i3 window manager
24)  sxhkd      : Simple X hotkey daemon
25)  sys_d      : directory contain loader.conf and sys.conf for bootctl
26)  tmux       : Terminal multiplexer
27)  vim        : improved version of the vi text editor (with advanced features, such as a GUI)
28)  vlc        : Multi-platform MPEG, VCD/DVD, and DivX player
29)  waybar     : Highly customizable Wayland bar for Sway and Wlroots based compositors
30)  wezterm    : A GPU-accelerated cross-platform terminal emulator and multiplexer
31)  wofi       : launcher for wlroots-based wayland compositors
32)  xinit      : A xserver starting scripts
33)  zathura    : Minimalistic document viewer
34)  zsh        : A very advanced and programmable command interpreter (shell) for UNIX  
```


-------------------------------------------------------------------------------------------------------------

## bin  

- Bin is a directory containing all the user scripts that are used to enhance the developer experience
- The structure of the directory is as follows:
```
/home/drkknght/.dotfiles/bin
└── bin  
    ├── navigation                  : Scripts for file navigation and git direcotory search
    │   │
    │   ├── file_exp.sh         ->  This script seraches for files and directories for wm  
    │   ├── file_manager.sh     ->  This script is used to open lf file manager for wm and tmux , terminal
    │   ├── git_info.sh         ->  shows status of the git directory in the preview window of the fzf 
    │   ├── navigation.sh       ->  searches files in terminal and opens in nvim for terminal
    │   └── search_git.sh       ->  searches git directory and opens them in lazygit for wm, tmux, terminal
    │
    ├── network                     :  Scripts for wifi and internet
    │   │
    │   ├── wifi_connect.sh     ->  this script is used to turn wifi on and off
    │   ├── wifi_fzf2.sh        ->   test script used to connect to internet
    │   └── wifi_fzf.sh         ->   script used to connect to the internet using wifi
    │
    ├── screen                      : scripts to change the screen resolution and screen scale
    │   │
    │   ├── change_background.sh        -> changes the background of the desired monitor in i3wm
    │   ├── change_background_sway.sh   -> changes the background of the desired monitor in sway
    │   ├── change_sddm_background.sh   -> changes the background at the sddm login screen
    │   ├── resolution.sh               -> script changes the resolution of the screen  for i3wm
    │   ├── resolution_sway.sh          -> This script is used to set the resolution for the sway 
    │   ├── scale.sh                    -> set the scale value for the screen in i3wm
    │   └── scale_sway.sh               -> sets the scale value of the monitor in sway window manager
    │
    ├── system_scripts              : scripts to perform various user tasks in wm
    │   │
    │   ├── ai                          ->  runs LLM models locally or from grop.com remotely
    │   ├── brightness.sh               ->  set brightness value for monitor
    │   ├── check_battery.sh            ->  alerts the user when battery is low
    │   ├── cpu_info.sh                 ->  Show cpu governor info, paths and kernel info
    │   ├── governor.sh                 ->  This scripts sets the cpu governor 
    │   ├── keymap.sh                   ->  Show keymaps for the system
    │   ├── kill.sh                     ->  Script used to kill applications
    │   ├── man_pages.sh                ->  Show and list man pages
    │   ├── mount.sh                    ->  This script is used to mount devices
    │   ├── notes.sh                    ->  open notes in nvim
    │   ├── pac-clear                   ->  This script is used to clear the pacman and yay cache
    │   ├── scaling_energy.sh           -> script is used to set the scaling energy_performance_preference 
    │   ├── screen_recorder.sh          ->  This script is used to record screen
    │   ├── wofi-theme-select.sh        ->  This script is used to select and set the theme for wofi
    │   └── wofi_windows.sh             ->  selects and goto different wm windows using wofi in sway
    │
    └── tmux_scripts              : These scripts are used for dev workflow in tmux 
        │
        ├── tmux_change_dir.sh          ->  changes directory in a new window pane using fzf
        ├── tmux_cht.sh                 ->  This script uses cht.sh to get info on programs
        ├── tmux_create.py              ->  Python script to create tmux session
        ├── tmux_create.sh              ->  creates a new tmux session  or load from earlier created session
        ├── tmux_kill.py                ->  script to kill tmux sessions
        ├── tmux_kill.sh                ->  This script is used to kill tmux sessions
        ├── tmux_session_switch.py      ->  script to switch tmux session
        ├── tmux_session_switch.sh      ->  This script is used to switch session in tmux
        └── tmux_new_project.sh         ->  create project and start session tmux session in project

```

- All the keybindings of the system are documented in ~/.dotfiles/docs/i3_keymaps.md



