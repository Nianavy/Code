# scoop app's pwsh config
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