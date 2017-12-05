[CmdletBinding(SupportsPaging=$true)]
param()

$firstNumber = [math]::Min($PSCmdlet.PagingParameters.Skip, 20)
$lastNumber = [math]::Min($PSCmdlet.PagingParameters.First + $firstNumber - 1, 20)

if ($PSCmdlet.PagingParameters.IncludeTotalCount) {
    $totalCountAccuracy = 1.0
    $totalCount = $PSCmdlet.PagingParameters.NewTotalCount(20, $totalCountAccuracy)
    Write-Output $totalCount
}

$firstNumber..$lastNumber | Write-Output
