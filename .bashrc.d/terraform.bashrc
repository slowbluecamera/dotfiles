
export PATH="$HOME/.tfenv/bin:$PATH"

alias tfp="terraform plan"
alias tfi="terraform init"

function tfrm() {
    echo "finding & removing '$1' from state..."
    terraform state rm `terraform state list | grep $1`
}
