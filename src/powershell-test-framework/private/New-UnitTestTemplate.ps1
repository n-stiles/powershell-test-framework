function New-UnitTestTemplate {
    param([string]$Name)

@"
<#
.SYNOPSIS
Unit tests for $Name.ps1

.DESCRIPTION
Unit test description 
#>

# Load framework bootstrap and helpers 
. "`$PSScriptRoot\..\TestBootstrap.ps1"
. "`$PSScriptRoot\..\Helpers\CommonMocks.ps1"

# Import System Under Test
. (Import-Sut -TestFilePath `$MyInvocation.MyCommand.Path)

Describe '$Name Unit Tests' -Tag 'Unit' {

    BeforeAll {
        # Enforce unit test isolation and safety rules
        Assert-UnitTestContext
    }

    BeforeEach {
        # Reset / initialize common variables if needed
    }

    Context 'Happy Path' {

        It 'Should perform expected behavior under normal conditions' {
            # Arrange
            # Mock dependencies here
            # Example:
            # Mock Invoke-Sqlcmd { return @() }

            # Act
            # `$result = Invoke-$Name

            # Assert
            # `$result | Should -Not -BeNullOrEmpty
            $true | Should Be $true
        }
    }

    Context 'Error Handling' {

        It 'Should handle invalid input gracefully' {
            # Arrange

            # Act / Assert
            { throw 'Simulated failure' } | Should Throw
        }
    }
}
"@
}