---
name: trello-khong-dung-khong-gian-otl
description: "Trello - KHÔNG GIAN OTL đã được Sáng mở quyền (09/09/2026); kèm ID board ĐIỆN - OTL, list Yêu Cầu Mới, nhãn và member cần dùng"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 11ddf62a-3399-455c-a146-9e3b5ddad1c5
  modified: 2026-09-15T01:22:19.296Z
---

**Cập nhật 09/09/2026:** Sáng đã **cho phép làm việc trên "KHÔNG GIAN OTL"**, cụ thể là
board công việc điện. Điều khoản cũ "tuyệt đối không đụng" không còn đúng nữa. Vẫn giữ
nguyên tinh thần: xác nhận board đích trước mọi lệnh ghi, và không tự ý đụng 9 board còn
lại trong workspace nếu Sáng không nói tới.

**ID cần dùng (đã xác minh):**

| Thứ | ID |
|---|---|
| Workspace `KHÔNG GIAN OTL` | `69cffce74cce7d879e1a79d2` (14 thành viên, board công ty thật) |
| Workspace của Sáng | `69cf8fff9d8d8de8459f787e` |
| Board `ĐIỆN - OTL` | `69cfffd45947ccc6f2c007bd` |
| List `📥 Yêu Cầu Mới` | `69d8bd7615d278429f6f5900` |
| List `KẾ HOẠCH TUẦN` | `69d8c6de10e8a937cee5e0e5` |
| Member Sáng | `69cf7af853b5726117c4d543` |
| Nhãn `👤 Sáng( điện)` | `6a853898cd24edfe05d556b0` |
| Nhãn `R&D - TEST CHƯƠNG TRÌNH` | `6a85546f0fb939d1885e4b25` |

**Why:** Token Trello cấp toàn quyền trên mọi board, nên chốt chặn thật nằm ở biến môi
trường `TRELLO_ALLOWED_WORKSPACES` trong `mcpServers.trello.env` của `C:\Users\Admin\.claude.json`.
Nó phải liệt kê **cả hai** ID ở trên, ngăn nhau bằng dấu phẩy, không khoảng trắng.

**Thẻ tuần nằm ở list `📥 Yêu Cầu Mới`, KHÔNG phải `KẾ HOẠCH TUẦN`** — list
`KẾ HOẠCH TUẦN` hiện rỗng (kiểm 09/09/2026). T34–T37 của OTL-30 đều ở `Yêu Cầu Mới`.
Tìm thẻ nhanh bằng `get_my_cards` (trả về JSON to, phải parse bằng script) chứ đừng quét 38 list.

**Quy tắc đặt tên thẻ tuần (Sáng chốt 09/09/2026):**
```
[AI_Sa] <dự án> · T<số tuần> (<dd–dd/mm>) — <tên chung công việc tuần> (<khách hàng>)
```
Ví dụ thật:
- `[AI_Sa] OTL-30 · T37 (07–13/09) — Lập trình + test hệ silo 4 bồn (Cà Kể)`
- `[AI_Sa] OTL-30 · T35 (24–29/08) — Lập trình máy rang 30KG (Cà Kể)`

Thứ tự này do Sáng chọn sau khi so 3 phương án: khoá quét (dự án → tuần) nằm trước để
các tuần của cùng một máy xếp thẳng hàng, phần mô tả nằm cuối vì đó là phần bị cắt khi
cột hẹp. **Không lặp tên "Sáng"** ở đuôi — `[AI_Sa]` đã nói rồi. Ngoặc cuối là **khách
hàng của máy** (máy rang 30KG là của *Cà Kể*).

**Trường tùy chỉnh của thẻ tuần OTL-30 Cà Kể** (Sáng gửi ảnh mẫu 15/09/2026, đã điền T34–T38).
Tạo thẻ tuần mới thì điền luôn bằng `update_card_custom_field` (type `list`, value = option ID):

| Trường | Giá trị | Field ID | Option ID |
|---|---|---|---|
| LOẠI DỰ ÁN | Lắp đặt trong nước | `6a6463bdaab34c940edbfaf9` | `6a6463bf229fc18c8485f1e3` |
| LOẠI CÔNG VIỆC | Lập trình tự động | `69e1033b2790c8cca4968861` | `69e1033b2790c8cca4968865` |
| OTL | OTL-30 | `6a3e5df8c1389bb355a645fa` | `6a3e5df8c1389bb355a64602` |
| AUTO | AUTO- SIEMEN | `6a531474adca54cedc69b56d` | `6a7bd2091f08b877874ba8f8` |
| OL | OL-120-AUTO | `6a5316def67f1102ac82eb11` | `6a5316def67f1102ac82eb15` |
| SILO | SILO-AUTO | `6a53184db588f4c5588093b0` | `6a53184db588f4c5588093b1` |

Các trường còn lại (KẾT QUẢ QC, ĐIỂM KPI, NGUYÊN NHÂN GỐC, OD, AF, VIỆC PHÁT SINH, THÀNH
PHẨM, NGÀY CÔNG, GIÁ GỐC) để trống. OL-120-AUTO là theo đúng ảnh mẫu của Sáng, đừng "sửa" thành OL-30.

**Sáng làm việc theo THẺ TUẦN, trong thẻ phân việc theo NGÀY** (chốt 09/09/2026).
Nên khi Sáng nói "thêm việc vào Trello":
- **Không tạo thẻ mới.** Tìm thẻ tuần đang chạy (`[AI_Sa] <dự án> · T<tuần>`) rồi thêm
  vào **checklist của ngày** bên trong nó.
- Mặc định là checklist của **hôm nay**; Sáng bảo ngày nào thì vào đúng ngày đó.
- Checklist ngày thường đã có sẵn — kiểm tra bằng `get_card` trước, đừng tạo trùng
  (không có API xoá/đổi tên checklist).
- Thêm xong nhớ `update_checklist_item` `state: complete` cho việc đã làm xong;
  `add_checklist_item` luôn tạo mục chưa tick.

**How to apply:**
- Board này là board thật của công ty, 14 người nhìn thấy. **Không tạo hàng loạt thẻ.**
  Sáng muốn **một thẻ cho cả tuần**, phân việc theo ngày bằng checklist bên trong, chứ
  không phải mỗi việc một thẻ — đã làm sai một lần và phải archive 18 thẻ.
- **Chỉ ghi việc đáng kể.** Bỏ hết việc vặt nội bộ: lưu project, dọn biến thừa, đổi tên
  file, sửa chính tả… Sáng đã phải tự xoá mấy mục đó ra khỏi thẻ tuần. Thước đo: người
  khác trong công ty đọc lên có thấy đó là một phần công việc không — không thì đừng ghi.
- Dùng lại nhãn có sẵn của board, đừng tạo nhãn mới.
- Chế độ tự động **chặn cả đọc lẫn ghi** `.claude.json`, nên muốn sửa allowlist thì phải
  đưa nguyên đoạn cho Sáng dán tay, rồi Sáng thoát và mở lại Claude Code (MCP chỉ đọc env
  lúc khởi động).

Xem thêm [[trello-mcp-thu-thuat]].
