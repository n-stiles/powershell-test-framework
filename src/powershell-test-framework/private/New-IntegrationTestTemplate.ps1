function New-IntegrationTestTemplate {
    param([string]$Name)

@"
<#
.SYNOPSIS
Integration tests for $Name.ps1
#>

. "`$PSScriptRoot\..\TestBootstrap.ps1"
. (Import-Sut -TestFilePath `$MyInvocation.MyCommand.Path)

Describe '$Name - Integration Tests' -Tag Integration {

    It 'Executes successfully' {
        `$true | Should Be $true
    }
}
"@
}