﻿<#
.SYNOPSIS
	Checks for Noon
.DESCRIPTION
	This script checks the time until Noon and replies by text-to-speech (TTS).
.EXAMPLE
	PS> ./check-noon
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

function TimeSpanToString { param([TimeSpan]$Delta)
	$Result = ""
	if ($Delta.Hours -eq 1) {       $Result += "1 hour and "
	} elseif ($Delta.Hours -gt 1) { $Result += "$($Delta.Hours) hours and "
	}
	if ($Delta.Minutes -eq 1) { $Result += "1 minute"
	} else {                    $Result += "$($Delta.Minutes) minutes"
	}
	return $Result
}

try {
	$Now = [DateTime]::Now
	$Noon = Get-Date -Hour 12 -Minute 0 -Second 0
	if ($Now -lt $Noon) {
		$TimeSpan = TimeSpanToString($Noon - $Now)
		$Reply = "Noon is in $TimeSpan."
	} else {
		$TimeSpan = TimeSpanToString($Now - $Noon)
		$Reply = "Noon was $TimeSpan ago."
	}
	& "$PSScriptRoot/give-reply.ps1" "$Reply"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
