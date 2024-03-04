#!/bin/bash

# Check if the correct number of arguments is provided
if [[ $# != 2 ]]; then
  echo "Usage: backup.sh target_directory_name destination_directory_name"
  exit 1
fi

# Check if the provided arguments are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "Invalid directory path provided"
  exit 1
fi

# Set the target and destination directory paths
targetDirectory=$1
destinationDirectory=$2

# Print the directories being backed up and the destination directory
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# Get the current timestamp in seconds
currentTS=$(date +%s)

# Define the backup file name using the current timestamp
backupFileName="backup-$currentTS.tar.gz"

# Define the purpose of the subsequent operations
# 1. Navigate to directories
# 2. Define variables to store paths
# 3. Prepare for backup

# Get the absolute path of the current directory
origAbsPath=$(pwd)

# Navigate to the destination directory and get its absolute path
cd "$destinationDirectory"
destAbsPath=$(pwd)

# Navigate back to the original directory and then to the target directory
cd "$origAbsPath"
cd "$targetDirectory"

# Calculate the timestamp for 24 hours ago
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Declare an array to store files to be backed up
declare -a toBackup

# Iterate through files in the target directory
for file in $(ls); do
  # Check if the file was modified within the last 24 hours
  if (( $(date -r $file +%s) > $yesterdayTS )); then
    # Add the file to the list of files to be backed up
    toBackup+=($file)
  fi
done

# Perform the backup operation: create a tar archive of selected files
tar -czvf $backupFileName ${toBackup[@]}

# Move the backup file to the destination directory
mv $backupFileName "$destAbsPath"

