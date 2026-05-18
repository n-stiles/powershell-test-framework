function New-SutTemplate {
    param([string]$Name)

@"
<#
.SYNOPSIS
$Name

.DESCRIPTION
Implements the $Name script functionality.

.PARAMETER
Inputs 

.NOTES
  Version:        #.#
  Author:         <user@domain.com>
  Creation Date:  Date
  Purpose/Change: Initial implementation

.EXAMPLE
    .\$Name.ps1 -Parameter paramvalue
#>

function $Name {
    [CmdletBinding()]
    param()

    # TODO
}
"@
}