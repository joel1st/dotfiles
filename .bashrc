#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
# <<< END ADDED BY CNCHI INSTALLER

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias dc='docker-compose'
alias dcd='docker-compose kill && docker-compose rm -f'
alias dcp='docker-compose pull --parallel'
alias ll='ls -la'

xmodmap -e "clear Lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

alias cbc='xclip -selection clipboard'
alias cbp='xclip -selection clipboard -o'

export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export GITAWAREPROMPT=~/.bash/git-aware-prompt
export LESS="-FSXR"
source "${GITAWAREPROMPT}/main.sh"
alias r='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

tmux attach &> /dev/null
[[ $TERM != "screen" && $TERM != "screen-256color" ]] && tmux
source ~/.mycli-profile
alias gitclone='echo "git@github.com:DenisKolodin/yew.git"'
