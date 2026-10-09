# Trello Toolkit (riêng tư)

Bộ Trello của Sáng cho Claude Code:

| Thư mục | Nội dung |
|---|---|
| `plugin/` | Plugin `trello@dbhq` 1.1.0 (gốc dbhq-uk/trello-skill): skill trello, board-digest, due-radar, life-manager, store-sort |
| `mcp/trello.mcp.json` | Cấu hình MCP `@delorenj/mcp-server-trello`, key/token để trống |
| `notes/` | Ghi chú cách làm: thẻ tuần `[AI_Sa]`, ID board/nhãn/trường OTL, bảng chấm công |
| `install.ps1` | Cài MCP + plugin trên máy mới |

## Cài

```powershell
.\install.ps1 -ApiKey <key> -Token <token>
```

Key/token **không** nằm trong repo. `TRELLO_ALLOWED_WORKSPACES` giới hạn MCP vào KHÔNG GIAN OTL + workspace của Sáng.
