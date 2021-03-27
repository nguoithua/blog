---
title: "Khái niệm căn bản trong kiến trúc phần mềm"
layout: post
category: [Software Architecture]
tag: [software architecture]
---

Trong bài viết này, hãy cùng điểm qua các khái niệm căn bản trong kiến trúc phần mềm để có thể hiểu rõ hơn trong các bài viết về sau.Trong bài viết này, hãy cùng điểm qua các khái niệm căn bản trong kiến trúc phần mềm để có thể hiểu rõ hơn trong các bài viết về sau.

## No Silver Bullets!

Điều đầu tiên, cho dù bạn nghĩ thế nào đi nữa thì chắc chắn sẽ không có chuyện 1 bước lên mây, bạn không thể hi vọng có thể áp dụng 1 kiến trúc cho tất cả các vấn đề gặp phải dù cho kiến trúc đó có tốt cỡ nào, một đôi giày triệu $ chắc gì đã làm bạn thấy thoải mái và vừa vặn. Hãy học hỏi thật nhiều các cách tiếp cận khác nhau, ưu nhược của từng cái, vấn đề mà nó giải quyết. Hãy chắc chắn là bạn hiểu rõ dự án của bạn cần gì, hiểu rõ kiến thức nghiệp vụ và yêu cầu của khách hàng, từ đó sẽ đi đến việc quyết định lựa chọn / tùy chỉnh mô hình nào phù hợp nhất.

Rõ ràng là không dễ để những người trẻ tuổi, có ít hoặc không có kinh nghiệm trong việc chọn lựa mô hình kiến trúc nào phù hợp với yêu cầu của dự án. Bằng cách tham khảo các dự án đi trước, tham vấn ý kiến, kinh nghiệm từ những người dày dặn cộng với kiến thức đã học được về kiến trúc phần mềm sẽ giúp bạn đỡ bối rối hơn khi giải quyết các vấn đề ở mức vĩ mô hơn.

Trong kỹ nghệ phần mềm có hàng trăm các thuật ngữ nhập nhằng, mơ hồ được đưa ra khiến cho việc sử dụng và hiểu biết của chúng ta bị nhầm lẫn thậm chí hiểu sai. Cùng làm rõ 1 số thuật ngữ chuyên dùng nhất ở phía dưới đây (tôi dùng nguyên bản tiếng Anh cho tiện refer về sau):

## Functional
Là những đơn vị code (dòng code, method, class hoặc nhóm các class) đề cập đến khía cạnh kỹ thuật của ứng dụng. Functional không liên quan đến nghiệp vụ. Ví dụ một số functional thường gặp: Layers Factories Repositories Value Objects Views ViewModels ConceptualLà những đơn vị code phản ánh các khái niệm nghiệp vụ của ứng dụng, ví dụ như: User Product Checkout Post Comment Review Một điểm lưu ý là một đơn vị code có thể đảm nhận luôn 2 chức năng là Functional và Conceptual. Ví dụ như class “Money” vừa có thể thể hiện như 1 domain concept hoặc có thể coi như là 1 Value Object. (không có ID, có thể immutable,…)

## Package
Tập các class được group lại với nhau theo 1 số rule.

## Module
Theo định nghĩa từ cuốn Software Architecture in Practice thì một module là 1 functional package, nó phản án 1 technical capability (tính năng kỹ thuật) trong ứng dụng. Các module có tính độc lập (decoupled) và một module có thể được thay thế bởi một module khác mà ứng dụng vẫn có thể hoạt động. Ví dụ ta có 1 “Security Module” hoặc “ORM”, hoặc cao hơn nữa, ta có thể xem Client và Server là 2 module của ứng dụng. Module tạo ra tính gắn kết về mặt chức năng kỹ thuật (Functional cohesion) nghĩa là tập các đơn vị code làm chung một Functional sẽ được đóng gói vào một module.

## Component
Ngược lại với Module, theo định nghĩa từ cuốn Software Architecture in Practice thì một Component là một conceptual package, nó phản ánh một business capability (tính năng về nghiệp vụ). Và tất nhiên nó cũng có tính độc lập với các component và module khác. Ví dụ ta có User component, Product component, Checkout component.Một chú ý rất quan trọng đó là component phản ánh 1 bounded context, nó cung cấp tính gắn kết về mặt chức năng nghiệp vụ.Lưu ý: bounded context là thuật ngữ dùng trong Domain Driven Design, đề cập đến việc phân rã nghiệp vụ thành các nghiệp vụ đơn lẻ, nhỏ hơn mà vẫn đảm bảo ý nghĩa của nó trong toàn bộ hệ thống, khi đó bounded context được xem như là cái bao trùm và diễn tả cho nghiệp vụ đó.

## Application
Tác giả xem application là UI – user-facing code, cái được build phía trên cùng và sử dụng các nền tảng nghiệp vụ phía dưới (components). Lấy ví dụ về Web shop, chúng ta có 1 tập các component về nghiệp vụ của 1 web shop. Chúng ta cũng có 2 là trang bán hàng (storefront) cung cấp các UI đến khác hàng và trang admin dùng để quản lý nội bộ. Trang bán hàng và admin có thể coi đó như 2 application sử dụng các nền tảng nghiệp vụ phía dưới.

## System
System là một tập các applications làm việc, tương tác cùng với nhau nhằm phục vụ các nhu cầu của một doanh nghiệp, tổ chức, hay còn được gọi với cái tên mỹ miều hơn: Enterprise Application. Các application trong 1 system có thể hoặc không xây dựng dựa trên cùng một nền tảng nghiệp vụ. Cũng ví dụ về web shop, trang bán hàng và trang admin phụ thuộc vào các nghiệp vụ bán hàng, tuy nhiên bên cạnh đó còn có các application bên thứ 3 khác liên kết trong hệ thống của mình đó là dịch vụ thanh toán, hoặc dịch vụ vận chuyển.

## Architecture
Theo wikipedia thì kiến trúc phần mềm của một chương trình máy tính hay một hệ thống tính toán là cấu trúc của các thành phần trong hệ thống đó. Kiến trúc phần mềm bao gồm các phần tử phần mềm, các thuộc tính và mối quan hệ giữa chúng. Ngoài ra, thuật ngữ “kiến trúc phần mềm” cũng đề cập đến các tài liệu kiến trúc phần mềm của một hệ thống, thuận tiện cho việc trao đổi thông tin giữa các thành viên trong một dự án. Kiến trúc phần mềm giúp việc quyết định ở mức cao trong thiết kế phần mềm dễ dàng hơn và cho phép tái sử dụng các thành phần và mẫu thiết kế của các dự án.

Ngoài ra còn có rất nhiều định nghĩa về Software Architecture, tuy nhiên tôi lại thích cách diễn đạt về Architecture bằng cách nói về két quả đầu ra của Architecture

Khi nói về Architecture, điều đó có nghĩa là:

- Tất cả các quyết định kỹ thuật xuyên suốt tất cả các vấn đề phát triển phần mềm. Ví dụ như: frameworks, coding standards, documentation, process, …;
- Những quyết định về mặt kỹ thuật rất khó thay đổi về sau trong dự án Big picture (cái view tổng thể) của cả system.
- Những bản vẽ tổng quan ban đầu về hình hài của system, cấu trúc và mối liên hệ giữa các components
- Nó chuẩn bị cho dự án sao cho có thể trì hoãn các quyết định (về framework, view, db, …) càng lâu càng tốt.
- Nó chuẩn bị cho dự án để tái sử dụng các thành phần và mô-đun
- Nó thiết lập các chuẩn trong việc nhất quán về mặt kết quả và Nó không phải là trách nhiệm của chỉ một người, mà là của một nhóm các nhà phát triển giàu kinh nghiệm thuộc các nhóm đặc trưng khác nhau trong dự án.

## Architec
Về cơ bản, kiến trúc sư phần mềm chịu trách nhiệm cho thiết kế hệ thống phần mềm và đảm bảo rằng nó đáp ứng các yêu cầu của doanh nghiệp cũng như yêu cầu hệ thống của kết cấu nền của công ti. Kĩ năng đặc biệt này yêu cầu nhiều năm kinh nghiệm phát triển phần mềm trong các nền, ngôn ngữ và công nghệ nào đó. Trước khi thiết kế hệ thống, kiến trúc sư phần mềm phải làm việc chặt chẽ với kĩ sư yêu cầu hay người phân tích doanh nghiệp để hiểu các yêu cầu của khách hàng rồi hỗ trợ cho người quản lí dự án phát triển kế hoạch dự án nơi việc chia các yêu cầu thành những nhiệm vụ nhỏ hơn là mấu chốt.

## Smells of a bad Architecture (and bad code)
### Rigidity
Phần mềm được gọi là cứng nhắc khi nó rất khó thay đổi vì thay đổi này sẽ dẫn đến những thay đổi khác mà không thấy điểm dừng.

### Fragility
Một phần mềm dễ vỡ là khi chỉ một thay đổi nhỏ cũng có thể dẫn đến những behavior không mong muốn và không thể dự đoán.

Immobility (không có tính di động)Một thiết kế không có tính di động (tái sử dụng) là khi nó không thể tách ra hoặc tốn quá nhiều effort để tái sử dụng cho nhiều thành phần khác nhau.

### Viscosity
Trong một hệ thống lõng lẽo là hệ thống dễ dàng để làm sai hơn là làm đúng. Nghĩa là khi ta muốn thực hiện một thay đổi, thay vì làm theo quy định trong thiết kế, ta lại đi “đường tắt” để làm việc đó. Điều đáng nói ở đây không phải là việc ta được đi đường tắt, mà bản thân thiết kế đã không có những ràng buộc chắc chắn để không ai có thể vi phạm và phá vỡ cấu trúc của hệ thống.

### Needless repetition
Điều này xảy ra khi các khái niệm trừu tượng (abstraction) cần thiết không được thực hiện, hoặc là do thiếu thời gian hoặc thiếu kinh nghiệm. Mã có thể đã không được dán sao chép nhưng các quy tắc kinh doanh tương tự được định nghĩa ở nhiều nơi.

### Opacity
Mã đã được viết bằng một cách mờ đục và khó hiểu, và chúng ta cần phải nhảy vào từng method để hiểu những gì đang làm.

### Needless complexity
Việc tạo ra các khái niệm trừu tượng là rất cần thiết để có thể dễ dàng thay đổi và mở rộng trong tương lai, tuy nhiên trong 1 số nỗ lực để tránh các smell ở trên thì các nhà thiết kế có thể sẽ rơi vào bẫy phức tạp hóa vấn đề. Thiết kế phần mềm tốt nhẹ, linh hoạt, dễ đọc và dễ hiểu và trên hết là dễ thay đổi, tuy nhiên bạn không phải cố gắng dự đoán tất cả những thay đổi có thể xảy ra trong tương lai.
