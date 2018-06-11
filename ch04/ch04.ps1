# Type operators

('123' -as 'int') + 456 # 579

# Unary operators typically discard the result

$l = 1
foreach ($s in 'one', 'two', 'three') { "$($l++): $s" }

# How to not discard the result of the increment operator - wrap in parens
$l = 1
foreach ($s in 'one', 'two', 'three') { "$(($l++)): $s" }

# Grouping and subexpressions

# subexpression + cast to void discards result of expressions that return a value
[void] $(Write-Output "discard me")

# Count the number of elements in the Fibonacci sequence below 100
$($c = $p = 1; while ($c -lt 100) {$c; $c, $p = ($c + $p), $c}).Count

'hello, world'.Length

(1, 2, 3, 4, 5).Length
(1, 2, 3, 4, 5).Count

'hello, world'.('len' + 'gth')

$obj = @(Get-ChildItem $PWD/*.ps1)[0]
$names = $obj | Get-Member -MemberType Property l* | ForEach-Object Name
$names | ForEach-Object { "$_ = $($obj.$_)" }

$names = ($obj | Get-Member -MemberType Property l*).Name   # Same as line 17, fallback dot
$names | ForEach-Object { "$_ = $($obj.$_)" }

$names.ForEach{"$_ = $($obj.$_)"}                           # Same as above, fallback operator

# Methods

'hello, world'.Substring(0, 5)
[string]::Join('+', (1, 2, 3))                              # Same as 1,2,3 -join '+'
[string]::Join(" + ", (Get-Process Code* | ForEach-Object CPU))

$method = 'Substring'
'abc'.$method.Invoke(1)

$method = 'sin'
[math]::$method.invoke([math]::PI)

# Format operator

'|{0,10}| 0x{1:x}|{2,-10}|' -f 10, 20, 30

# Variables

Test-Path variable:method

[ValidateLength(0, 5)] [string] $cv = ''
$cv = '12345'
$cv = '123456' # Fails

Import-Csv ./variables.csv | ForEach-Object { Set-Variable -Name $_.Name -Value $_.Value }

# Splatting

function s {
    param ($x, $y, $z)
    "x=$x, y=$y, z=$z"
}
$list = 1, 2, 3
s $list   # no splat
s @list   # splat
