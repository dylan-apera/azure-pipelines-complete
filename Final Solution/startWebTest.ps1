param([string]$Url)

$calledURL = [string]::Empty
1..10 | ForEach-Object -ThrottleLimit 5 -Parallel {
    for ($i; $i -lt 10; $i++) {
        
        try {
            if ($i -eq 5) {
                $calledURL = "$using:Url/Edit"
                $rsp = Invoke-WebRequest -Uri "$using:Url/Edit" -Method Get
            } else {
                $calledURL = $using:Url
                $rsp = Invoke-WebRequest -Uri $using:Url -Method Get
                $sts = $rsp.StatusCode
            }
        } catch {
            $sts = $_.Exception.Response.StatusCode.Value__
        }

        "Called $calledURL on $_ with status code: $sts"
        Start-Sleep -Milliseconds 500
    }
}