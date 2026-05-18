# Get module root
$ModuleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Load Private functions
Get-ChildItem "$ModuleRoot\private\*.ps1" -Recurse -ErrorAction Stop |
    ForEach-Object {
        . $_.FullName
    }

# Load Public functions
Get-ChildItem "$ModuleRoot\public\*.ps1" -Recurse -ErrorAction Stop |
    ForEach-Object {
        . $_.FullName
    }

# Export public functions only
Export-ModuleMember -Function (
    Get-ChildItem "$ModuleRoot\public\*.ps1" |
        Select-Object -ExpandProperty BaseName
)