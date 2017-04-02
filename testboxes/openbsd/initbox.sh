#!/bin/sh

vagrant box add ryanmaclean/openbsd-6.0
vagrant init ryanmaclean/openbsd-6.0
vagrant up --provider virtualbox
