#!/bin/bash
# used for automated variable substitution purposes, do not remove
export DATABASE_URL=$DATABASE_URL 
export MY_DB_URL=$MY_DB_URL

# cd to the directory of the script
cd "$(dirname "$0")"

# cd to the helper scripts
cd .pscale/cli-helper-scripts/

. export-db-connection-string.sh "launch-gui"
. set-db-url.sh

# cd back
cd -

python3 gui.py --sleep-interval=100 --environment="$GITHUB_USER"