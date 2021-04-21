---
title: "Nguyên tắc thiết kế REST API"
layout: post
category: [Software Engineering]
tag: [rest api, rest, api]
---

REST (Representational State Transfer) có thể hiểu đơn giản là một chuẩn thiết kế phần mềm, nó quy định cách mà client và server sẽ tương tác với nhau.

Theo mình, việc thiết kế REST API là một việc hết sức khó khăn, nó không đơn giản như chỉ cần client gọi được là xong. Đôi khi, bạn sẽ bắt gặp những cuộc tranh luận xoay quoanh vấn đề nên viết thế này, không nên viết thế kia hoặc đôi khi bạn sẽ gặp vấn đề không biết viết API thế nào mặc dù tầng nghiệp vụ đã xong. Để giải quyết vấn đề đó, chúng ta cần quy chuẩn cách tạo API cũng như yêu cầu về chất lượng thiết kế API cho hệ thống.

Với mình, một hệ thống có chất lượng thiết kế API tối cần đáp ứng những yếu tố sau:
1. **Self-documenting** - nhìn vào API có thể đoán được nó dùng để làm gì.
2. **Flexible** - khả năng mở rộng, cũng như tuỳ biến cao.
3. **Unified structure and attribute names** - thống nhất về cấu trúc resource và cách đặt tên cho attributes.
4. **Clear error message** - thông báo lỗi rõ ràng và chi tiết.

Như vậy, Để đáp ứng những những yếu tố trên thì chúng ta sẽ phải tuân thủ các nguyên tắc sau đây:

## 1. Sử dụng HTTP method để mô tả về chức năng của resource:
Chúng ta có 4 HTTP method cơ bản bao gồm POST, GET, PUT, DELETE. Với mỗi method sẽ ứng với một chức năng tương ứng của API là tạo, đọc, sửa và xoá.

|Resources|GET|POST|PUT|DELETE|
|---|---|---|---|---|
|`/photos`|Return a list of photos|Create a new photo|Bulk update of photos|Delete all photos|
|`/photos/{id}`|Return a specific photo|Method not allowed|Edit photo if exists|Delete photo|

## 2. Sử dụng danh từ số nhiều, không dùng động từ:
Như thế này:
```
/cars
/photos
/users
```
Không phải thế này:
```
/getAllUsers
/createUser
/deleteUser
```

## 3. Chỉ dùng danh từ số nhiều:
Rất nhiều người hay có thói quen dùng lẫn lộn giữa danh từ số ít và danh từ số nhiều. Lời khuyên là hãy giữ mọi thứ đơn giản và chỉ sử dụng danh từ số nhiều cho tất cả các resource.

```
/photos instead of /photo
/users instead of /user
/products instead of /product
/cars instead of /car
```

## 4. Liên kết trong resource:

Thông thường chúng ta sẽ có rất nhiều resource có quan hệ đến nhau và việc thiết kế liên kiết cho những resource đó là việc hết sức đau đầu.

Nếu chúng ta có 2 resources là `photos` và `users`. Bây giờ ta cần lấy tất cả photo của user cụ thể, ta sẽ có API sau:
```
GET /users/123/cars
```
Như vậy, nếu ta muốn xem một `photo` cụ thể của một `user`, ta sẽ có 2 cách:
```
GET /users/123/cars/5
GET /cars/5
```
Tuỳ theo yêu cầu kỹ thuật mà ta sẽ có response khác nhau cho 2 resource đó.

Thêm một lưu ý nữa, mỗi reosurce chỉ nên liên kết tối đa 2 object. Và việc liên kết quá nhiều sẽ làm cho resource trở nên rối mắt. Ví dụ:
```
GET /forums/1/discussions/123/replies/23
```

**Lời khuyên:** Với các api truy vấn dữ liệu dạng filter với nhiều param thì có thể dùng cú pháp như sau:
```
GET /forums/1/filter?properties.discussions=123&properties.replies=23
```
Xây dựng sẵn bộ điều kiện truy vấn đơn giản gồm các thành phần như sau:
- `neq`: không bằng
- `gt`: lớn hơn
- `gte`: lớn hơn bằng
- `lt`: nhỏ hơn
- `lte`: nhỏ hơn bằng
- `in`: có trong
- `not_in`: không trong

## 5. Versioning:

Versioning là một điều bắt buộc với tất cả resource, việc đánh version cho resource tuân thủ 2 nguyên tắc sau:
- Bắt đầu bằng `v` và kết thúc bằng một số nguyên dương , tránh dùng số thập phân (dùng `v1` thay vì `v1.5`)
- Versioning sẽ được đặt ở vị trí đầu tiên của resource

Ví dụ:
```
GET /v1/users
```

Thay vì
```
GET /v1.1/users
```

## 6. Đặt tên cho attribute:
Xem ví dụ sau:

**Vimeo:**

```json
{
  "created_time": "2018-03-05T21:04:47+00:00"
}
```

**Youtube:**

```json
{
  "publishAt": "2014-09-01T12:00:00.0Z"
}
```

Ta có thể nhìn thấy các dạng khác nhau. Chúng ta sẽ không nói đến cách nào đúng cách nào sai, mỗi team sẽ tự chọn cho mình một cách và tuân thủ cách viết đó cho toàn project.

Ngoài ra, chúng ta cũng nên chú ý đến việc thống nhất một danh từ cho một attribute cụ thể. Có rất nhiều bạn mặc lỗi là dùng nhiều danh từ khác nhau để nói về cùng 1 loại attribute (`user_id` và `user` cùng được sử dụng khi muốn lấy `user_id` hay `from_date` và `from` cùng được sử dụng khi muốn lấy `from_date`)

Tóm lại tuân thủ 2 nguyên tắc sau:
- Thống nhất 1 loại convention.
- Thống nhất naming cho cùng 1 loại attribute.

## 7. Phân trang.
Xem xét cách lấy 25 phần tử từ vị trí thứ 50 của 3 hệ thống sau:

- Facebook: `offset` 50 and `limit` 25.
- Twitter: `page` 3 and `rpp` 25 (records per page).
- LinkedIn: `start` 50 and `count` 25.

Trong trường hợp này, mình thiên về cách sử dung của facebook vì nó trực quan và dễ hiểu hơn. Ngoài ra, những bạn nào đã code database thì khái niệm `limit` và `offset` cũng không phải là một khái niệm gì mới.

## 8. Tìm kiếm.
Quy tắc: `attribute` tên là `q` (query)

Global search:
```
GET /search?q=foo+bar
```

Scope search:
```
GET /users/123/photos?q=foo+bar
```

## 9. Chọn field trả về.
Trong một số trường hợp, client sẽ không cần đầy đủ thông tin của một object. Ví dụ như phiên bản mobile sẽ không lấy hết thông tin của user như phiên bản web. Chính vì vậy chúng ta cần resource có khả năng tuỳ chỉnh những field trả về. Việc này làm tăng performance cho phía client.
```
GET /users?fields=id,name,address
```

## 10. Định dạng dữ liệu trả về.

Đối với những resource hỗ trợ nhiều định dạng dữ liệu trả về, HTTP-Header sẽ là nơi để xác định dịnh dạng đó.

- `Content-Type`: Khai báo request format.
- `Accept`: Khai báo response format.

## 11. HTTP status code và error message.

Chuẩn HTTP cung cấp cho ta rất nhiều status code. Chúng ta sẽ không cần biết hết tất cả nhưng ít nhất nên biết đến những status code cơ bản này:
### 2xx - Success:
- `200 OK` — This is most commonly used HTTP code to show that the operation performed is successful.
- `201 Created` — This can be used when you use POST method to create a new resource.
- `202 Accepted` — This can be used to acknowledge the request sent to the server.

### 4xx - Client Error
- `400 Bad Request` — This can be used when client side input validation fails.
- `401 Unauthorized` / `403 Forbidden` — This can be used if the user or the system is not authorised to perform certain operation.
- `404 Not Found` — This can be used if you are looking for certain resource and it is not available in the system.

### 5xx - Server Error
- `500 Internal Server Error` — This should never be thrown explicitly but might occur if the system fails.
- `502 Bad Gateway` — This can be used if server received an invalid response from the upstream server.

Đối với error message trả về khi có lỗi xảy ra cần đảm báo dễ hiểu cho cả user, frontend developer và backend developer. Về cơ bản chúng ta sẽ có 3 message trả về phục vụ cho 3 đối tượng khác nhau:
- `user_message` (message trả về cho user).
- `internal_message` (message trả vể cho backend developer).
- `code` (message trả về cho frontend developer).

Như vậy, một message đầy đủ sẽ có dạng sau:
```json
{
  "error": {
    "user_message": "Sorry, the requested resource does not exist.",
    "internal_message": "No car found in the database.",
    "code": 6004
  }
}
```
