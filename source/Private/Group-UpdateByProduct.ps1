<#
.SYNOPSIS
    Groups updates by operating system product.
.DESCRIPTION
    This function groups updates by operating system product.
    The function takes an array of updates and an array of operating
    system names, and returns a hashtable where each key is an
    operating system name and each value is an array of updates that
    match that operating system.
.PARAMETER AllUpdates
    An array of updates to group by operating system product. Each
    update object must have a 'Product' property that contains the name
    of the operating system product (e.g. "Windows 10 Enterprise").
.PARAMETER OSList
    An array of operating system names to group by. Each operating system
    name should be a string that matches the start of the operating system
    product name (e.g. "Windows 10").
.OUTPUTS
    System.Collections.Hashtable
    A hashtable where each key is an operating system name and each
    value is an array of updates that match that operating system.
.EXAMPLE
    $allUpdates = @(
        @{
            Product = "Windows 10 Enterprise"
            Title = "Cumulative Update for Windows 10 Version 21H1"
            KB = "KB5001330"
            ReleaseDate = "04/20/2021"
            Severity = "Critical"
        },
        @{
            Product = "Windows Server 2016"
            Title = "Security Update for Windows Server 2016"
            KB = "KB5003204"
            ReleaseDate = "05/11/2021"
            Severity = "Important"
        }
    )
    $osList = @("Windows 10", "Windows Server")
    $groupedUpdates = Group-UpdateByProduct -AllUpdates $allUpdates -OSList $osList
    $groupedUpdates["Windows 10"]
    $groupedUpdates["Windows Server"]
.NOTES
    Author: DrIOSx
#>
function Group-UpdateByProduct {
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.ArrayList]$AllUpdates,
        [string[]]$OSList
    )

    $Updates = @{}

    foreach ($OS in $OSList) {
        $Updates[$OS] = $AllUpdates | Where-Object { $_.Product -like "$OS*" }
    }

    return $Updates
}