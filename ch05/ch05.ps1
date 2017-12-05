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

1..26|?{!($_-band 1)}|%{[string][char]([int][char]'A'+$_-1)*$_}
