bindkey -v

export no_proxy='*' export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  vi-mode
)
source $ZSH/oh-my-zsh.sh

alias k=kubectl
alias suc="sort | uniq -c | sort -n"

kcn() {
kubectl config set-context --current --namespace=$1
}

function get_advent_input() {
    my_cookie="session=53616c7465645f5fd9e464df999508534baf3b62f8b65974d5faaa222158163ea984e15306bc9095dd0b3dfa59271e3f51f48b15131785197331c7400a4fcff5"
    url_path_str=$(awk -F/ '{x=$(NF);print $(NF-1) " " x}' <(echo $PWD))
    year=$(cut -f 1 -d" " <(echo $url_path_str))
    day_str=$(cut -f 2 -d" " <(echo $url_path_str))
    day=$((${day_str#"day"}+0))
    curYear=$(date +%Y)
    if [[ "$day" -ge "1" ]] && [[ "$day" -le "25" ]]
    then
        if [[ "$year" -ge "2015" ]] && [[ "$year" -le "$curYear" ]]
        then
            urlPath="https://adventofcode.com/$year/day/$day/input"
            echo $urlPath >&2
            curl --cookie "$my_cookie" "$urlPath"
        else
            echo "Your dirPath doesn't match a year. CWD must be end with year/day" >&2
            echo "Year: ${year}. Day: ${day}." >&2
        fi
    else
        echo "Your dirPath doesn't match a year. CWD must be end with year/day" >&2
        echo "Year: ${year}. Day: ${day}." >&2
    fi
} 
