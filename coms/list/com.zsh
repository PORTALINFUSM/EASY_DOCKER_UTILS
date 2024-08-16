FW_DIR=$(dirname $(dirname $(cd `dirname $0` && pwd)))

table(){
    FOLDERS=($(ls $FW_DIR/projects | grep ".eduf"))
    for folder in ${FOLDERS[@]}; do
        CAT=($(cat $FW_DIR/projects/$folder | grep -v "LAST_PID"))
        PJ_DIR=(${CAT[0]//'='/ })
        STATE=(${CAT[1]//'='/ })
        printf "%-20s %-20s %-20s\n" ${folder//'.eduf'/} ${STATE[1]} ${PJ_DIR[1]}
    done
}

printf "%-20s %-20s %-20s\n" PROJECT STATE DIR
table | grep "$1"