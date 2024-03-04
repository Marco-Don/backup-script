# Backup Script

## Description
This is a Bash script designed to automatically back up files from a specified target directory to a destination directory. It creates a compressed tar archive of files that have been modified within the last 24 hours and moves the backup file to the specified destination directory.

## Usage
To use this script, run it from the command line with the following arguments:
./backup.sh target_directory_name destination_directory_name
Replace `target_directory_name` with the path of the directory containing the files you want to back up, and `destination_directory_name` with the path of the directory where you want to store the backup files.

## Example
./backup.sh /home/user/documents /mnt/backup
This command will back up files from the `/home/user/documents` directory to the `/mnt/backup` directory.

## Requirements
- Bash shell environment
- Linux operating system

## Features
- Checks the number of arguments provided and validates directory paths
- Creates a compressed tar archive of files modified within the last 24 hours
- Moves the backup file to the specified destination directory
- Provides informative output during execution

## Author
Marco Pianu

## License
This project is licensed under the [License Name] License - see the [LICENSE](LICENSE) file for details.


