---
name: trello-mcp-thu-thuat
description: MCP Trello - đính ảnh bằng file:/// khỏi tốn base64; không có lệnh đổi tên/xoá checklist; & bị escape thành &amp;
metadata: 
  node_type: memory
  type: reference
  originSessionId: b52be137-5628-454b-875d-b7ff4aeb0ed4
  modified: 2026-09-09T02:46:39.196Z
---

Ba thứ đã kiểm chứng trên `@delorenj/mcp-server-trello` (09/09/2026):

**1. `attach_file_to_card` nhận đường dẫn local qua `file:///`.**
```
fileUrl: "file:///C:/Users/.../anh.jpg"
```
Server tự đọc file rồi upload — ảnh **không đi qua context**. Đừng dùng
`attach_image_data_to_card` với base64: một ảnh 90 KB tốn ~25k token cho lần đọc file
cộng thêm ~25k nữa khi viết vào lời gọi tool. Trello sinh preview tối đa 1150 px nên nén
JPEG về bề ngang 1150, quality 70 là đủ đẹp mà file chỉ còn ~90 KB.

**2. Không có tool đổi tên hoặc xoá cả checklist.** Chỉ có `create_checklist`,
`copy_checklist`, và các lệnh cấp *item*. Đặt sai tên checklist là phải nhờ người dùng
sửa tay — nên soát tên trước khi tạo.

**3. Ký tự `&` trong tên checklist bị ghi thành `&amp;`.** Tránh dùng `&`, viết "và".

**4. Tên đính kèm không được có dấu `/`.** `attach_file_to_card` với `name`
"Báo cáo (12/09).pdf" → Trello lấy phần sau dấu `/` làm `fileName` = "09).pdf", link tải
về cũng thành `.../download/09).pdf`. Tên hiển thị vẫn đúng nên khó nhận ra. Không có
tool xoá attachment — phải nhờ Sáng xoá tay. Viết ngày kiểu `12-09-2026`, tên ASCII
gạch dưới cho chắc (kiểm 14/09/2026).

**Vặt khác:** `list_boards_in_workspace` và `add_cards_to_list` trả về JSON khổng lồ,
tràn giới hạn token — kết quả bị đẩy ra file, phải parse bằng script chứ đừng đọc thẳng.
`add_cards_to_list` trả `{"created": [...], "errors": [...]}` chứ không phải mảng.

Xem thêm [[trello-khong-dung-khong-gian-otl]].
