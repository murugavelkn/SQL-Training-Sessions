**Creating a copy only backup to avoid breaking a backup chain**

<p>I was recently asked to do an extra "adhoc" backup of a live database. This was so that the backup file could
   be periodically restored into another database which was used for testing. The intention was to keep the backup file
   so that the testing database could be restored to
   be a “clean” copy of the live data after each testing session.</p><br /><br />

   <p>This might seem like a simple enough task, but there is a problem with doing a one off backup like this.
   This is because the extra backup potentially breaks the back up chain, and could cause problems if a database
   restore becomes necessary before the next full backup.</p> <br /><br />

   In our situation the live database has a full backup at a weekend with nightly differential
   backups taken during the week. Restoring the backup then involves restoring the last full backup
   (the “base” backup), followed by the latest differential backup (differential backups are cumulative).
   The trouble with my situation above
   is that if a database restore is required after my adhoc backup, but before the next full backup, then it is my
   adhoc backup that has become the base backup and needs to be restored before any differential backup is
   restored.<br /><br />

   This might not seem to be a big deal for smaller setups, but in larger organisations where the person doing
   the restore is not aware of my adhoc backup it can cause a restore failure.<br /><br />

   Fortunately there is an easy way around this, as I can specify my backup as being ‘copy only’. This means
   that the backup is treated as a one off and will not interrupt any backup strategy already in place.<br /><br />
   This facility was introduced in SQL Server 2005 but could only be specified by command line switches in
   TSQL. With SQL Server 2008 this can now be specified in the GUI.<br /><br />

   <b>Important : </b> You might have noticed that I've not mentioned transaction log backups or log chains at all. This is
   because full backups do *not* break the transaction log backup chain whether they are 'copy only' backups
   or not. It's a common misconception that a full backup will break the transaction log chain, but this is not the
   case. A full backup does not truncate the transaction log and only contains sufficient
   transaction log information to restore a consistent database.<br /><br />
   To complicate things a little more it is also possible to specify a 'copy only' transaction log backup, which
   does not truncate the transaction log, or break the log chain.<br /><br />

   Now onto the practicalities. To specify a copy only full backup using TSQL the syntax is:<br /><br />

   ```SQL
   BACKUP DATABASE MyDatabase TO  MyBackupDevice WITH COPY_ONLY
  ```

   To specify a copy only backup within the GUI version in SQL Server 2008, just check the 'Copy Only Backup'
   checkbox in the Backup window :<br />

 <img src= https://www.sqlmatters.com/ArticleImages/Copy%20Only%20Backups.jpg />
