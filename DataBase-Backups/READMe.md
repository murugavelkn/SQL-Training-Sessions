### Summary
- Planning backups is relatively simpler for smaller databases. As the databases grow in size the management of backup can quickly become a complex and tedious job.
- With planning and the defining right backup and restore/recovery strategy, we would place ourselves in a good position against any sort of failure.
- A full backup is always easier to restore but it is a resource-intensive operation and takes longer to complete.
- We’ve covered different backup types with examples in this article. This gives you an idea of the available backup types and the basic purpose of each backup type.
- For example, for an index rebuild operation, consider the time required and make sure it only occurs right before a full backup so that all of those changes don’t need to be rolled up into differential backups.
- To speed up a backup operation,  consider moving historical data to archive file-groups and split the read-write data and read-only data into separate file-groups. This gives you the flexibility to backup only the read-write file-groups and their respective files.
- Using the available backup compression options, we can reduce the amount of data that needs to be backed up. This removes the extra burden on the storage and transfer resources needed for the entire operation.
- That’s all for now. Stay tuned for more updates!

### FAQ

[FAQ 1 - **SQL SERVER DIFFERENTIAL RESTORE FAILS WITH ERROR: “THIS DIFFERENTIAL BACKUP CANNOT BE RESTORED BECAUSE THE DATABASE HAS NOT BEEN RESTORED TO THE CORRECT EARLIER STATE”**](FAQ-Answers/FAQ1.md)
[FAQ 2 - **Creating a copy only backup to avoid breaking a backup chain**](FAQ-Answers/FAQ2.md)
[FAQ 3 - **Checking the disk space used by each database on a server**](FAQ-Answers/FAQ3.md)
