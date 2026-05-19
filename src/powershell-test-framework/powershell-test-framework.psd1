@{
    RootModule        = 'powershell-test-framework.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '541BE185-EFF2-4A51-B968-09D03CC14DD0'
    Author            = 'Natisha Stiles'
    Copyright         = '(c) 2026'
    Description       = 'Unit and integration test framework built on Pester.'

    PowerShellVersion = '5.1'

    FunctionsToExport = '*'
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags       = @('SQL', 'Pester', 'Testing')
            ProjectUri = ''
        }
    }
}