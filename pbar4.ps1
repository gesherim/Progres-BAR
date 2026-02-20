Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Elastic Rainbow Progress (2 min)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('|', '/', '-', '\')
$duration = 120

# Цвета радуги
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
    
    # РЕЗИНОВАЯ ШИРИНА!
    # От 10 блоков (0%) до 40 блоков (100%)
    $minWidth = 10
    $maxWidth = 40
    $currentWidth = $minWidth + [math]::Floor(($maxWidth - $minWidth) * $percent / 100)
    
    # Количество заполненных блоков
    $bars = [math]::Floor($currentWidth * $percent / 100)
    
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
    
    # Рисуем progress bar с радугой
    for ($j = 0; $j -lt $currentWidth; $j++) {
        if ($j -lt $bars) {
            # Определяем цвет для этого блока
            $colorIndex = [math]::Floor($j * 20 / $maxWidth)
            if ($colorIndex -ge 20) { $colorIndex = 19 }
            Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$colorIndex]
        } else {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
    
    Write-Host "] $percent% - $timeStr / 2:00 - Remaining: $remStr                    " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

# Финал - полная ширина!
Write-Host "`r* [" -NoNewline -ForegroundColor White
for ($j = 0; $j -lt 40; $j++) {
    $colorIndex = [math]::Floor($j * 20 / 40)
    if ($colorIndex -ge 20) { $colorIndex = 19 }
    Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$colorIndex]
}
Write-Host "] 100% - Complete!                              " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Yellow
Read-Host
