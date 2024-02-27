Param(
    [Parameter(Mandatory = $true, Position = 1)]
    [string]
    $GroupName
)

$groupObj = (az ad group create --display-name $GroupName --mail-nickname $GroupName -o json)
$groupObj = ConvertFrom-Json ([string]$groupObj)

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['objectId'] = $groupObj.id
