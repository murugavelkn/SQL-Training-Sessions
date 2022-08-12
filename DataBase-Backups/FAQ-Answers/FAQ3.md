#### Checking the disk space used by each database on a server

As part of a recent server consolidation exercise we needed to check the amount of file space used by each database on our live SQL Servers. The following query lists all databases on a server together with the total file size of the associated files (data files and transaction logs), truncated to the nearest MB.

```SQL
SELECT      sys.databases.name,
            CONVERT(VARCHAR,SUM(size)*8/1024)+' MB' AS [Total disk space]
FROM        sys.databases
JOIN        sys.master_files
ON          sys.databases.database_id=sys.master_files.database_id
GROUP BY    sys.databases.name
ORDER BY    sys.databases.name
```

This works for SQL Server 2005 and 2008. The size of the files in sys.master_files is expressed in pages which is assumed to be 8k. As an alternative to the above to determine the size of the current database execute the following stored procedure :

```SQL
exec sp_spaceused
```

This returns two recordsets, the database_used column in the first recordset should give the current database size.
