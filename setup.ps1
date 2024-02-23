Start-Sleep -Seconds 5
$sig = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
Add-Type -MemberDefinition $sig -name NativeMethods -namespace Win32
Start-Process -FilePath "$env:comspec" -ArgumentList "/c tree `"%SystemDrive%\Program Files`""
Start-Sleep -Seconds 2
Start-Process -FilePath "powershell" -WindowStyle Hidden -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -Command `"Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('This')`""
Start-Sleep -Seconds 2
Start-Process -FilePath "powershell" -WindowStyle Hidden -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -Command `"Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('is')`""
Start-Sleep -Seconds 2
Start-Process -FilePath "powershell" -WindowStyle Hidden -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -Command `"Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('a')`""
Start-Sleep -Seconds 2
Start-Process -FilePath "powershell" -WindowStyle Hidden -ArgumentList "-WindowStyle Hidden -ExecutionPolicy Bypass -Command `"Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('message')`""
@"
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Id leo in vitae turpis massa sed elementum. Eleifend mi in nulla posuere sollicitudin.
Et malesuada fames ac turpis egestas integer eget.
Proin gravida hendrerit lectus a. Eget lorem dolor sed viverra ipsum nunc aliquet.
In iaculis nunc sed augue lacus. Amet cursus sit amet dictum sit.
Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Fames ac turpis
egestas maecenas pharetra convallis posuere morbi leo. Lacus sed viverra
tellus in hac habitasse. Posuere lorem ipsum dolor sit amet consectetur 
adipiscing. Cras ornare arcu dui vivamus arcu felis bibendum ut tristique.
Quisque egestas diam in arcu cursus euismod quis viverra. Quis eleifend
quam adipiscing vitae proin sagittis nisl. Praesent tristique magna
sit amet purus gravida quis.
"@ | Out-File -FilePath "$env:temp\message.txt" -Force
Start-Sleep -Seconds 5
Start-Process -FilePath "notepad" -ArgumentList "$env:temp\message.txt"
Start-Sleep -Seconds 5
Start-Process -FilePath "chrome" -WindowStyle Maximized -ArgumentList "-incognito --start-maximize --new-window https://www.google.com/images?q=fluffy%20cats"
while($true){if((Get-Process chrome | Foreach {$_.Parent.MainWindowTitle} | where{$_ -like '*fluffy*'}).Length -gt 0){break}};
foreach($p in Get-Process chrome){[Win32.NativeMethods]::ShowWindowAsync($p.MainWindowHandle, 3);}
Start-Sleep -Seconds 2
Start-Process -FilePath "chrome" -ArgumentList "-incognito https://www.google.com/images?q=hamster"
Start-Sleep -Seconds 2
Start-Process -FilePath "chrome" -ArgumentList "-incognito https://portal.hdontap.com/s/embed/?stream=dinand_holycross-CUST"
Start-Sleep -Seconds 2
