# Create deploy directory if doesn't exist
$deploy_path = "..\deploy"

if(!(Test-Path -Path $deploy_path ))
{
    New-Item -ItemType directory -Path $deploy_path
}

# Get project name
$projname = (Get-Item *.PrjPcb).BaseName

# Delete previous files
del "$deploy_path\$projname*"

# PDF --------------------------------------------------------------------------

$pdf_path = "PDF\$projname.PDF"

if (Test-Path -Path $pdf_path)
{
	copy $pdf_path "$deploy_path\$projname.pdf"
}

# BOM --------------------------------------------------------------------------

$bom_path = "Project Outputs for $projname\$projname.xlsx"

if (Test-Path -Path $bom_path)
{
	copy $bom_path "$deploy_path\$projname-bom.xlsx"
}

# How to generate BOM?

# Gerbers ----------------------------------------------------------------------

$gerbers = @(
	"Gerbers\$projname.GBL",
	"Gerbers\$projname.GBO",
	"Gerbers\$projname.GBS",
	"Gerbers\$projname.GM1",
	"Gerbers\$projname.GTL",
	"Gerbers\$projname.GTO",
	"Gerbers\$projname.GTS",
	"Gerbers\$projname-NonPlated.TXT",
	"Gerbers\$projname-Plated.TXT"
)

$gerbers_exist = @()

foreach ($file in $gerbers)
{
	if (Test-Path -Path $file)
	{
		$gerbers_exist += $file
	}
}

$compress =
@{
	Path = $gerbers_exist
	CompressionLevel = "Optimal"
	DestinationPath = "$deploy_path\$projname-gerber.zip"
}

Compress-Archive @compress
