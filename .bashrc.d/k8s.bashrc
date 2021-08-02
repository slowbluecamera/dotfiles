
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="${KUBECTX_ROOT:-$HOME/x/kubectx}:$PATH"
alias kc=kubectx
alias kn=kubens
