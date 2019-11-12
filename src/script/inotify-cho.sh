#!/bin/bash
source /etc/inotify-cho.conf

events="moved_to"
    
inotifywait -m -r -e $events $watch_dir |
    while read path action file; do
        grupo=$(stat -c "%G" $path)
        chgrp $grupo $path$file &&\
            echo "$(date) - chgrp $grupo ${path}$file" ||\
            echo "$(date) error al cambiar de grupo ${path}$file >&2 "
done
