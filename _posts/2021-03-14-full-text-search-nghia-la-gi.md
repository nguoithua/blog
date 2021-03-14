---
title: "Full-text search nghĩa là gì?"
layout: post
category: [Software Engineering]
tag: [search, full-text, fulltext search]
---

**Full-text** search chứ không phải full **text-search**.

## Full-text với không full-text

Ví dụ bài viết có 3 phần:
- Tiêu đề
- Các tag
- Thân bài

Nếu khi search, ta chỉ cho search trong tiêu đề và các tag, không cho search trong thân bài, thì đó không phải là full-text search. Thân bài thường rất dài so với hai cái kia, nên ví dụ vì lí do tốc độ search (search trong cả thân bài thì sẽ rất chậm), hoặc vì lí do dung lượng lưu trữ không cho phép (lưu thông tin index về thân bài sẽ tốn nhiều dung lượng), nên ta không thể cho search cả thân bài.

Nếu ta cho search ở cả thân bài, thì đó là full-text search.

Nghĩa là full-text search nghĩa là ta cho phép search toàn bộ văn bản, thay vì chỉ một phần văn bản.

## Term search với full-text search

Ví dụ có văn bản: *I ate pho yesterday.*

Nếu ta search "ate" đương nhiên sẽ ra văn bản trên.

Nếu search "eat" ("ate" là quá khứ của "eat") mà cũng vẫn ra, thì đó là full-text search. Nếu không ra, thì đó chỉ là term search. Term search thường để search keyword, vì thường đối với keyword thì ta muốn search exact match, không muốn biết đổi.

Nghĩa là full-text search cao cấp hơn, nó hiểu "eat", "eating", "eaten" v.v. cũng cùng một duộc với "ate" trong văn bản ban đầu.

Làm được như vậy, vì full-text search engine thường đều có hai thành phần quan trọng sau:

- Phân tách các từ rời ra khỏi câu (tokenizer/analyzer). [The quick brown fox jumps over the lazy dog](https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog), thì engine sẽ tách ra các từ "quick", "brown", "fox", "jumps"...
- Gộp các từ có cùng gốc lại làm một (stemer). Ví dụ văn bản gồm nhiều từ "jumps", "jumped", "jumping", "jumper"... thì engine cũng gộp chúng lại thành từ gốc là "jump".

Hai cái trên phụ thuộc ngôn ngữ. Ví dụ:

- Tiếng Anh có thể nhờ khoảng trắng để phân tách từ, nhưng tiếng CJK (Chinese, Japanese, Korean) lại phải dùng chiêu thức khác vì các từ viết dính sát nhau.
- Tiếng Tàu không cần stemer nhưng tiếng Nhật lại cần.
Thường các engine đều được thiết kế tách làm 2 phần: phần không phụ thuộc ngôn ngữ và phần phụ thuộc ngôn ngữ. Khi muốn hỗ trợ thêm ngôn ngữ nào thì chỉ việc thêm tokenizer và stemer cho ngôn ngữ đó.
