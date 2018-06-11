# Multiple assignments

$a = 1
$b = 2
$a, $b = $b, $a
Write-Output $a
Write-Output $b

$data = Get-Content ./data.txt | ForEach-Object {
    $e = @{}
    $e.Level, [int] $e.Lower, [int] $e.Upper = -split $_ # <<<
    $e
}
$data
$data[0]
$data.Length # 4

# Comparisons with scalars

Get-Process | Where-Object {$_.StartTime -ge [datetime]::Today}

# Comparisons with collections return all matching items

1, '2', 3, 2, '1' -eq '2' # 2 2
1, 2, 3, 4, 5 -gt 2 # 3 4 5

# Containment

1, '02', 3, 02, '1' -contains '02' # True

# Text manipulation

'abcdef' -match '(a)(((b)(c))de)f'
$matches

'abcdef' -match '(?<o1>a)(?<o2>((?<e3>b)(?<e4>c))de)f'
$matches

'1,2,3,4' -replace '\s*,\s*', '+'
'The car is red' -replace 'is (red|blue)', 'was $1'
'The quick brown fox' -replace 'quick' # but this leaves an extra space
'The quick brown fox' -replace '\s*quick\s*', ' ' # fixes that

# Joins

$in = 1, 2, 3
$out = -join $in
$out # 123

-join 1, 2, 3    # 1\n2\n3  ... because this is actually (-join 1), 2, 3
-join (1, 2, 3)  # 123

(-join 1, 2, 3).GetType().FullName    # System.Object[]
(-join (1, 2, 3)).GetType().FullName  # System.String

# Reverse a string - how convoluted!
$ca = [char[]] 'abcd'
[array]::Reverse($ca)
$ra = -join $ca
$ra

(1,2,3) -join '+'
Invoke-Expression (1..10 -join '*') # Factorial - but not efficient

$text = Get-Content ./out.txt -Raw # -Raw avoids need to use join here

# Splits

-split 'hello world' # hello
                     # world

'a*b*c' -split '`*' # a
                    # *
                    # b
                    # *
                    # c

# We want to split this into pairs of colors - see discussion on p. 109
$colors = "Black,Brown,Red,Orange,Yellow,Green,Blue,Violet,Gray,White"
$count = @(0)
$colors -split {$_ -eq ',' -and ++$count[0] % 2 -eq 0}

# ForEach

$data = 1,2,3,4,5
($data).ForEach({$_ * 2})
