function Resolve-ProjectPaths {
    <#
    .SYNOPSIS
    Resolves project paths for repos where Tests live under Scripts.

    .DESCRIPTION
    Expected layout:

        RepoRoot\
        ├── Scripts\
        │   ├── *.ps1
        │   └── Tests\
        │       ├── Unit\
        │       └── Integration\
        └── Tools\
            └── New.SqlFixture\
    #>

    # Start from where this file lives: Tools\New.SqlFixture\Private
    $current = $PSScriptRoot

    # Walk up until we find the Tools directory
    while ($current -and (Split-Path $current -Leaf) -ne 'Tools') {
        $current = Split-Path $current -Parent
    }

    if (-not $current) {
        throw "Unable to locate repo root. 'Tools' folder not found above $PSScriptRoot"
    }

    # Repo root is parent of Tools
    $repoRoot = Split-Path $current -Parent

    $scriptsRoot = Join-Path $repoRoot 'Scripts'
    $testsRoot   = Join-Path $scriptsRoot 'Tests'
    $unitRoot    = Join-Path $testsRoot 'Unit'
    $intRoot     = Join-Path $testsRoot 'Integration'

    foreach ($path in @($scriptsRoot, $testsRoot, $unitRoot, $intRoot)) {
        if (-not (Test-Path $path)) {
            throw "Required project folder not found: $path"
        }
    }

    [PSCustomObject]@{
        RepoRoot             = $repoRoot
        ScriptsRoot          = $scriptsRoot
        TestsRoot            = $testsRoot
        UnitTestsRoot        = $unitRoot
        IntegrationTestsRoot = $intRoot
    }
}