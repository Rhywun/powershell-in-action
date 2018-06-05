'hello, world'

Get-ChildItem /private/var/log/*.log |
    Select-String -List error |
    Format-Table Path, LineNumber -AutoSize

([xml] [System.Net.WebClient]::new().
    DownloadString('http://blogs.msdn.com/powershell/rss.aspx')).
RSS.Channel.Item | Format-Table title, link

(2 + 2) * 3 / 7 | Out-File -FilePath ./foo.txt -Encoding utf8

# Note that you can't use `ls` or `sort` on MacOS
Get-ChildItem | Sort-Object -Descending
Get-ChildItem | Sort-Object Length
Get-ChildItem | Sort-Object Length -Descending
Get-ChildItem | Sort-Object Length -Descending | Select-Object -First 1
Get-ChildItem | Sort-Object Length -Descending | Select-Object -First 1 -Prop Directory

$total = 0
Get-ChildItem | ForEach-Object { $total += $_.Length }
Write-Host $total

# Isn't there any way to simplify this?
# Well... there's this I guess:
Get-ChildItem | ForEach-Object { $total = 0 } { $total += $_.Length } { $total }

Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 3

# Looping
# all of these are equivalent

$i = 0
while ($i++ -lt 10) {if ($i % 2) {"$i is odd"}}

foreach ($i in 1..10) {if ($i % 2) {"$i is odd"}}

1..10 | ForEach-Object {if ($_ % 2) {"$i is odd"}}

# Parameter binding & quotes
# all of these are equivalent

Write-Output -InputObject "-InputObject"
Write-Output "-InputObject"
Write-Output -- -InputObject

#
