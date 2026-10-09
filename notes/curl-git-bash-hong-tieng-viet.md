---
name: curl-git-bash-hong-tieng-viet
description: curl.exe gọi từ Git Bash làm hỏng tiếng Việt trong tham số (ANSI + mã hoá hai lần) — ghi Trello/API bằng Python requests json thay vì --data-urlencode
metadata:
  type: feedback
---

Gọi `curl --data-urlencode "name=Chấm công"` từ Bash tool trên Windows: Trello nhận `Ch%3Fm c%F4ng` — chữ ngoài Latin-1 thành `?`, còn lại bị URL-encode hai lần. Tham số đi qua codepage ANSI khi bash gọi curl.exe; jq.exe --arg cũng cùng đường. Nhãn/list tạo qua MCP trello thì đúng.

**Why:** Chuỗi qua argv của exe Windows bị chuyển sang cp1252; UTF-8 chỉ an toàn khi đọc từ file hoặc trong tiến trình Python.

**How to apply:** Viết script .py (heredoc từ Bash tool giữ UTF-8), dùng `requests.put/post(..., json=...)`; đặt `PYTHONIOENCODING=utf-8` khi print. Kiểm tra lại bằng GET và tìm `%` hoặc `?` trong name/desc. Liên quan: [[csc-can-bom-cho-tieng-viet]].
