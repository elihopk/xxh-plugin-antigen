# Antigen ZSH Plugin for XXH 

cd "$(dirname "$0")" 1>/dev/null
CURR_DIR="$(pwd)"
PLUGIN_NAME="xxh-plugin-zsh-antigen"

export ADOTDIR=$CURR_DIR/antigen

if [[ $XXH_VERBOSE == '2' ]]
then
    echo "$PLUGIN_NAME: ADOTDIR: $ADOTDIR"
fi

ln -s $CURR_DIR/../../../shells/xxh-shell-zsh/build/.zshrc $CURR_DIR/../../../../.zshrc 2>/dev/null

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

newBundles=("${(@s/:/)bundles}")

for i in "${newBundles[@]}"
do
    if [[ $XXH_VERBOSE == '2' ]]
    then
        echo "$PLUGIN_NAME: Adding Bundle $i"
    fi
    antigen bundle $i
done

antigen apply 1>/dev/null
