#!/data/data/com.termux/files/usr/bin/bash

# Copyright (c) 2022-2022
# Romeo Delta <rudidev89@gmail.com>

# create your script here.

function decor_line() {
	local line=${1:-"~"}
	printf ${line}'%.0s' $(seq 1 $(tput cols)) | sed 's/^ //'
}

function decor_header(){
	[ -z $1 ] && text="mini_script_by:rudidev89" || text=$1;
	text=${text^^};
	decor_line "=";
	echo "<( ${text//_/ } )>" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols);
	decor_line "=";
}


