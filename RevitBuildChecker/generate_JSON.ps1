param(
    [string]$OutputFilePath = "C:\Users\jonesc4\HlApps-RevitBuildChecker\RevitBuildChecker\dist\RevitVersionsInfo.json"
)

# Fetch the webpage content
$url = "https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/How-to-tie-the-Build-number-with-the-Revit-update.html"
$response = Invoke-WebRequest -Uri $url
																											   

# Decode Unicode characters
$decodedContent = $response.Content -replace '\\u003c', '<' -replace '\\u003e', '>'

# Use regex to find all table blocks
$tables = [regex]::Matches($decodedContent, "(<table.*?>.*?</table>)", [System.Text.RegularExpressions.RegexOptions]::Singleline)

# Define a hashtable to store versions
$versions = @{}

# Loop through each table to find all <tr> elements and clean HTML tags
foreach ($table in $tables) {
    # Find and clean each row in the current table
    $rows = [regex]::Matches($table.Value, "<tr.*?>(.*?)</tr>", [System.Text.RegularExpressions.RegexOptions]::Singleline)
    foreach ($row in $rows) {
        $cleanRow = $row.Groups[1].Value -replace '<[^>]+>', '' -replace '\s+', ' ' -replace '\\n', ''

        # Extract version, build, and build number
        if ($cleanRow -match '\s*(\d{4})\.\d+\s*(\d+\.\d+\.\d+\.\d+)\s*\d{8}_(\d{4})\s*') {
            $year = $matches[1]
            $build = $matches[2]
           # $buildNumber = $matches[3]

            # Add version data to the hashtable
            $versions[$year] = $build
        } elseif ($cleanRow -match '\s*(\d{4})\.\d+\.\d+\s*(\d+\.\d+\.\d+\.\d+)\s*\d{8}_(\d{4})\s*') {
            $year = $matches[1]
            $build = $matches[2]
           # $buildNumber = $matches[3]

            # Add version data to the hashtable
            $versions[$year] = $build
        } else {
            Write-Output "No match found for cleaned row: $cleanRow"
        }
    }
}

# Convert hashtable to JSON format
$jsonContent = @{
    Versions = $versions
} | ConvertTo-Json -Depth 10

# Ensure the directory exists
$outputDir = Split-Path -Path $OutputFilePath
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force
}

# Write JSON content to a file
$jsonContent | Set-Content -Path $OutputFilePath

# Open the JSON file
Invoke-Item -Path $OutputFilePath
