function New-UnitTest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ScriptName
    )

    New-ProjectFixture -Name $ScriptName -UnitOnly
}