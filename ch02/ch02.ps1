# Hashtables

$user = @{ FirstName='Joe'; LastName='Blow'; PhoneNumber='555-1212' }
Write-Host $user['firstname', 'lastname'] # Joe Blow
Write-Host $user.Keys
Write-Host $user[$user.Keys]
Write-Host $user.Values
$user.Date = Get-Date
$user['City'] = 'Seattle'
Write-Host "$user" # this doesn't do what you might expect

# Arrays

$a = 1, 2, 3
$a[0] = [System.Math]::PI
$a[2] = 'Hi, there.'
$a += 44, 55

# Type literals

$i = [int[]] '123'

# List of aliases
$tna = [psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get
$tna.GetEnumerator() | Sort-Object Key

# Generics

$l = New-Object System.Collections.Generic.List[int]
$l.add(1)
$l.add(2)
$l.add('three') # Error

# Static methods

[string]::Join(', ', ('one', 'two', 'three'))
