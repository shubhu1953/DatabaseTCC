CREATE TABLE [dbo].[Orders] (
    [OrderId]    INT IDENTITY (1, 1) NOT NULL,
    [EmployeeId] INT NOT NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderId] ASC),
    CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([EmployeeId])
);