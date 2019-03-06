#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Run with $0 <output.log>"
    exit 1
else
    echo Exit with ^C
    echo SystemTap is starting slowly...
    sudo ./container_check.stp -x `pgrep -f docker-containerd-current` > $1

    sed -i 's#(pid)#(container)#g' $1
    sudo docker inspect -f "sed -i 's#({{.State.Pid}})#({{.Name}})#g' $1" \
	 `sudo docker ps -aq --no-trunc` | bash
fi
