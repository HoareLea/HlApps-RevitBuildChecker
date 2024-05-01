# Fetch the webpage content
$url = "https://www.autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/How-to-tie-the-Build-number-with-the-Revit-update.html"
$response = Invoke-WebRequest -Uri $url

# Decode Unicode characters
$decodedContent = $response.Content -replace '\\u003c', '<' -replace '\\u003e', '>'

# Use regex to find all table blocks
$tables = [regex]::Matches($decodedContent, "(<table.*?>.*?</table>)", [System.Text.RegularExpressions.RegexOptions]::Singleline)

# Define a hashtable to store versions
$versions = @{}

# Loop through each table to find the last <tr> before </table> and clean HTML tags
foreach ($table in $tables) {
    # Find and clean the last row in the current table
    $lastRow = [regex]::Matches($table.Value, "<tr.*?>(.*?)</tr>", [System.Text.RegularExpressions.RegexOptions]::Singleline) | Select-Object -Last 1
    $cleanRow = $lastRow.Groups[1].Value -replace '<[^>]+>', '' -replace '\s+', ' ' -replace '\\n', ''

    # Extract version, build, and build number
    if ($cleanRow -match '\s*(\d{4})\.\d+\.\d+\s*(\d+\.\d+\.\d+\.\d+)\s*\d{8}_(\d{4})\s*') {
        $year = $matches[1]
        $build = $matches[2]
        $buildNumber = $matches[3]

        # Add version data to the hashtable
        $versions[$year] = $build
    } else {
        Write-Output "No match found for cleaned row: $cleanRow"
    }
}

# Convert hashtable to JSON format
$jsonContent = @{
    Versions = $versions
} | ConvertTo-Json -Depth 10

# Write JSON content to a file
$jsonContent | Set-Content -Path "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json"

# Open the JSON file
Invoke-Item -Path "C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json"
