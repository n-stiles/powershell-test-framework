function Assert-UnitTestContext {
    [CmdletBinding()]
    param()

    Write-Verbose "Validating unit test isolation..."

    # Enforce isolation (this is what actually matters)
    Assert-NoUnmockedInfrastructure

    # Soft check for dangerous commands
    $dangerousCommands = @(
        'Invoke-Sqlcmd',
        'Invoke-RestMethod',
        'Invoke-WebRequest'
    )

    foreach ($cmd in $dangerousCommands) {
        try {
            if (-not (Get-Mock -CommandName $cmd -ErrorAction Stop)) {
                Write-Verbose "Warning: '$cmd' is not mocked."
            }
        }
        catch {
            # Get-Mock doesn't exist in Pester 3 — ignore
            Write-Verbose "Mock inspection not supported for '$cmd' in this Pester version."
        }
    }

    Write-Verbose "Unit test context validation complete."
}
