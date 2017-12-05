'hello, world'

Get-ChildItem /private/var/log/*.log |
    Select-String -List error |
    Format-Table Path, LineNumber -AutoSize

([xml] [System.Net.WebClient]::new().
    DownloadString('http://blogs.msdn.com/powershell/rss.aspx')).
        RSS.Channel.Item |
            Format-Table title, link

(2 + 2) * 3 / 7 | Out-File -FilePath ./foo.txt -Encoding utf8

$a = Get-ChildItem /private/var/log/*.log |
    Sort-Object -Property Length -Descending
Write-Host $a[1]
Write-Host ($a | Select-Object -First 1)

$total = 0
Get-ChildItem | ForEach-Object { $total += $_.Length }
Write-Host $total
# Isn't there any way to simplify this?

Get-Command | Where-Object ParameterSets.Count -GT 3 | Format-List Name
