#!/bin/bash

case "$SSH_ORIGINAL_COMMAND" in
  *\&*|*\(*|*\{*|*\;*|*\<*|*\`*)
    echo "Connection closed."
  ;;
  # Read-only
  rsync\ --server\ --sender*)
    sudo $SSH_ORIGINAL_COMMAND
  ;;
  ## permitted write, not appropriate for rsnapshot
  #rsync\ --server*)
  #  sudo $SSH_ORIGINAL_COMMAND
  #;;
  *)
    echo "Connection closed."
  ;;
esac
