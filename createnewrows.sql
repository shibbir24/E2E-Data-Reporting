SET IDENTITY_INSERT [AdventureWorksLT2017].[SalesLT].[Customer] ON

INSERT INTO [AdventureWorksLT2017].[SalesLT].[Customer]
([CustomerID],[NameStyle]
	,[Title]
	,[FirstName]
	,[MiddleName]
	,[LastName]
	,[Suffix]
	,[CompanyName]
	,[SalesPerson]
	,[EmailAddress]
	,[Phone]
	,[PasswordHash]
	,[PasswordSalt]
	,[rowguid]
	,[ModifiedDate])
VALUES
	(30119,0,'Mr.','Stephen','S.','Ben','Jr.','TrailBlaze Cycle Co','adventure-works\jillian0','stephen@adventure-works.com','9876-675-8787','3vKdD5Qa5RXftGr+nH7rLwYfYd6fzU7RHzbVm+5QZgc=','3qTPkIv=','8C916FA2-EF46-43E1-82BC-FE21DA64C57C','2009-05-16 16:33:33.123'),
	(30120,0,'Ms.','Joanna','A.','Max',NULL,'Off The Beaten Cycle','adventure-works\pamela0','jo123@adventure-works.com','13456-095-0045','EdD24wBVx9zG7FPL6+yUbW5Fbx/JWbAh2v3C7fT8ErA=','WejiYo3=','F8A60D63-2959-45A7-80CF-7B4786E26F2A','2009-05-16 16:33:33.123')

SET IDENTITY_INSERT [AdventureWorksLT2017].[SalesLT].[Customer] OFF;