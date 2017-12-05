# ch19.ps1

# 19.1.1

class Point {
    [int] $x = 1
    [int] $y = 2
}

class Square {
    [Point] $c1
    [Point] $c2
}

$jstr = '{"c1": {"x": 1, "y": 2}, "c2": { "x": 3, "y": "4"}}'
[Square] ($jstr | ConvertFrom-Json)

$jstr = '{"c1": {"x": 1, "y": 2}, "c2": { "x": 3, "z": "4"}}'
[Square] ($jstr | ConvertFrom-Json)

# 19.1.2

class MyClass {
    static $foo = 123
}
[MyClass]::foo

class ApartmentPets {
    [int]
    [ValidateRange(1, 88)]
    $UnitNumber

    [string]
    [ValidateSet("cat", "dog", "bird")]
    $Type

    [int]
    [ValidateRange(0, 3)]
    $Count
}
[ApartmentPets] @{ UnitNumber=22; Type='cat'; Count=2 }
[ApartmentPets] @{ UnitNumber=22; Type='cat'; Count=10 }

# 19.1.3

[System.DayOfWeek] 0
[int] [System.DayOfWeek] "Tuesday"

[enum]::GetNames([System.DayOfWeek]) -join ', '

enum Foo { one; two; three }
[Foo] 0
[Foo]::three

[Flags()] enum MyBitField {
    one = 0x1; two = 0x2; three = 0x4; all = 0x7
}
[int] [MyBitField] "one,three"

function foo {
    param([System.DayOfWeek] $bf)
    "$bf is day $([int] $bf) of the week"
}
foo Tuesday
foo September

# 19.2.2

class utils {
    static [int] Sum([int[]] $na) {
        $result = 0
        if ($na -eq $null -or $na.Length -eq 0) {
            return $result
        }
        foreach ($n in $na) {
            $result += $n
        }
        return $result
    }
}
