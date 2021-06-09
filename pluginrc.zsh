# Antigen ZSH Plugin for XXH 

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_NAME="xxh-plugin-zsh-antigen"

export ADOTDIR=$CURR_DIR/antigen

if [[ $XXH_VERBOSE == '2' ]]
then
    echo "$PLUGIN_NAME: ADOTDIR: $ADOTDIR"
fi

ln -s $CURR_DIR/../../../shells/xxh-shell-zsh/build/.zshrc $CURR_DIR/../../../../.zshrc 

source $ADOTDIR/antigen.zsh

if [[ -v bundles ]]
then
    if [[ $XXH_VERBOSE == '2' ]]
    then
        echo "$PLUGIN_NAME: Bundles is set = $bundles"
    fi
else
    if [[ $XXH_VERBOSE == '2' ]]
    then
        echo "$PLUGIN_NAME: Bundles not set"
    fi
fi

for i in $bundles
do
    antigen bundle $i
done

antigen apply
