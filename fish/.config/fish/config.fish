set fish_greeting
set PATH $PATH /usr/local/go/bin 
set PATH $PATH $HOME/.go/bin
set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.yarn/bin
set PATH $PATH $HOME/.local/bin
set PATH $PATH (find $HOME/.scripts/ -type d ) 

# Abbreviation
abbr -a ws 'sudo systemctl start windscribe'
abbr -a wind 'windscribe connect'


# Enviroment Variables
set -Ux TERMINAL kitty
set -Ux RANGER_LOAD_DEFAULT_RC FALSE
set -gx EDITOR (which nvim) 
set -gx GOPATH ~/.go
set -g theme_color_scheme dracula
#-----------------------------------------------------
#Aliases
#-------------------------------------------------------
alias ssh="kitty +kitten ssh"
alias vim="nvim"
#alias lf lfrun
alias color "colorscript random"
alias ll "exa --icons -l -g"
alias tlmgr "/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"

#--------------------------------------------------------
#Function
#--------------------------------------------------------
# source nvm
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Source rvm Ruby Verson Manager
function rvm
	bass source ~/.rvm/scripts/rvm ';' rvm $argv
end

# Add icons to LF_ICONS Variable for lf
if test -e ~/.config/lf/icons
    set -gx LF_ICONS (sed ~/.config/lf/icons \
    	    -e '/^[ \t]*#/d'       \
    	    -e '/^[ \t]*$/d'       \
    	    -e 's/[ \t]\+/=/g'     \
    	    -e 's/$/ /')
    set LF_ICONS (echo "$LF_ICONS" | tr '  ' ':' | sed "s/::/:/g")
end

# Run tmux on Start up
#if status is-interactive
#and not set -q TMUX
#	set -g TMUX tmux new-session -d -s base
#    eval $TMUX
#    tmux attach-session -d -t bas
#end

