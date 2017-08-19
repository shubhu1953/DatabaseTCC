$Server = '.\SQLEXPRESS'    
$database = 'Development'
$Connection = New-Object System.Data.SQLClient.SQLConnection
$Connection.ConnectionString = "server=$($Server);database=$($Database);Integrated Security = True;"
$Connection.Open()
$Command = New-Object System.Data.SQLClient.SQLCommand
$Command.Connection = $Connection
$Command.CommandText = 'Select * from dbo.Employees'
try{                                                                                                                                               
$Reader = $Command.ExecuteReader()
}

catch 
{ 
Write-Host "LoadException"; 
$Error | format-list -force 
Write-Host $Error[0].Exception.ParentContainsErrorRecordException; 
}

$Datatable = New-Object System.Data.DataTable
$Datatable.Load($Reader)
$Datatable
$Connection.Close() 