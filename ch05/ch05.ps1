#
# Switch
#

# complex matches

switch (8) {
    {$_ -gt 3} {'greater than three'}
    {$_ -gt 7} {'greater than 7'}
}

# collection: looping tests each element over all the clauses

switch (1..6) {
    {$_ % 2} { "Odd $_"; continue }
           4 { 'FOUR' }
     default { "Even $_" }
}

#

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

ForEach-Object ($f in Get-ChildItem *.txt) { $f.Length }

#
# ???
#

1..26|?{!($_-band 1)}|%{[string][char]([int][char]'A'+$_-1)*$_}
