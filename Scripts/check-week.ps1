﻿<#
.SYNOPSIS
	Determines the week number 
.DESCRIPTION
	This script determines and speaks the current week number by text-to-speech (TTS).
.EXAMPLE
	PS> ./check-week
	✔️ It's week #4.
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	$WeekNo = (get-date -UFormat %V)
	& "$PSScriptRoot/give-reply.ps1" "It's week #$WeekNo."
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
