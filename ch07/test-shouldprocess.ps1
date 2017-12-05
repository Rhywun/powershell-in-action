[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')] 
param()

if ($PSCmdlet.ShouldProcess('param1', 'param2')) {
    Write-Output 'Process!'
}
