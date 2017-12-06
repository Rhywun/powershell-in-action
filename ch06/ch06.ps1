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

ql red orange yellow green blue indigo violet
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

#

function dow ([datetime] $d = $(Get-Date)) { $d.DayOfWeek }
dow
dow "April 15, 1969"

#

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

#

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
