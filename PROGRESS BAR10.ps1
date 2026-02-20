Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rainbow Progress Test (2 minutes)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('|', '/', '-', '\')
$duration = 120

for ($i = 0; $i -lt $duration; $i++) {
    $spin = $spinChars[$i % 4]
    $percent = [math]::Round(($i / $duration) * 100)
    
    # Progress bar из простых символов
    $bars = [math]::Floor($percent / 5)
    $progressBar = "#" * $bars
    $emptyBar = "." * (20 - $bars)
    
    # Цвет в зависимости от процента
    if ($percent -lt 14) { $color = 'Red' }
    elseif ($percent -lt 28) { $color = 'DarkYellow' }
    elseif ($percent -lt 42) { $color = 'Yellow' }
    elseif ($percent -lt 56) { $color = 'Green' }
    elseif ($percent -lt 70) { $color = 'Cyan' }
    elseif ($percent -lt 84) { $color = 'Blue' }
    else { $color = 'Magenta' }
    
    # Время
    $minutes = [math]::Floor($i / 60)
    $seconds = $i % 60
    $timeStr = "{0}:{1:D2}" -f $minutes, $seconds
    
    $remaining = $duration - $i
    $remMin = [math]::Floor($remaining / 60)
    $remSec = $remaining % 60
    $remStr = "{0}:{1:D2}" -f $remMin, $remSec
    
    # Рисуем!
    Write-Host "`r$spin [" -NoNewline -ForegroundColor White
    Write-Host "$progressBar" -NoNewline -ForegroundColor $color
    Write-Host "$emptyBar" -NoNewline -ForegroundColor DarkGray
    Write-Host "] $percent% - $timeStr / 2:00 - Remaining: $remStr   " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

# Финал!
Write-Host "`r* [" -NoNewline -ForegroundColor White
Write-Host "####################" -NoNewline -ForegroundColor Green
Write-Host "] 100% - 2:00 / 2:00 - Complete!          " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Yellow
Read-Host