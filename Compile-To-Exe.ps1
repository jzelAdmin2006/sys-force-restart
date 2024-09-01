if (-not (Get-Module -ListAvailable -Name PS2EXE)) {
    Install-Module PS2EXE -Force -Scope CurrentUser
}

foreach ($file in (Get-ChildItem -Path .\*.ps1 | Where-Object {$_.Name -ne "Compile-To-Exe.ps1"})) {
    $outputName = [System.IO.Path]::ChangeExtension($file.Name, ".exe")
    ps2exe $file.FullName $outputName -noConsole -noOutput -requireAdmin
}
