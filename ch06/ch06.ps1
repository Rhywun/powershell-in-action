function hello {
    $OFS = ' & '
    "Hello there $args, how are you?"
}
hello Bob Alice Ted Carol

#

function count-args {
    "`$args.count=" + $args.Count
    "`$args[0].count=" + $args[0].Count
}
count-args 1 2 3
count-args 1,2,3
count-args 1,2,3 4,5,6,7

#

function ql { $args }
function qs { "$args" }

$col = ql red orange yellow green blue indigo violet
qs this is a        string

#

function subtract ($from, $count) { $from - $count }
subtract 5 3
subtract -from 4 -count 7

#

function nadd ([int] $x, [int] $y) { $x + $y }
nadd 1 2
nadd "1" "2"
nadd @{a=1;b=2} "2"

# 6.2.3

function a ($x, $y) {
    "x is $x"
    "y is $y"
    "args is $args"
}
a 1
a 1 2
a 1 2 3 4

# 6.2.4

function dow ([datetime] $d = $(Get-Date)) { $d.DayOfWeek }
dow
dow "April 15, 1969"

# 6.2.5

function get-soup (
    [switch] $please,
    [string] $soup= "chicken noodle"
)
{
    if ($please) {
        "Here's your $soup soup."
    } else {
        "No soup for you!"
    }
}
get-soup
get-soup -please
get-soup -please tomato

# Get/Update/Set

$characterData = @{
    'Linus'  = @{ age = 8; human = $true}
    'Lucy'   = @{ age = 8; human = $true}
    'Snoopy' = @{ age = 2; human = $true}
}

function Get-Character ($name = '*') {
    foreach ($entry in $characterData.GetEnumerator() | Write-Output) {
        if ($entry.Key -like $name) {
            $properties = @{ 'Name' = $entry.Key } +
            $entry.Value
            New-Object PSCustomObject -Property $properties
        }
    }
}

function Set-Character {
    process {
        $characterData[$_.name] =
        @{
            age   = $_.age
            human = $_.human
        }
    }
}

function Update-Character (
    [string] $name = '*',
    [int] $age,
    [bool] $human
) {
    begin {
        if ($PSBoundParameters.'name') {
            $name = $PSBoundParameters.name
            [void] $PSBoundParameters.Remove('name')
        }
    }
    process {
        if ($_.name -like $name) {
            foreach ($p in $PSBoundParameters.GetEnumerator()) {
                $_.($p.Key) = $p.value
            }
        }
        $_
    }
}

#

function numbers { 2+2; 9/3; [math]::Sqrt(27) }

function numbers2 {
    $i = 1
    while ($i -le 10) {
        $i
        $i++
    }
}

# Debugging

function my-func ($x) {
    'Getting the date'
    $x = Get-Date
    "Date is $x, now getting the day"
    $day = $x.Day
    'Returning the day'
    $day
}
my-func
$x = my-func
$x

# Use Out-Null or cast to [void] to discard unwanted outputs

function addArgsToArrayList {
    $a1 = New-Object -TypeName System.Collections.ArrayList
    $args | ForEach-Object { $a1.Add($_) | Out-Null }
}

# 6.4.1

function my-cmdlet ($x) {
    begin {
        $c=0
        "In Begin, c is $c, x is $x"
    }
    process {
        $c++
        "In Process, c is $c, x is $x, `$_ is $_"
    }
    end {
        "In End, c is $c, x is $x"
    }
}
1, 2, 3 | my-cmdlet 22

for ($g = 0; $g -lt $array.Count; $g++) {

}