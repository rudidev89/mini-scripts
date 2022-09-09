#!/data/data/com.termux/files/usr/bin/bash

# Copyright (c) 2022-2022
# Romeo Delta <rudidev89@gmail.com>

source /storage/emulated/0/rudidev89/sys/.env

# create your script here.

function sourcelib(){
	if [ ${#} ]; then
		for lib in ${@}; do
			if [ -f "${slibpath}/${lib}.sh" ]; then
				source ${slibpath}/${lib}.sh
			elif [ -f ${libpath}/${lib}.sh ]; then
				source ${libpath}/${lib}.sh
			else
				printf "Library ${lib}.sh not found.\n"
			fi
		done
	fi
}

function function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}