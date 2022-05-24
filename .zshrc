export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

bindkey "^R" history-incremental-search-backward

set -o vi
alias k=kubectl
alias suc="sort | uniq -c | sort -n"

kcn() {
kubectl config set-context --current --namespace=$1
}
