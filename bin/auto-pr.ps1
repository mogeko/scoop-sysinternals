param(
    [String]$push = "Mogeko/scoop-bucket:master"
)

if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$autopr = "$env:SCOOP_HOME/bin/auto-pr.ps1"
$dir = "$psscriptroot/../bucket" # checks the parent dir
Invoke-Expression -command "& '$autopr' -dir '$dir' -push $push $($args | ForEach-Object { "$_ " })"
