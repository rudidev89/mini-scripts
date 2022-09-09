#!/data/data/com.termux/files/usr/bin/bash

# Copyright (c) 2016-2022
# Romeo Delta <rudidev89@gmail.com>

# create your script here.

# *bold text*
function md_bold_text(){
	echo -e "*${*}*"
}

# _italic text_
function md_italic_text(){
	echo -e "_${*}_"
}

# [inline URL](http://www.example.com/)
function md_url(){
	echo -e "[$1]($2)"
}

# [inline mention of a user](tg://user?id=123456789)
function md_mention(){
	echo -e "[$1](tg://user?id=$2)"
}

#`inline fixed-width code`
function md_code(){
	echo -e "\`${*}\`"
}


# ```python
# pre-formatted fixed-width code block written in the Python programming language
# ```
function md_code_block(){
	local input=$(cat -)
	echo -e "\`\`\`${1}\n${input}\n\`\`\`"
}






