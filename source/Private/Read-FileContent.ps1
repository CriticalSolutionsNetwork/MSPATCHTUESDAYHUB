<#
.SYNOPSIS
    Reads the contents of a file and returns the content as a single string.
.DESCRIPTION
    This function reads the contents of a file and returns the content as a single string.
.PARAMETER FilePath
    The path to the file to read.
.OUTPUTS
    System.String
    The contents of the file as a single string.
.EXAMPLE
    $fileContent = Read-FileContent -FilePath "C:\example.txt"
    $fileContent
.NOTES
    Author: DrIOSx
#>
function Read-FileContent {
    param(
        [string]$FilePath
    )
    return (Get-Content -Path $FilePath -Raw)
}