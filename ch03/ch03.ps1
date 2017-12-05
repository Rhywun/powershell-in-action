$data = Get-Content ./data.txt | ForEach-Object {
    $e = @{}
    $e.Level, [int] $e.Lower, [int] $e.Upper = -split $_
    $e
}

Get-Process | Where-Object {$_.StartTime -ge [datetime]::Today}

'1,2,3,4' -replace '\s*,\s*', '+'

$ca = [char[]] 'abcd'
[array]::Reverse($ca)
$ra = -join $ca

(1,2,3) -join '+'
Invoke-Expression (1..10 -join '*')

$text = Get-Content ./out.txt -Raw

'a*b*c' -split '`*'

# We want to split this into pairs of colors
$colors = "Black,Brown,Red,Orange,Yellow,Green,Blue,Violet,Gray,White"
$count = @(0)
$colors -split {$_ -eq ',' -and ++$count[0] % 2 -eq 0}

$data = 1,2,3,4,5
($data).ForEach({$_ * 2})
