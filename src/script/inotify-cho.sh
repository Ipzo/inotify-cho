#!/bin/bash
source /etc/inotify-cho.conf

events="moved_to"

# -m <monitor>		Don't quit after the first event
# -r <recursive>	Watch all subdirectories of $watch_dir
# -e <event>		Listen for specific event(s) only
    
inotifywait -m -r -e $events "$watch_dir" |
    while read path action file; do
        grupo=$(stat -c "%G" $path)
        chgrp $grupo $path$file &&\
            echo "$(date) - chgrp $grupo ${path}$file" ||\
            echo "$(date) error al cambiar de grupo ${path}$file >&2 "
done
