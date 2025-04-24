oh-my-posh init pwsh --config C:\Users\dagur\.config\oh-my-posh\catppuccin_macchiato.omp.json | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
function neofetch {
    fastfetch -l "C:\Users\dagur\.config\ascii-art\win-conf.txt"
}
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows

function sudo {
    Start-Process pwsh -Verb RunAs -ArgumentList "-Command $args"
}
function logout {
    exit
}
