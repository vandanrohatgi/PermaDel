param (
	[string]$file,
	[switch]$h
)

if ($h -or -not $file)
{
write-host "##### Help section #####"
write-host "./PermaDel.ps1 -file <path of the file you want gone>"
exit
}

if (-not $(Test-Path $pwd/sdelete/sdelete.exe -PathType Leaf))
{
write-host "SDelete not found! Fetching..."
Invoke-WebRequest https://download.sysinternals.com/files/SDelete.zip -OutFile $pwd\SDelete.zip
Expand-Archive SDelete.zip -DestinationPath $pwd\sdelete
rm SDelete.zip
}

# overwrite the metadata such as name, size, last modified etc.

write-host "Adding random data to file..."
$randomData= -join( (65..90)+(97..122) | Get-Random -Count 100 | % {[char]$_} )
echo $randomData >> $file

# commenting this section since SDelete already renames the files 26 times before deleting
#write-host "Renaming file..."
#$randomName= -join( (65..90)+(97..122) | Get-Random -Count 10 | % {[char]$_} )
#$path=Split-Path -Path $file
#Rename-Item -Path $file -NewName "$randomName.txt"

write-host "Deleting..."
.\sdelete\sdelete.exe -nobanner -p 2 $file

write-host "Poof! and the file is forever lost..."
