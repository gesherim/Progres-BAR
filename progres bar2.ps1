Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rainbow Progress Test (2 minutes)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$spinChars = @('⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏')  # Fancy spinner!
$duration = 120

for ($i = 0; $i -lt $duration; $i++) {
    $spin = $spinChars[$i % $spinChars.Length]
    $percent = [math]::Round(($i / $duration) * 100)
    
    # Progress bar
    $bars = [math]::Floor($percent / 5)
    
    # Время
    $minutes = [math]::Floor($i / 60)
    $seconds = $i % 60
    $timeStr = "{0}:{1:D2}" -f $minutes, $seconds
    
    $remaining = $duration - $i
    $remMin = [math]::Floor($remaining / 60)
    $remSec = $remaining % 60
    $remStr = "{0}:{1:D2}" -f $remMin, $remSec
    
    # Рисуем progress bar с разными цветами!
    Write-Host "`r$spin [" -NoNewline -ForegroundColor White
    
    for ($j = 0; $j -lt 20; $j++) {
        if ($j -lt $bars) {
            # Определяем цвет для каждого блока
            $colorPercent = ($j / 20) * 100
            if ($colorPercent -lt 14) { $color = 'Red' }
            elseif ($colorPercent -lt 28) { $color = 'DarkYellow' }
            elseif ($colorPercent -lt 42) { $color = 'Yellow' }
            elseif ($colorPercent -lt 56) { $color = 'Green' }
            elseif ($colorPercent -lt 70) { $color = 'Cyan' }
            elseif ($colorPercent -lt 84) { $color = 'Blue' }
            else { $color = 'Magenta' }
            
            Write-Host "█" -NoNewline -ForegroundColor $color
        } else {
            Write-Host "░" -NoNewline -ForegroundColor DarkGray
        }
    }
    
    Write-Host "] $percent% - $timeStr / 2:00 - Remaining: $remStr   " -NoNewline -ForegroundColor White
    
    Start-Sleep -Seconds 1
}

Write-Host "`r✓ [" -NoNewline -ForegroundColor White
# Финальная радуга!
Write-Host "███" -NoNewline -ForegroundColor Red
Write-Host "███" -NoNewline -ForegroundColor Yellow
Write-Host "███" -NoNewline -ForegroundColor Green
Write-Host "███" -NoNewline -ForegroundColor Cyan
Write-Host "███" -NoNewline -ForegroundColor Blue
Write-Host "███" -NoNewline -ForegroundColor Magenta
Write-Host "██" -NoNewline -ForegroundColor Red
Write-Host "] 100% - Complete!          " -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Test Result: PASS ✓" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"