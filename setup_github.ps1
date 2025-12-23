$ErrorActionPreference = "Continue"

# 1. Detect gh.exe
$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) { 
    $ghCode = (Get-Command gh -ErrorAction SilentlyContinue).Source
    if ($ghCode) { $gh = $ghCode }
    else { 
        Write-Host "GH CLI standard path not found, trying 'gh'..."
        $gh = "gh" 
    }
}
Write-Host "Using gh at: $gh"

# 2. Create Repository (if not exists)
Write-Host "Checking if repository exists..."
& $gh repo view > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Creating Repository..."
    & $gh repo create sap-fcm-training-sandbox --public --source=. --remote=origin --push
}
else {
    Write-Host "Repository seems to exist or is accessible. Pushing latest changes..."
    git push origin main
}

# 3. Create Issues
$content = Get-Content "docs\Tasks.md" -Encoding UTF8
$currentTitle = $null
$currentBody = @()

function Create-Issue {
    param ($title, $bodyLines)
    $bodyStr = "## 1. 작업 배경 (Background)`r`n- 해당 작업은 프로젝트의 단계별 진행을 위해 필요합니다.`r`n`r`n## 2. 작업 내용 (Work Content)`r`n" + ($bodyLines -join "`r`n") + "`r`n`r`n## 3. 인수 조건 (Acceptance Criteria)`r`n- [ ] 위 작업 내용이 모두 완료되어야 함`r`n- [ ] 테스트 케이스 통과"
    
    # Use a temp file to avoid shell quoting issues with robust body text
    $tempFile = [System.IO.Path]::GetTempFileName()
    try {
        Set-Content -Path $tempFile -Value $bodyStr -Encoding UTF8
        
        Write-Host "Creating Issue: $title"
        # Check if issue already exists to avoid duplicates (simple check)
        $existing = & $gh issue list --search "$title" --json title
        if ($existing -match $title) {
            Write-Host "  -> Skipping (Found existing issue)"
        }
        else {
            & $gh issue create --title "$title" --body-file "$tempFile"
            if ($LASTEXITCODE -eq 0) { Write-Host "  -> Success" }
            else { Write-Warning "  -> Failed" }
            Start-Sleep -Milliseconds 1000
        }
    }
    finally {
        if (Test-Path $tempFile) { Remove-Item $tempFile }
    }
}

foreach ($line in $content) {
    # Match lines like: - [ ] **Title**
    if ($line -match "^\- \[ \] \*\*(.+)\*\*") {
        # If we have a previous issue pending, create it
        if ($currentTitle) {
            Create-Issue -title $currentTitle -bodyLines $currentBody
        }
        # Start new issue
        $currentTitle = $MATCHES[1].Trim()
        $currentBody = @()
    }
    # Match sub-items like:     - [ ] Subtask
    elseif ($currentTitle -and ($line -match "^\s+\- \[ \]")) {
        $currentBody += $line.Trim()
    }
}

# Create the last issue
if ($currentTitle) {
    Create-Issue -title $currentTitle -bodyLines $currentBody
}
