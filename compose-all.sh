#!/usr/bin/env bash
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
hosts=(cecil biggs wedge)
(
  for host in "${hosts[@]}"; do
    command="cd $here/$host; source ./.envrc; docker-compose"
    while read -r -d $'\0'; do
      command+=" -f $REPLY"
    done < <(find -E "$here/$host" -type f -regex '.*\.ya?ml$' -print0)
    echo "$command $*"
  done
) | xargs -P${#hosts[@]} -I{} sh -c '{}'
