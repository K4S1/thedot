xset r rate 200 50
#tmux new -d -s redshift 'redshift -l 55.22992:11.76092 -b 1.0:0.6 -t 6500:4500 -v'

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

# /home/ksadmin/.cargo/bin
if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

# /usr/local/go/bin
if [ -d "/usr/local/go/bin" ] ;
  then PATH="/usr/local/go/bin:$PATH"
fi
