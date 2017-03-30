#!/bin/sh

# Parameters:
# - local_facts
# - hostname
#
# The first option local_facts gathers facts from the local computer.
# Surprisingly, the second option will gather facts from the remote host(s).

ANSIBLE=$(which ansible)

usage()
{
	printf "usage: %s: [subset|local_facts] [inventoryfile]\n" ${0}
	exit 1
}

if [ $# -eq 1 ]; then
	if [ "${1}" = "local_facts" ]; then
		${ANSIBLE} localhost --connection=local \
			-m setup --tree localfacts
	else
		usage
	fi
elif [ $# -eq 2 ]; then
	if [ ! -r "${2}" ]; then
		echo "Error: File ${2} doesn't exist"
		exit 1
	fi
	${ANSIBLE} all -l "${1}" -i "${2}" -k -m setup --tree remotefacts
else
	usage
fi

