﻿<#
.SYNOPSIS
	Opens the Pixabay website
.DESCRIPTION
	This script launches the Web browser with the Pixabay website.
.EXAMPLE
	PS> ./open-pixabay
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

& "$PSScriptRoot/open-browser.ps1" "https://pixabay.com"
exit 0 # success
