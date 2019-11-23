plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ls="ls -GAh"
alias cp="cp -i"
alias cpr="cp -iR"
alias rm="rm -i"
alias rmr="rm -fr"
alias grep="grep --color"
alias fgrep="fgrep --color"
alias ll="ls -lGAh"
alias df="df -h"
alias du="du -h"
alias h="fc -l"
alias m="more"
alias cls="clear"

#export PS1="\[\033[03;36m\][\[\033[03;38m\]\u@\h\[\033[03;36m\] \W ]\\$ \[\033[0                                     0m\]"
#CLICOLOR="YES";    export CLICOLOR
#LSCOLORS="ExGxFxdxCxDxDxhbadExEx";    export LSCOLORS

#CLICOLOR="YES";    export CLICOLOR
#LSCOLORS="ExGxFxdxCxDxDxhbadExEx";    export LSCOLORS

#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi

my_pushreview() {
    git push -4 origin HEAD:refs/for/$1
}

my_new_branch() {
    if [ -z $1 ]; then 
        echo "\$1 - new branch name; \$2 - based on branch"
    else
        git checkout -b $1 origin/$2 && git push origin $1 -u
    fi
}


my_commit_and_push() {
    git commit -a -m $1 && git push
}

my_checkout() {
    git checkout $1 && git pull -4
}

my_wcl() {
    wc -l  `find . -name "*.java"  -o -name "*.js" -o -name "*.ts" -type f` | tail -1
}

alias ping8="ping 8.8.8.8"
alias sockstat="lsof -PiTCP -sTCP:LISTEN -n"

alias ee="open -a Sublime\ Text $1"
alias new_branch="my_new_branch"
alias cdo="cd ~/Documents/origin"
alias top="top -o cpu -n 25"
alias ghr="git reset --hard"
alias ghr1="git reset --hard HEAD~1"
alias ghr2="git reset --hard HEAD~2"
alias gb="gradle build"
alias gcb="gradle clean build"
alias gp="git pull "
alias gpr="git pushreview"
alias gf="git fetch -4"
alias gpu="git push -4"
alias gprc="my_pushreview"
alias gdiff="git diff"
alias gco="git checkout"
alias gs="git st"
alias gst="git st"
alias gsh="git show"
alias gls="git ls"
alias gca="git commit -a"
alias gcaa="git commit --amend -a"
alias gco="my_checkout"
alias gbr="git branch -a --contains"
alias gss="git stash"
alias gsp="git stash pop"
alias gcp="my_commit_and_push"
alias gdl="git describe --long"

alias wcl="my_wcl"

alias ka9="killall -9 java"

if [ -f ~/.ssh_aliases ]; then
	. ~/ssh_aliases
fi

function setjdk() {
    if [ $# -ne 0 ]; then
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if [ -n "${JAVA_HOME+x}" ]; then
            removeFromPath $JAVA_HOME
        fi
        export JAVA_HOME=`/usr/libexec/java_home -v $@`
        export PATH=$JAVA_HOME/bin:$PATH
    fi
}
function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.8

