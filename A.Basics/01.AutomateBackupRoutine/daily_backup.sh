#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/home/user/documents"
DEST_DIR="/backup/daily"
LOG_FILE="/backup/backup_log.txt"

# Create destination directory if it doesn't exist
mkdir -p $DEST_DIR

# Get the current date
DATE=$(date +%Y%m%d)

# Define the backup file name
BACKUP_FILE="backup_$DATE.tar.gz"

# Archive and compress the source directory
tar -czf $DEST_DIR/$BACKUP_FILE $SOURCE_DIR 2>> $LOG_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "$(date): Backup successful - $BACKUP_FILE" >> $LOG_FILE
else
    echo "$(date): Backup failed" >> $LOG_FILE
    exit 1
fi

# Remove backups older than 7 days
find $DEST_DIR -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \; 2>> $LOG_FILE

# Optional: Send a notification (e.g., email)
# mail -s "Backup Status" user@example.com < $LOG_FILE
