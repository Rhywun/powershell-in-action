#!/usr/bin/env pwsh

function hello {
    param($name = 'bub')
    Write-Output "Hello $name, how are you?"
}
