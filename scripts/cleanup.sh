#!/usr/bin/env bash
# This is a simple script to clean up our neighborli db weekly.
# It cleans out cached media, freeing up disk space.
title="neighborli cleanup script"
mastodon_dir="$HOME/live/bin"
# funcs 
cleanup () {
	su mastodon && cd $mastodon_dir
	RAILS_ENV=production ./tootctl media remove --days 0 && RAILS_ENV=production ./tootctl media remove --prune-profiles 
}
error_handler () {
	echo "Something went wrong. Please see logs."; sleep 1
	exit
}
main () {
	echo "$title"; sleep 1
	echo "Beginning cleanup process..."; sleep 1
	cleanup
	echo "Neighborli cleanup complete."; sleep 1
	exit
}
# - - - entry 
main || error_handler
