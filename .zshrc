if [ -d "/usr/share/oh-my-zsh" ]; then
    export ZSH=/usr/share/oh-my-zsh/
fi
if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH=$HOME/.oh-my-zsh/
fi

ZSH_THEME="sunrise"
plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh


if [ -d "/usr/share/zsh/plugins/zsh-syntax-highlighting" ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -d "/usr/share/zsh-syntax-highlighting" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export HISTSIZE=50000
export HISTFILESIZE=50000
#export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export HISTCONTROL=ignoreboth:erasedups
export HISTORY_IGNORE='([bf]g *|cd ..|..|l[alsh]#( *)#|less *|vim# *)'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
  export VISUAL='emacs'
else
  export EDITOR='nvim'
fi

#export LANG=en_DK.UTF-8

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

#alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Fix SSH in alacritty
alias ssh='TERM=xterm-256color /usr/bin/ssh'

#alias myip='~/Nextcloud/Code/BashCode/myip.sh'
alias top='bpytop'
alias doom='~/.emacs.d/bin/doom'
alias ec='emacsclient -c -a emacs'
alias COMport="sudo minicom -m -c on"
#alias rdp="xfreerdp -window-drag -menu-anims -themes +fonts /bpp:32 -compression /dynamic-resolution /f /audio-mode:0 /mic:format:1 /sound:latency:50 -floatbar /u:'v5yjeppy@zenitel.com' /p:'' /v:10.5.222.187"
alias rustscan='docker run -it --rm --name rustscan cmnatic/rustscan:debian-buster rustscan'

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# Changing "cat" to "bat"
#alias cat='bat'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"


# broot
alias br='broot -dhp'
alias bs='broot --sizes'

#alias obscam="sudo modprobe v4l2loopback devices=1 video_nr=10 card_label=\"OBS Cam\" exclusive_caps=1 \
#    && sudo modprobe snd-aloop index=10 id=\"OBS Mic\" \
#    && pacmd 'update-source-proplist alsa_input.platform-snd_aloop.0.analog-stereo device.description=\"OBS Mic\" ' \
#    && ffmpeg -probesize 32 -analyzeduration 0 -listen 1 -i rtmp://127.0.0.1:1935/live/test -map 0:1 -f v4l2 -vcodec rawvideo /dev/video10 -map 0:0 -f alsa hw:10,1"

## From Arco zshrc

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy bashrc-latest over on bashrc - cb= copy bashrc
#alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && exec zsh'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

#hardware info --short
alias hw="hwinfo --short"

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlightdm="sudo nvim /etc/lightdm/lightdm.conf"
alias npacman="sudo nvim /etc/pacman.conf"
alias ngrub="sudo nvim /etc/default/grub"
alias nconfgrub="sudo nvim /boot/grub/grub.cfg"
alias nmkinitcpio="sudo nvim /etc/mkinitcpio.conf"
alias nmirrorlist="sudo nvim /etc/pacman.d/mirrorlist"
alias nsddm="sudo nvim /etc/sddm.conf"
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-key="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

alias curltime="curl -w @$HOME/.config/curl.format  -o /dev/null -s "

#DotFiles theDot
alias dotfiles='/usr/bin/git --git-dir=$HOME/.thedot/ --work-tree=$HOME'

random-string()
{
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export NNN_PLUG='v:preview-tui;p:mocplay;'
set --export NNN_FIFO '/tmp/nnn.fifo'

neofetch

source /home/ks/.config/broot/launcher/bash/br
