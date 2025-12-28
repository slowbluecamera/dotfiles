
# $HOME/.shrc.d personal init files
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
for file in ~/.shrc.d/*.shrc; do
  source $file
done

# Netskope CLI Certificate Fix
source /opt/montu-kandji/netskope-cli-certificate-fix.sh

