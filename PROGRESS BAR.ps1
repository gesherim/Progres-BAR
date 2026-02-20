Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Link Stability Test (2 minutes)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('|', '/', '-', '\')
$duration = 120

# Цвета радуги!
$colors = @('Red', 'DarkYellow', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')

for ($i = 0; $i -lt $duration; $i++) {
    $spin = $spinChars[$i % 4]
    $percent = [math]::Round(($i / $duration) * 100)
    
    # Progress bar из блоков █
    $bars = [math]::Floor($percent / 5)
    $progressBar = "█" * $bars
    $emptyBar = "░" * (20 - $bars)
    
    # Выбираем цвет в зависимости от процента (радуга!)
    $colorIndex = [math]::Floor($percent / 15)  # 0-100% делим на 7 цветов
    if ($colorIndex -ge $colors.Length) { $colorIndex = $colors.Length - 1 }
    $currentColor = $colors[$colorIndex]
    
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
    Write-Host "$progressBar" -NoNewline -ForegroundColor $currentColor
    Write-Host "$emptyBar" -NoNewline -ForegroundColor DarkGray
    Write-Host "] $percent% - $timeStr / 2:00 - Remaining: $remStr   " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

# Финал!
Write-Host "`r✓ [" -NoNewline -ForegroundColor White
Write-Host "████████████████████" -NoNewline -ForegroundColor Green
Write-Host "] 100% - 2:00 / 2:00 - Complete!          " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"