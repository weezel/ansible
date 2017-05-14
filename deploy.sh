#!/bin/sh

ANSIBLE=$(which ansible)
ANSIBLE_PLAYBOOK=$(which ansible-playbook)

usage()
{
	printf "usage: %s: inventoryfile tags rolename\n" ${0}
	exit 1
}

if [ $# -ne 3 ]; then
	usage
fi

if [ ! -r "${1}" ]; then
	echo "Error: File ${1} doesn't exist"
	exit 1
fi
if [ ! -r "${3}" ]; then
	echo "Error: File ${3} doesn't exist"
	exit 1
fi

${ANSIBLE_PLAYBOOK} -i "${1}" -kK -t "${2}" "${3}"

