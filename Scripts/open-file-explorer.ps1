﻿<#
.SYNOPSIS
	Starts the File Explorer
.DESCRIPTION
	This script launches the File Explorer.
.EXAMPLE
	PS> ./open-file-explorer
.PARAMETER Path
	Specifies the path to the folder to display 
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$Path = "")

try {
	if ("$Path" -ne "") {
		start-process explorer.exe "$Path"
	} else {
		start-process explorer.exe
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
