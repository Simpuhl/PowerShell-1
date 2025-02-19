﻿<#
.SYNOPSIS
	Writes text in vertical direction
.DESCRIPTION
	This script writes text in vertical direction.
.PARAMETER text
	Specifies the text to write
.EXAMPLE
	PS> ./write-vertical "Hello World"
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$text = "")

try {
	if ($text -eq "" ) { $text = read-host "Enter the text to write" }

	[char[]]$TextArray = $text
	foreach($Char in $TextArray) {
		write-output $Char
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
