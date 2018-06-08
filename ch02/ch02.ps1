#
# Types
#

# Find a type
function Find-Type {
    param([regex] $Pattern)
    [System.AppDomain]::CurrentDomain.GetAssemblies().GetTypes() | Select-String $Pattern
}

# Find an assembly & its details
[powershell].Assembly.Location | Get-ChildItem | Select-Object LastWriteTime

#
# Hashtables
#

$user = @{ FirstName = 'Joe'; LastName = 'Blow'; PhoneNumber = '555-1212' }

# Or:
$user = @{
    FirstName   = 'Joe'
    LastName    = 'Blow'
    PhoneNumber = '555-1212'
}

Write-Output $user.FirstName # Joe
Write-Host $user['firstname', 'lastname'] # Joe Blow
Write-Host $user.Keys # FirstName PhoneNumber LastName
Write-Host $user[$user.Keys] # Joe 555-1212 Blow
Write-Host $user.Values # Joe 555-1212 Blow
$user.Date = Get-Date
$user['City'] = 'Seattle'

# This doesn't do what you might expect:
Write-Host "$user" # System.Collections.Hashtable

#
# Arrays
#

$a = 1, 2, 3
$a.GetType().FullName # System.Object[]
$a[0] = [System.Math]::PI
$a[2] = 'Hi, there.'
$a += 44, 55
$a # $a 3.14159265358979 2 Hi, there. 44 55 (with line breaks)

(, 1) # a singleton
@(1) # also a singleton
@() # an empty array

#
# Type literals
#

[int] '123'
[int[]] '123'

([int] '123').Length # 1
([int[]] '123').Length # 1, still just a singleton

# List of type aliases
$tna = [psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get
$tna.GetEnumerator() | Sort-Object Key

#
# Generics
#

$l = New-Object System.Collections.Generic.List[int]
$l.add(1)
$l.add(2)
$l.add('three') # Error

#
# Static methods
#

[string]::Join(', ', ('one', 'two', 'three'))
