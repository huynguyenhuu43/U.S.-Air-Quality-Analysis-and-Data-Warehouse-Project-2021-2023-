<h1 align="center" style="color:#4CAF50;">🌈 HCMUS_CSC12107 – Đồ án thực hành - 2425.BI.DATH 🌈</h1>

<p align="center">
  <strong>Nhóm: 3</strong> _ Thành viên:
</p>

| MSSV     | Họ và Tên               |
|----------|--------------------------|
| 19127536 | Võ Lâm Hải Quốc          |
| 21127211 | Nguyễn Vũ Tường An       |
| 21127450 | Võ Trung Tín             |
| 21127699 | Lô Thủy Tiên             |


## 📘 Thông tin học phần

- **📚 Mã học phần**: <span style="color:#3498db;">CSC12107</span>
- **📖 Tên học phần**: <span style="color:#e67e22;">Hệ thống thông tin phục vụ trí tuệ kinh doanh</span>
- **📝 Tên đồ án**: <span style="color:#2ecc71;">Đồ án thực hành - 2425.BI.DATH</span>
- **👩‍🏫 Giảng viên phụ trách**: Cô Hồ Thị Hoàng Vy, Cô Tiết Gia Hồng, Cô Nguyễn Ngọc Minh Châu

- ## 📝 Hình thức thực hiện

- **📄 Báo cáo**: (.doc, .ppt)
- **💻 Source demo**
- **🎥 Video demo**

---

## 📊 Mô tả dự án

Dữ liệu sẽ được phân tích để phát hiện các xu hướng và mẫu trong **chất lượng không khí của Hoa Kỳ từ năm 2021 đến 2023**. Đồ án yêu cầu xây dựng một **kho dữ liệu (Data Warehouse)** từ các nguồn dữ liệu thô, sau đó triển khai các quy trình **ETL**, thiết kế mô hình **OLAP**, thực hiện phân tích dữ liệu và tạo các báo cáo trực quan.

### **🗃️ Dữ liệu**
- Dữ liệu chất lượng không khí hàng ngày của **EPA** tại các quận từ năm 2021 đến 2023.
- Dữ liệu được kết hợp với **dữ liệu địa lý** và **định nghĩa phân loại AQI** để bổ sung thông tin.

### **📐 Thiết kế kho dữ liệu**
- Xây dựng các bảng chiều như:
  - **🌍 Địa lý**: State > County
  - **📅 Thời gian**: Year > Quarter > Month > Day
- Thiết kế các chiều khác để phục vụ yêu cầu báo cáo.

---

## 📈 Yêu cầu báo cáo và phân tích

- **📊 Báo cáo biến động AQI**: Tạo các biểu đồ để trình bày sự biến động AQI theo thời gian.
- **🔍 Phân tích chất lượng không khí**:
  - Đánh giá các biến động AQI.
  - Xác định các ngày có mức ô nhiễm cao.
  - Xác định các yếu tố ảnh hưởng đến chất lượng không khí.
- **🗺️ Bản đồ khu vực**: Tích hợp bản đồ để biểu diễn trung bình AQI qua các khu vực.

### **💡 Khai phá dữ liệu**
- Ứng dụng các mô hình **khai phá dữ liệu** nhằm dự đoán chất lượng không khí trong các kỳ tới (Q1-2024, tháng 01-2024, ...).
- Giải thích thuật toán, lý do chọn lựa và trình bày kết quả.

### **🔍 Tổng quan và kết quả**
- Đánh giá tổng quan về **chất lượng không khí tại các quận ở Hoa Kỳ năm 2023**.
- Kết luận các thành tựu đạt được trong đồ án và đề xuất giải pháp cải thiện chất lượng không khí trong tương lai.

---

## 🎯 Mục tiêu đồ án

1. **📐 Thiết kế mô hình dữ liệu**: Sử dụng mô hình **ngôi sao** hoặc **bông tuyết** để đáp ứng yêu cầu phân tích.
2. **⚙️ Quy trình ETL**: Sử dụng công cụ **SSIS** để thu thập, làm sạch và tích hợp dữ liệu từ các nguồn khác nhau vào kho dữ liệu.
3. **📊 OLAP và Trực quan hóa**: Sử dụng **SSAS** để khai thác các công nghệ OLAP cơ bản và tạo báo cáo bằng **SSRS hoặc Excel**.
4. **🔍 Khai phá dữ liệu**: Áp dụng các thuật toán khai phá dữ liệu với **SSAS** để phân tích và dự đoán chất lượng không khí.

---

## 📜 Kết luận
Dự án này cung cấp cái nhìn tổng quan về **chất lượng không khí tại Hoa Kỳ**, giúp xác định xu hướng và các yếu tố ảnh hưởng chính. Đồng thời, dự án này cũng là cơ sở để đưa ra các **đề xuất cải thiện chất lượng không khí** trong tương lai.
