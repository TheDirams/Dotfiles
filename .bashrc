# /etc/bash.bashrc
#
# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

case ${TERM} in
	xterm*|urxvt*|st|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
	screen)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
		;;
esac

	PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

#General Aliases
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color"
alias rm="rm -i"
alias off="sudo shutdown now"
alias vimrc="vim ~/.vimrc"

#Git aliases
alias g="git status"
alias ga="git add"
alias gaa="git add ."
alias gau="git add -u"
alias gc="git commit -m"
alias gca="git commit -am"
alias gb="git branch"
alias gbd="git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gt="git stash"
alias gta="git stash apply"
alias gm="git merge"
alias gr="git rebase"
alias gl="git log --oneline --decorate --graph"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset
-C%(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
--"
alias glga="git log --graph --oneline --all --decorate"
alias gs="git show"
alias gd="git diff --color --color-words --abbrev"
alias gdc="git diff --cached"
alias gbl="git blame"
alias gps="git push"
alias gpl="git pull"
alias gc="git commit"
alias gd="git diff"
alias gk="gitk --all&"
alias gx="gitx --all"

PS2="> "
PS3="> "
PS4="+ "

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

#Exports and Paths

PATH="$HOME/bin:$PATH"
#export PATH="$HOME/.local/bin/statusbar:$PATH"
