function Initialize-TestEnvironment {
    <#
    .SYNOPSIS
    Initializes and enforces unit-test isolation rules.

    .DESCRIPTION
    This function establishes guardrails for unit tests by:
    - Blocking all unmocked infrastructure calls
    - Preventing integration behavior in unit tests
    - Enforcing predictable, deterministic test execution

    This function must be called at the top of every Unit test file.
    #>

    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'Stop'

    Assert-NoUnmockedInfrastructure
    Assert-UnitTestContext
}
