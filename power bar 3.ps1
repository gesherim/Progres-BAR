Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rainbow Gradient Progress (2 min)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('|', '/', '-', '\')
$duration = 120

# Цвета радуги для 20 блоков
$rainbowColors = @(
    'Red', 'Red', 'Red',           # 0-2
    'DarkYellow', 'DarkYellow',    # 3-4
    'Yellow', 'Yellow', 'Yellow',  # 5-7
    'Green', 'Green', 'Green',     # 8-10
    'Cyan', 'Cyan', 'Cyan',        # 11-13
    'Blue', 'Blue', 'Blue',        # 14-16
    'Magenta', 'Magenta', 'Magenta' # 17-19
)

for ($i = 0; $i -lt $duration; $i++) {
    $spin = $spinChars[$i % 4]
    $percent = [math]::Round(($i / $duration) * 100)
    $bars = [math]::Floor($percent / 5)
    
    # Время
    $minutes = [math]::Floor($i / 60)
    $seconds = $i % 60
    $timeStr = "{0}:{1:D2}" -f $minutes, $seconds
    
    $remaining = $duration - $i
    $remMin = [math]::Floor($remaining / 60)
    $remSec = $remaining % 60
    $remStr = "{0}:{1:D2}" -f $remMin, $remSec
    
    # Рисуем spinner и скобку
    Write-Host "`r$spin [" -NoNewline -ForegroundColor White
    
    # Рисуем каждый блок своим цветом!
    for ($j = 0; $j -lt 20; $j++) {
        if ($j -lt $bars) {
            Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$j]
        } else {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
    
    Write-Host "] $percent% - $timeStr / 2:00 - Remaining: $remStr   " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

# Финал - полная радуга!
Write-Host "`r* [" -NoNewline -ForegroundColor White
for ($j = 0; $j -lt 20; $j++) {
    Write-Host "#" -NoNewline -ForegroundColor $rainbowColors[$j]
}
Write-Host "] 100% - Complete!          " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Press Enter to exit..." -ForegroundColor Yellow
Read-Host
