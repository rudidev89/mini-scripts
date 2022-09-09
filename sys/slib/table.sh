#!/data/data/com.termux/files/usr/bin/bash
# Copyright (c) 2016-2022
# Romeo Delta <rudidev89@gmail.com>

# source /storage/emulated/0/rudidev89/lib/function.sh

# create your script here.
case $1 in
-d)d=;;
-h)h=;;
-v)v=;;
*)exit 1
esac

function to_table() {
    local delimiter=","
    local line_h="-"
    local line_v="|"
    local input="$(cat -)"
    local header="$(echo -e "${input}"|head -n1)"
    local body="$(echo -e "${input}"|tail -n+2)"
    local cols=$(grep -o ',' <<<"$header" | grep -c .)
    ((cols++))
    local line="+$(for i in $(seq 2 ${cols}); do echo -ne "${delimiter}+"; done)${delimiter}+"
    {
        echo -e "${line}"
        echo -e "${header^^}"|sed -e "s/^/${line_v} /;s/\$/${delimiter}/;s/${delimiter}/${delimiter}${line_v} /g"
        echo -e "${line}"
        echo -e "${body}"|sed -e "s/^/${line_v} /;s/\$/${delimiter}/;s/${delimiter}/${delimiter}${line_v} /g"
        echo -e "${line}"
    } | column -t -s ${delimiter}|sed -e "1s/ /${line_h}/g;3s/ /${line_h}/g;\$s/ /${line_h}/g"
}

