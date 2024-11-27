## Steps to Execute: Automate Your Daily Backup Routine  

1. **Define Backup Details**  
   - Identify a specific directory to back up (e.g., `/home/user/documents`).  
   - Specify the destination directory for backups (e.g., `/backup/daily`).  
   - Determine the naming convention for the backup file (e.g., `backup_YYYYMMDD.tar.gz`).  

2. **Create the Script File**  
   - Use a text editor (e.g., `nano`) to create a new file, for example, `daily_backup.sh`.  

3. **Include the Backup Logic in the Script**  
   - Write a script that:  
     - Uses the `tar` command to archive and compress the source directory.  
     - Saves the backup file in the destination directory with the specified naming convention.  
     - Checks for errors during execution and logs them.  
     - Ensures old backups (e.g., older than 7 days) are removed to save storage.  

4. **Test the Script**  
   - Run the script manually using `bash daily_backup.sh` to ensure it performs the backup correctly.  
   - Verify the created backup file in the destination directory.  

5. **Make the Script Executable**  
   - Use the `chmod` command to change the file's permissions to make it executable.  

6. **Schedule the Script for Daily Execution**  
   - Open the `crontab` configuration using the `crontab -e` command.  
   - Add a cron job entry to execute the script daily at a specific time (e.g., `0 2 * * * /path/to/daily_backup.sh`).  

7. **Verify the Automation**  
   - Wait for the cron job to run at the scheduled time and check if the backup is created successfully.  
   - Inspect the cron logs or setup logs in the script for troubleshooting if necessary.  

8. **Set Up Notifications (Optional)**  
   - Enhance the script to send an email or notification on successful or failed backups.  

9. **Monitor Storage Usage**  
   - Check the `/backup/daily` directory periodically to ensure there’s sufficient disk space for backups.  

10. **Update Script as Needed**  
    - Modify the script to include additional directories or adjust retention policies over time.  
