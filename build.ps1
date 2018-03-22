Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$version = Invoke-RestMethod -Uri "https://checkpoint-api.hashicorp.com/v1/check/packer"
Invoke-WebRequest -Uri "https://releases.hashicorp.com/packer/$($version.current_version)/packer_$($version.current_version)_windows_386.zip" -OutFile "packer_$($version.current_version)_windows_386.zip"
$cwd = (Get-Item -Path ".\" -Verbose).FullName
Remove-Item packer.exe
Unzip "$cwd\packer_$($version.current_version)_windows_386.zip" "$cwd"

(Get-Content packer.nuspec).Replace('#{PackerVersion}', $version.current_version) | Set-Content packer-processed.nuspec