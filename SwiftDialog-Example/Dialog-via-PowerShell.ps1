cls

# Helper (This tiny sh file acts as a bridge from PowerShell to Dialog)
$DialogRunner = Join-Path "$PSScriptRoot" -ChildPath "dialog_runner.sh"

# Create Hashtable for the SwiftDialog attributes
$dialogAttributes = @{}

# Define the variables for the radio buttons
$title1 = "Select a number:"
$values1 = @( "one", "two", "three", "four", "five" )

$title2 = "Select another number:"
$values2 = @( "six", "seven", "eight", "nine", "ten" )

$selectItems = @(
    [PSCustomObject]@{
        title = $title1
        values = $values1
        style = 'radio'
    },
    [PSCustomObject]@{
    title = $title2
    values = $values2
    style = 'radio'
    }

)

# Create the path to the PNG file.
$IconPath = Join-Path "$PSScriptRoot" -ChildPath "random.png"

# Add attributes to the hashtable
$dialogAttributes.add( 'blurscreen', $false )
$dialogAttributes.add( 'button1text', 'OK' )
$dialogAttributes.add( 'button2', $true )
$dialogAttributes.add( 'button2text', 'Cancel' )
$dialogAttributes.add( 'hideicon', $false )
$dialogAttributes.add( 'icon', $IconPath)
$dialogAttributes.add( 'iconsize', 124 )
$dialogAttributes.add( 'infotext', 'Some important info here.' )
$dialogAttributes.add( 'message', 'Select your action from the radio buttons.' )
$dialogAttributes.add( 'messagealignment', 'left' )
$dialogAttributes.add( 'moveable', $true )
$dialogAttributes.add( 'ontop', $true )
$dialogAttributes.add( 'quitoninfo', $true )
$dialogAttributes.add( 'titlefont', 'colour=blue,size=24' )
$dialogAttributes.add( 'selectitems', $selectItems )
$dialogAttributes.add( 'title', 'An Important Message' )
$dialogAttributes.add( 'height', 500 )
$dialogAttributes.add( 'width', 650 )

# Convert the Hashtable to json
$jsonParms = ($dialogAttributes | ConvertTo-Json -Depth 5 -Compress)

# Launch SwiftDialog with the helper script
$Response = (/bin/zsh "$DialogRunner" "$jsonParms")

# Convert to hashtable to easily navigate
$Response = $Response | ConvertFrom-Json

# Get the exit code from response
$ExitCode = $Response.exitCode
Write-Host "The exit code was: " $ExitCode

# Get the json element from response (Converted back to json for the output)
$jsonResponse = $Response.jsonValue | ConvertTo-Json
Write-Host "The json response was:"
$jsonResponse
