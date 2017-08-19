


#--TeamCity checkout directory command line argument--
		param([string]$tcDir = "")
                #--Load the Dac.dll into the PowerShell session--
        $Server = '.\SQLEXPRESS'    
        $database = 'Development'
		Add-Type -Path "C:\Program Files (x86)\Microsoft SQL Server\120\DAC\bin\Microsoft.SqlServer.Dac.dll"
                #--Load the SQL Server instance--
		$dacService = new-object Microsoft.SqlServer.Dac.DacServices "server=$($Server);Integrated Security = True;"
                #--Load the DACPAC--
		$dacPac = [Microsoft.SqlServer.Dac.DacPackage]::Load("$tcDir\bin\Release\DatabaseTCC.dacpac")
                #--Deploy your database--
		
try 
{ 
# Deploy the dacpac 
$dacService.deploy($dacPac, "QA", "TRUE") 
} 
catch 
{ 
Write-Host "LoadException"; 
$Error | format-list -force 
Write-Host $Error[0].Exception.ParentContainsErrorRecordException; 
}


		