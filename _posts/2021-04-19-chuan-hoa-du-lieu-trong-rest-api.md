---
title: "Chuẩn hoá dữ liệu trong REST API"
layout: post
category: [Software Engineering]
tag: [rest api, rest, api]
---

Có 2 thứ không thể bỏ qua được trong một API, đó là request và response. Như là khi bạn thấy đâu đó một API, thứ đầu tiên mà bạn nghĩ  request của API đó là gì, response là gì.

Công việc hằng ngày của một backend developer bao gồm cả việc thiết kế API, xử lý và trả dữ liệu cho các dịch vụ gọi vào. Việc chuẩn hoá API giúp cho công việc hằng ngày trở nên dễ dàng hơn, cũng như có thể tái sử dụng được code cho nhiều project.

**Request:**
- Tuân thủ attribute convention
- Thống nhất một danh từ cho một attribute cụ thể.
- Đối với những attribute có dữ liệu gửi lên không phải là những kiểu dữ liệu cơ bản (số hoặc chữ) thì ta sẽ dùng json để biểu diễn dữ liệu của attribute đó.
- Quy tắc sử dụng HTTP parameter và Form-data tương ứng với mỗi HTTP method:

  |Method|HTTP Parameter|Form-data|
  |---|---|---|
  |GET|&check;|&cross;|
  |POST|&cross;|&check;|
  |PUT|&cross;|&check;|
  |DELETE|&check;|&cross;|

**Response:**
Các HTTP Code thường dùng:
- `200`: Success
- `400` : Bad request - dữ liệu gửi lên không hợp lệ
- `401` : Unauthorized - user chưa được xác thực và truy cập vào resource yêu cầu phải xác thực
- `403`: Forbidden - user không có quyền truy cập vào resource
- `404`: Not found - không tồn tại resource
- `500`: Internal Server Error - có lỗi xẩy ra trong hệ thống

Đối với success response, ta có các dạng sau:

```
HTTP/2 200

{
    "data": {}
}
```

Hoặc là:

```
HTTP/2 200

{
    "data": []
}
```
- Ta luôn lấy dữ liệu trong field `data`. Tuỳ theo từng trường hợp mà field này có thể là object hoặc array.

Đối với error repsonse:

```
HTTP/2 500

{
    "error": {
        "user_message": "internal server error",
        "internal_message": "null pointer exception in ...",
        "code": 1,
        "trace_id": "0000000000000"
    }
}
```

- `user_message`: message lỗi trả về.
- `internal_message`: message chi tiết của lỗi phục vụ quá trình fix bug.
- `code`: system error code theo chuẩn của microsoft (tri tiết tại đây).
- `trace_id`: là reuqest id, phục vụ cho quá trình fix bug.
