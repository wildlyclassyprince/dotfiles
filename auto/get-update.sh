#! /bin/bash --

# get-updates.sh
# Action:
# Check for Updates - Download Updates - Install Updates - Remove Deprecations
# ----------------------------------------------------------------------------
# Overview:
# This script aims at easing the downloading and installation of packages.
# ----------------------------------------------------------------------------
# Options:
# u : check for system updates.
#
# i : Download system updates if any. 
#
# U : Install the downloaded updates.
#
# a : Remove deprecated packages.

# Usage:
usage()
{
	echo "Usage -$0 [ -uiUa ]"
	exit 2
}

# Options
while getopts ":u, :i, :U, :a" opt; do
	case ${opt} in
		u ) echo "Getting updates ..."
			sudo apt-get update;;
		i ) echo "Downloading updates ..."
			sudo apt-get install;;
		U ) echo "Installing updates ..."
			sudo apt-get upgrade;;
		a ) echo "Removing deprecated packages ..."
			sudo apt-get autoremove;;
		h|? ) echo "Invalid entry."
			  usage
			  ;;
	esac
done
shift $(( OPTIND -1 ))
if [ ! -z '$@' ];
then
	echo "Bad argument: $@"
fi
