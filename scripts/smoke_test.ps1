param(
    [string]$BaseUrl = "http://localhost:8000"
)

$HealthUrl = "$BaseUrl/health"

try {
    $response = Invoke-WebRequest -Uri $HealthUrl -UseBasicParsing -TimeoutSec 20
    if ($response.StatusCode -eq 200) {
        Write-Output "SMOKE_OK: $HealthUrl"
        exit 0
    }

    Write-Output "SMOKE_FAIL: status=$($response.StatusCode)"
    exit 1
}
catch {
    Write-Output "SMOKE_FAIL: request error"
    Write-Output $_.Exception.Message
    exit 1
}
