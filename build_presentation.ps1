# Check if @marp-team/marp-cli is installed
try {
    npx --version
}
catch {
    Write-Error "npx is not installed. Please install Node.js."
    exit 1
}

$presentationFile = "docs/Presentation.md"
$outputDir = "site/presentation"
$outputFile = "$outputDir/index.html"

# Create output directory if it doesn't exist
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

Write-Host "Building presentation from $presentationFile to $outputFile..."

# Run marp-cli using npx
npx @marp-team/marp-cli@latest $presentationFile -o $outputFile

if ($LASTEXITCODE -eq 0) {
    Write-Host "Presentation built successfully!"
    Write-Host "You can view it at: $outputFile"
}
else {
    Write-Error "Failed to build presentation."
}
