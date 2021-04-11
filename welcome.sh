#!/usr/bin/env bash
user=${USER^}
c="\e[0m"
c1="\e[34;1m"
c2="\e[32;1m"

# Welcome
welcstr="${c}Welcome back, "$user"${c}!"


# Date
day=$(date +"%A")
mon=$(date +"%B")
date=$(date +"%d")
year=$(date +"%Y")
suffix=""

pat="([0-9])([0-9])"
if [[ $date =~ $pat ]]
then
	d2=${BASH_REMATCH[2]}

	case $d2 in
		1*)
			suffix="st"
			;;
		2*)
			suffix="nd"
			;;
		*)
			suffix="th"
			;;
	esac
fi

datestr="${c}It is \e[48;5;34m ${day} ${c} the ${date}${suffix} of ${mon}, ${year}${c}"

printf "            │ \t*\n"
printf "  ͞͞͞͞ ͞         │ \t*\n"
printf "  /ᐠ⎽ᐟ\\    ╱  \t${welcstr}\n"
printf " (  'v')  <   \t${datestr}\n"
printf "⎺ U ⎺⎺ U⎺  ╲ \n"
printf "            │ \t*\n"
printf "            │ \t*\n"

