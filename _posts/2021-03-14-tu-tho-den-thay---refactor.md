---
title: "Từ thợ đến thầy - Refactor"
layout: post
category: [Software Engineering]
tag: [refactor]
---

Khi chương trình tiến hoá, sẽ cần suy tính lại những quyết định cũ và bắt tay sửa lại chương trình. Việc sửa lại, cấu trúc lại chương trình mà giữ nguyên tính năng gọi là *refactor*. Việc này trên lí thuyết hoàn toàn tự nhiên, nhưng thực tế lại rất phức tạp. Cấp quản lí bảo:

- Ê, chương trình chạy được sao lại phải sửa?
- Này, sửa lại sẽ mất thời gian, thay vì mất thời gian sửa chẳng thêm được tí tính năng nào, hãy tập trung thêm tính năng mới.
- Đan Mạch, người mới cứ sửa code của người cũ thế này thì loạn.

## Why

Ngụy biện thường gặp:

- Thời hạn giao hàng thường là lí do được đưa ra để trốn refactor: xong project rồi refactor sau => Xong project này sẽ có project khác.
- Premature optimize is the root of all evil => Refactor không phải là optimize.
- Từ từ, khi nào code nhiều nhiều sẽ refactor => Nếu không refactor sớm, sẽ đến lúc việc thêm tính năng mới mất rất nhiều công sức, lúc này refactor sẽ mất công hơn. Giống xây nhà: phía dưới đã yếu, thì sẽ đến lúc không thể xây thêm, xây thêm sẽ gây sụp đổ toàn bộ. Có câu: refactor early, refactor often. Có best practice: họp để code review hàng tuần để refactor.

Theo thời gian độ phức tạp của source code sẽ tăng. Theo đó, thiết kế kém và những đoạn code xấu bắt đầu xuất hiện. Hãy chấp nhận sự thật khách quan là chúng luôn tồn tại như khối ung thư, cần được loại bỏ.

## When

- Trùng lặp. Khi cứ phải copy cả đoạn code từ chỗ này sang chỗ kia, là lúc bạn vi phạm nguyên tắc DRY (Don't Repeat Yourself). Hãy bắt chước học sinh cấp 2, đặt đoạn code chung này thành nhân tử chung.
- Thiết kế không trực giao.
- Chậm. Thường phải chuyển tính năng từ chỗ này sang chỗ kia để tăng tốc độ.

## How

Bản chất của refactor là redesign. Hiển nhiên, chúng ta cần hết sức thận trọng khi refactor.

- Đừng vừa refactor vừa thêm tính năng.
- Nên có automation test trước rồi hẵng refactor. Cần chạy test thường xuyên để đảm bảo refactor không gây lỗi.
- Refactor từng chút từng chút một, giới hạn khu vực ảnh hưởng càng nhỏ càng tốt.

Refactor là loại bỏ khối u ung thư: càng phẫu thuật sớm càng tốt. Đợi đến khi đoạn code xấu lan rộng mới phẫu thuật thì tốn công, dễ mất kiên nhẫn. Hãy đưa refactor vào schedule, nếu không làm được ngay thì cũng chắc là nó được ghi nhớ và thực hiện càng sớm càng tốt.

Phẫu thuật thì phải đau. Điều quan trọng là xử lí nỗi đau như thế nào. Hãy nhớ kinh nghiệm "cửa sổ vỡ" của cảnh sát New York (nơi tỉ lệ tội phạm cao nhất Mỹ): nếu giải quyết vụ án "cửa sổ vỡ" (nhỏ) ngay, thì số lượng án mạng lớn giảm hẳn.
