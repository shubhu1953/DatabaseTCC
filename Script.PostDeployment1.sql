/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF (EXISTS(SELECT * FROM [dbo].[Employees]))
BEGIN
	DELETE FROM [dbo].[Employees]
END

INSERT INTO [dbo].Employees VALUES ('Warren', 'Buffet', 'CFO')
INSERT INTO [dbo].Employees VALUES ('Bill', 'Gates', 'CEO')
INSERT INTO [dbo].Employees VALUES ('Oprah', 'Winfrey', 'CEO')
INSERT INTO [dbo].Employees VALUES ('Steve', 'Jobs', 'CTO')
INSERT INTO [dbo].Employees VALUES ('Mark', 'Zuckerberg', 'Co-Founder')
INSERT INTO [dbo].Employees VALUES ('Percy', 'Miller', 'Mogul')
