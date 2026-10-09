# Cài MCP Trello + plugin skills Trello cho Claude Code.
# Cần: Node.js (npx), Claude Code. Key/token lấy tại https://trello.com/power-ups/admin
param([Parameter(Mandatory)]$ApiKey, [Parameter(Mandatory)]$Token,
      $Workspaces = "69cffce74cce7d879e1a79d2,69cf8fff9d8d8de8459f787e")
claude mcp add trello --scope user `
  -e TRELLO_API_KEY=$ApiKey -e TRELLO_TOKEN=$Token -e TRELLO_ALLOWED_WORKSPACES=$Workspaces `
  -- npx -y @delorenj/mcp-server-trello
claude plugin marketplace add "$PSScriptRoot"
claude plugin install trello@dbhq
Write-Host "Xong. Thoát và mở lại Claude Code để MCP nạp env."
