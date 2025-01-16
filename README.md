 <h1 align="center">Hi 👋, I'm Mob</h1>
<h3 align="center">Join the Cryptocurrency Market, make money from Airdrop - Retroactive with me</h3>

- <p align="left"> <img src="https://komarev.com/ghpvc/?username=mobonchain&label=Profile%20views&color=0e75b6&style=flat" alt="mobonchain" /> <a href="https://github.com/mobonchain"> <img src="https://img.shields.io/github/followers/mobonchain?label=Follow&style=social" alt="Follow" /> </a> </p>

- [![TopAME | Bullish - Cheerful](https://img.shields.io/badge/TopAME%20|%20Bullish-Cheerful-blue?logo=telegram&style=flat)](https://t.me/xTopAME)

# Hướng Dẫn Cài Đặt Node Network3 trên VPS Linux (Ubuntu)

Hướng dẫn này sẽ giúp bạn cài đặt node **Network3** trên **VPS** và kết nối nó với tài khoản **[Network3](https://account.network3.ai/register_page?rc=41880d89)** của bạn.

## Yêu cầu trước khi bắt đầu

- Một VPS với hệ điều hành **Linux** được hỗ trợ **(khuyến nghị sử dụng Ubuntu)**.
- Tài khoản **[Network3](https://account.network3.ai/register_page?rc=41880d89)**. Hãy đảm bảo bạn đã đăng nhập vào tài khoản trên trình duyệt web.

## Các bước cài đặt

1. **Chạy tập lệnh cài đặt**

   Thực hiện lệnh sau trong terminal của VPS:

   ```bash
   wget -qO- https://raw.githubusercontent.com/mobonchain/Network3/refs/heads/main/network3_setup.sh | bash
   ```

   Lệnh này sẽ tải xuống và thực thi tập lệnh để cài đặt và cấu hình node Network3.

2. **Sao chép KEY và LINK được tạo ra**

   Sau khi cài đặt hoàn tất, tập lệnh sẽ hiển thị `KEY` và `LINK`. Đây là thông tin quan trọng để kết nối node của bạn với tài khoản Network3. Hãy sao chép và lưu trữ chúng một cách an toàn.

3. **Kết nối node của bạn**

   - Mở `LINK` đã được cung cấp trong trình duyệt web. Hãy đảm bảo bạn đã đăng nhập vào tài khoản Network3.
   - Truy cập vào mục **Current Node** trên trang web.
   - Nhấn nút **Connect**.
   - Dán `KEY` mà bạn đã sao chép trước đó vào trường được yêu cầu.

4. **Xác minh kết nối**

   Sau khi gửi `KEY`, node của bạn sẽ được kết nối thành công với tài khoản Network3. Bạn có thể kiểm tra trạng thái này trên bảng điều khiển.

## Xử lý sự cố

- **Không có KEY hoặc LINK**: Đảm bảo VPS của bạn còn đủ dung lượng lưu trữ để cài đặt.
- **Lỗi yêu cầu mở link qua Firefox**: Một số VPS không thể chạy dự án này, ví dụ như **VPS Free Tier** của **AWS**,...

---

Chúc bạn cài đặt thành công. Và đây là **Mob** - **[TopAME | Bullish - Cheerful](https://t.me/xTopAME)**

