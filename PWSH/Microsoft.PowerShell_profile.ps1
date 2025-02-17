# scoop app's pwsh config

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

Function zcc {
    for ($i = 0; $i -lt $args.Count; $i++) {
        if ($args[$i].StartsWith("-o")) {
            $args[$i+1] = $args[$i+1] + ".exe"
            break
        }
    }
    zig cc $args
}

Function z++ {
    for ($i = 0; $i -lt $args.Count; $i++) {
        if ($args[$i].StartsWith("-o")) {
            $args[$i+1] = $args[$i+1] + ".exe"
            break
        }
    }
    zig c++ $args
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
