**SQL SERVER DIFFERENTIAL RESTORE FAILS WITH ERROR: “THIS DIFFERENTIAL BACKUP CANNOT BE RESTORED BECAUSE THE DATABASE HAS NOT BEEN RESTORED TO THE CORRECT EARLIER STATE”**

If you encounter the above error while attempting to restore a differential backup, it usually indicates that it’s being applied to a full backup that isn’t the most recent one.

The most common cause we’ve seen is that a third-party program (or a SQL admin) is creating full backups in addition to the ones created by SQL Backup Master. And this means a more recent full backup likely exists somewhere about which SQL Backup Master has no knowledge.

In other words, a full backup was taken in between the full and differential backups being performed by SQL Backup Master. This results in a broken backup chain.

The very latest full backup must be located and restored prior to any differential what was derived from it. The differential cannot be restored to any prior backup (it must be the latest full backup that was created).

### DIVING DEEPER
If additional details are required, we recommend querying SQL Server’s backup set records. Doing so can help you identify where breaks in the backup chain may be occurring. Here’s a SQL query to get you started – you may wish to further restrict it by database name, time frame, etc.
```SQL
SELECT
msdb.dbo.backupset.database_name,
msdb.dbo.backupset.backup_start_date,
msdb.dbo.backupset.backup_finish_date,
msdb.dbo.backupset.database_backup_lsn,
msdb.dbo.backupset.differential_base_lsn,
CASE msdb..backupset.type
WHEN 'D' THEN 'Full'
WHEN 'L' THEN 'Log'
WHEN 'I' THEN 'Diff'
END AS backup_type,
msdb.dbo.backupset.backup_size,
msdb.dbo.backupmediafamily.physical_device_name
FROM msdb.dbo.backupmediafamily
INNER JOIN msdb.dbo.backupset ON
msdb.dbo.backupmediafamily.media_set_id =
msdb.dbo.backupset.media_set_id
ORDER BY
msdb.dbo.backupset.database_name,
msdb.dbo.backupset.backup_finish_date
```
Sample query results shown below demonstrate how to correlate a differential backup to a specific full backup. The magnified portion of the screenshot shows a differential backup with a differential_base_lsn field correlating to the first_lsn field of the full backup that precedes it.
<img src= https://www.sqlbackupmaster.com/wordpress/wp-content/uploads/2021/02/full-diff-correlation3.png />
