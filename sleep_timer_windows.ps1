function Read-Choice {
    param (
        [string]$Prompt = 'Would you like to send this device to sleep (s) or shut it down (d)? '
    )
    $choice = $null
    while ($null -eq $choice) {
        $choice = Read-Host -Prompt $Prompt
        if ($choice -notin @('s', 'S', 'd', 'D')) { $choice = $null }
    }
    $choice
}

function Read-Duration {
    param (
        [string]$Action
    )
    $duration = $null
    while ($null -eq $duration) {
        $duration = Read-Host -Prompt "In how many minutes would you like to $Action this device? "
        if ($duration -notmatch '^[1-9][0-9]*$') { $duration = $null }
    }
    $duration
}

$action = Read-Choice
$duration = Read-Duration -Action $action
$endTime = (Get-Date).AddMinutes($duration).ToString('HH:mm:ss')
Write-Host "This device will $action at $endTime."

$durationInSeconds = $duration * 60
Start-Sleep -Seconds $durationInSeconds

if ($action -eq 's' -or $action -eq 'S') {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)
} elseif ($action -eq 'd' -or $action -eq 'D') {
    Stop-Computer -Force
}
