## Launching SwiftDialog with a PowerShell script

**Things the I tried:** (That you think would have worked)  
`Start-Process -FilePath "/usr/local/bin/dialog" -ArgumentList "arg1", "arg2"`  

`& "/usr/local/bin/dialog" "arg1" "arg2"`  

Dialog would complain that the `JSON import failed`. The same exact Json passed through the zsh script works fine. So, I'm unsure what Powershell was doing to to json.


In the end, I ended up putting a small `zsh` shell script in between [PowerShell](https://learn.microsoft.com/en-us/powershell/) and [SwiftDialog](https://github.com/swiftDialog/swiftDialog) to get this to work.  

I have included the `zsh` script: [dialog_runner.sh](./dialog_runner.sh)  
Along withe the PowerShell example: [Dialog-via-PowerShell.ps1](./Dialog-via-PowerShell.ps1)

