function New-IntegrationTest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$ScriptName
    )

    $paths = Resolve-ProjectPaths
    $sutPath = Join-Path $paths.ScriptsRoot "$ScriptName.ps1"

    if (-not (Test-Path $sutPath)) {
        throw "Integration tests require an existing script. Create unit tests first."
    }

    New-ProjectFixture -Name $ScriptName -IntegrationOnly
}