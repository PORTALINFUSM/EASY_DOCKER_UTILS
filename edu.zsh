FW_DIR=$(cd `dirname $0` && pwd)

all_coms(){
    FOLDERS=($(ls -d $FW_DIR/coms/*/))
    for folder in ${FOLDERS[@]}; do
        USAGE=$(cat $folder/info.txt | grep "¬")
        echo -e "${USAGE//'¬'/}"
    done
}
usage_msg(){
    echo -e "usage mode:\n\n    edu <command> [args]\n\nlist of commands:\n"
    all_coms
}

if [ $# == 0 ]; then
    usage_msg
    exit 0
fi
if [ -d $FW_DIR/coms/$1 ]; then
    bash $FW_DIR/coms/$1/com.zsh ${@:2}
else
usage_msg
exit 1
fi
