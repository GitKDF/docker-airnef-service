#!/bin/bash

# Hardcoded command
command="airnefcmd"

# Hardcoded pattern to exclude (multiline with single quotes)
exclude_pattern='Delaying.*seconds.*retrying.*Press.*<ctrl-c>.*exit.*\[[0-9]*\]: [0-9]+
Searching.*Sony.*Canon.*camera.*via.*SSDP'

# Capture all arguments as an array (optional)
all_args=("$@")

# Build the complete command with arguments (optional)
if [[ ! -z "$all_args" ]]; then
  full_command="$command ${all_args[@]}"
else
  full_command="$command"
fi

# Loop until airnefcmd exits abnormally
while true; do
  # Run the command with filtering
  output=$($full_command | grep -vE "$exclude_pattern")
  
  # Get the exit code
  exit_code=$?

  # Check the exit code
  if [[ $exit_code -eq 0 ]]; then
    echo "airnefcmd exited normally. Running again..."
  else
    echo "airnefcmd exited abnormally with code: $exit_code"
    exit $exit_code
  fi
done