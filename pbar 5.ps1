Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Elastic Rainbow Progress (2 min)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('|', '/', '-', '\')
$duration = 120

$rainbowColors = @(
    'Red', 'Red', 'Red',
    'DarkYellow', 'DarkYellow',
    'Yellow', 'Yellow', 'Yellow',
    'Green', 'Green', 'Green',
    'Cyan', 'Cyan', 'Cyan',
    'Blue', 'Blue', 'Blue',
    'Magenta', 'Magenta', 'Magenta'
)

for ($i = 0; $i -lt $duration; $i++) {
    $spin = $spinChars[$i % 4]
    $percent = [math]::Round(($i / $duration) * 100)
    
    # Резиновая ширина: 15 -> 50 блоков
    $minWidth = 15
    $maxWidth = 50
    $currentWidth = $minWidth + [math]::Floor(($maxWidth - $minWidth) * $percent / 100)
    
    $bars = [math]::Floor($currentWidth * $percent / 100)
    
    # Время
    $minutes = [math]::Floor($i / 60)
    $seconds = $i % 60
    $timeStr = "{0}:{1:D2}" -f $minutes, $seconds
    
    $remaining = $duration - $i
    $remMin = [math]::Floor($remaining / 60)
    $remSec = $remaining % 60
    $remStr = "{0}:{1:D2}" -f $remMin, $remSec
    
    # Рисуем процент слева
    Write-Host "`r$spin $percent% [" -NoNewline -ForegroundColor White
    
    # Progress bar
    for ($j = 0; $j -lt $currentWidth; $j++) {
        if ($j -lt $bars) {
            $colorIndex = [math]::Floor($j * 20 / $maxWidth)
            if ($colorIndex -ge 20) { $colorIndex = 19 }
            Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$colorIndex]
        } else {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
    
    Write-Host "] $timeStr / 2:00 (Remaining: $remStr)                         " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

# Финал
Write-Host "`r* 100% [" -NoNewline -ForegroundColor White
for ($j = 0; $j -lt 50; $j++) {
    $colorIndex = [math]::Floor($j * 20 / 50)
    if ($colorIndex -ge 20) { $colorIndex = 19 }
    Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$colorIndex]
}
Write-Host "] Complete!                                        " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Yellow
Read-Host
