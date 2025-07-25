--Create user to gain access to DB. Store passcode as a secret in key vault.
CREATE LOGIN username WITH PASSWORD = 'password';

create user username for login username

Use AdventureWorksLT2017;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'username')
BEGIN
    CREATE USER [username] FOR LOGIN [username]
    EXEC sp_addrolemember N'db_owner', N'username'
END;
GO