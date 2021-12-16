set fish_greeting
set PATH $PATH /usr/local/go/bin
set PATH $PATH /home/m3d/go/bin
set PATH $PATH /home/m3d/.cargo/bin
set PATH $PATH /home/m3d/.yarn/bin
abbr -a ws 'sudo systemctl start windscribe'
abbr -a wind 'windscribe connect'
set EDITOR (which nvim) 
set -g theme_color_scheme dracula
#-----------------------------------------------------
#Aliases
#-------------------------------------------------------
alias vim="nvim"
alias lf lfrun
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

# Run tmux on Start up
if status is-interactive
and not set -q TMUX
	set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t bas
end

