#!/data/data/com.termux/files/usr/bin/bash

# Copyright (c) 2022-2022
# Romeo Delta <rudidev89@gmail.com>

source /storage/emulated/0/rudidev89/sys/function.sh

# create your script here.

function get_file(){
	local path=${2}
	find ${rootpath}/${path} | while read -r file; do
		if [ -f ${file} ]; then
			if [ "${1}" == "${file##*/}" ]; then
				echo ${file}
			fi
		fi
	done
}

function create_file(){
	if [ -f ${rootpath}/${1} ]; then
		printf "File : ${rootpath}/${1} ready.\n"
	else
		local template="#!${PATH}/bash\n\n# Copyright (c) 2022-$(date '+%Y')\n# Romeo Delta <rudidev89@gmail.com>\nsource /storage/emulated/0/rudidev89/sys/function.sh\n"
		[ -f $(get_lib $2) ] && template+="sourcelib $2"
		template+="\n# Tulis scripts disini\n"
		#local create=$(
		echo -e ${template} >> "${rootpath}/${1}"
	fi
}

function get_lib(){
	if [ ${#} ]; then
		for lib in ${@}; do
			if [ -f "${slibpath}/${lib}.sh" ]; then
				echo "${slibpath}/${lib}.sh"
			elif [ -f ${libpath}/${lib}.sh ]; then
				echo "${libpath}/${lib}.sh"
			else
				printf "Library ${lib}.sh not found.\n"
			fi
		done
	fi
}

