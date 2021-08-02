
if [ -e /usr/local/bin ]; then
    export PATH="/usr/local/bin:$PATH"
fi

if [ -e $HOME/bin ]; then
    export PATH="$HOME/bin:$PATH"
fi