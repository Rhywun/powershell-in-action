#
# Switch
#

# complex matches
switch (8) {
    {$_ -gt 3} {'greater than three'}
    {$_ -gt 7} {'greater than 7'}
}

# collections: looping tests each element over all the clauses

switch (1..6) {
    {$_ % 2} { "Odd $_"; continue }
           4 { 'FOUR' }
     default { "Even $_" }
}

$ps1 = $txt = 0
switch -Wildcard (Get-ChildItem) {
    *.ps1 { $ps1 += $_.Length; continue }
    *.txt { $txt += $_.Length; continue }
}
Write-Host "ps1: $ps1, txt: $txt"

# using the `-switch` enumerator

$options = -split '-a -b Hello -c'
$a = $c = $d = $false
$b = $null

switch ($options)
{
    '-a' { $a = $true }
    '-b' { [void] $switch.movenext(); $b = $switch.current }
    '-c' { $c = $true }
    '-d' { $d = $true }
}

"a=$a b=$b c=$c d=$d"

#
# ForEach
#

foreach ($f in Get-ChildItem *.txt) { $f.length }       # statement
Get-ChildItem *.txt | ForEach-Object { $_.Length }      # cmdlet

# Begin, Process, End
Get-ChildItem *.txt | ForEach-Object {$l = 0} {$l += $_.Length} {$l}

# better:
Get-ChildItem *.txt | ForEach-Object -Begin {$l = 0} -Process {$l += $_.Length} -End {$l}

# unraveling
Get-Process | ForEach-Object {$_.modules} | Sort-Object -unique modulename

$words | ForEach-Object {$h=@{}} {$h[$_] += 1}

# Operational statements

Get-ChildItem | ForEach-Object Name | Select-Object -First 5 | ForEach-Object ToUpper
'test', 'strings' | ForEach-Object Replace -ArgumentList 'st', 'AB'

#
# Where
#

1..10 | Where-Object {-not ($_ -band 1)}

# pathological example of briefness
1..26|?{!($_-band 1)}|%{[string][char]([int][char]'A'+$_-1)*$_}

# simplified
Get-Process | Where-Object {$_.WS -gt 100Mb}       # -gt is an operator
Get-Process | Where-Object WS -GT 100Mb            # -GT is a parameter

#
# Statements as values
#

for ($i = 1; $i -le 10; $i++) { $i }

#
# Speed
#

$s1 = -join $(foreach ($i in 1..40kb) { "a" })     # faster - let implicit arrays be built
$s2 = "";  foreach ($i in 1..40kb) { $s2 += "a" }  # slower
