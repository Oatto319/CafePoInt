# ☕ CafePoInt – ระบบจัดการร้านกาแฟ

🎯 **เกี่ยวกับโปรเจกต์**  
CafePoInt คือแอปสำหรับจัดการร้านกาแฟ  
ช่วยเจ้าของร้านบริหารเมนู, การสั่งซื้อ, และสต็อกวัตถุดิบได้ง่ายและมีประสิทธิภาพ  
รองรับทุกแพลตฟอร์ม (Android, iOS, Web) ด้วย Codebase เดียว

🎨 **ไฮไลท์**
- 🎯 **ใช้งานง่าย** – UI/UX ออกแบบให้ใช้งานสะดวก เรียนรู้ได้เร็ว  
- 🚀 **ประสิทธิภาพสูง** – ตอบสนองเร็ว รองรับข้อมูลจำนวนมาก  
- 📱 **Multi-Platform** – ใช้งานได้ทั้ง Mobile (Android/iOS) และ Web  
- 🎨 **Modern Design** – ธีมสีอบอุ่น เหมาะกับร้านกาแฟ  
- 🔐 **ปลอดภัย** – ระบบยืนยันตัวตนผู้ใช้มั่นคง  

---

## 📂 โครงสร้างโปรเจกต์

- `lib/` → โค้ดหลักของแอป  
- `android/` → สำหรับ build Android  
- `ios/` → สำหรับ build iOS  
- `web/` → สำหรับ build Web  
- `assets/` → รูปภาพ, ไอคอน, ฟอนต์  
- `pubspec.yaml` → กำหนด dependencies และ assets  

---

## 🚀 เริ่มต้นใช้งาน

### 1. ติดตั้งเครื่องมือ

- [Flutter SDK](https://flutter.dev/docs/get-started/install)  
- Android Studio หรือ VS Code (พร้อม Flutter/Dart plugin)  
- อุปกรณ์หรือ Emulator (Android / iOS)  

ตรวจสอบการติดตั้ง Flutter:
```bash
flutter doctor
🎨 **ไฮไลท์**
- 🎯 **ใช้งานง่าย** – UI/UX ออกแบบให้ใช้งานสะดวก เรียนรู้ได้เร็ว  
- 🚀 **ประสิทธิภาพสูง** – ตอบสนองเร็ว รองรับข้อมูลจำนวนมาก  
- 📱 **Multi-Platform** – ใช้งานได้ทั้ง Mobile (Android/iOS) และ Web  
- 🎨 **Modern Design** – ธีมสีอบอุ่น เหมาะกับร้านกาแฟ  
- 🔐 **ปลอดภัย** – ระบบยืนยันตัวตนผู้ใช้มั่นคง  

## ✨ ฟีเจอร์หลักของ CafePoInt

🔐 **ระบบจัดการผู้ใช้**  
- 📝 สมัครสมาชิกใหม่  
- 🔑 เข้าสู่ระบบที่ปลอดภัย  
- 👤 จัดการโปรไฟล์ผู้ใช้  

📊 **Dashboard & Analytics**  
- 📈 แดชบอร์ดแสดงข้อมูลภาพรวมร้านกาแฟแบบ Real-time  
- 📉 กราฟและชาร์ตวิเคราะห์ยอดขายและสินค้าคงคลัง  
- 🎯 สถิติยอดขาย, เมนูยอดนิยม, และมูลค่าสินค้าคงคลัง  
- ⚡ การแจ้งเตือนวัตถุดิบใกล้หมด  

📦 **จัดการเมนูและสินค้า**  
- ➕ เพิ่ม/แก้ไข/ลบเมนูและสินค้า  
- 🔍 ค้นหาและกรองเมนู/สินค้า  
- 📷 อัพโหลดรูปภาพสินค้า  
- 🏷️ จัดหมวดหมู่เมนูและวัตถุดิบ  

📥 **จัดการสต็อกวัตถุดิบ**  
- ✅ บันทึกการนำเข้าวัตถุดิบ  
- ⬇️ บันทึกการเบิกวัตถุดิบ  
- 🔄 ปรับปรุงสต็อกแบบ Real-time  
- 📋 ตรวจสอบสต็อกคงเหลือ  

📜 **ประวัติการทำรายการ**  
- 🕐 บันทึกประวัติทุกธุรกรรมการขายและสต็อก  
- 🔎 ค้นหาและกรองประวัติ  

📄 **รายงานและวิเคราะห์**  
- 📊 วิเคราะห์การเคลื่อนไหวสินค้าคงคลัง  
- 📈 รายงานยอดขาย, เมนูยอดนิยม, และกำไร  

🎨 **UI/UX Features**  
- 📱 Responsive Design – รองรับทุกขนาดหน้าจอ  
- 🌙 ธีมสีอบอุ่นเหมาะกับร้านกาแฟ  
- 🎭 Smooth Animations  
- 🎯 Intuitive Navigation – ใช้งานง่าย เรียนรู้ได้เร็ว
## ✨ ฟีเจอร์หลักของ CafePoInt

🔐 **ระบบจัดการผู้ใช้**  
- 📝 สมัครสมาชิกใหม่  
- 🔑 เข้าสู่ระบบที่ปลอดภัย  
- 👤 จัดการโปรไฟล์ผู้ใช้  

📊 **Dashboard & Analytics**  
- 📈 แดชบอร์ดแสดงข้อมูลภาพรวมร้านกาแฟแบบ Real-time  
- 📉 กราฟและชาร์ตวิเคราะห์ยอดขายและสินค้าคงคลัง  
- 🎯 สถิติยอดขาย, เมนูยอดนิยม, และมูลค่าสินค้าคงคลัง  
- ⚡ การแจ้งเตือนวัตถุดิบใกล้หมด  

📦 **จัดการเมนูและสินค้า**  
- ➕ เพิ่ม/แก้ไข/ลบเมนูและสินค้า  
- 🔍 ค้นหาและกรองเมนู/สินค้า  
- 📷 อัพโหลดรูปภาพสินค้า  
- 🏷️ จัดหมวดหมู่เมนูและวัตถุดิบ  

📥 **จัดการสต็อกวัตถุดิบ**  
- ✅ บันทึกการนำเข้าวัตถุดิบ  
- ⬇️ บันทึกการเบิกวัตถุดิบ  
- 🔄 ปรับปรุงสต็อกแบบ Real-time  
- 📋 ตรวจสอบสต็อกคงเหลือ  

📜 **ประวัติการทำรายการ**  
- 🕐 บันทึกประวัติทุกธุรกรรมการขายและสต็อก  
- 🔎 ค้นหาและกรองประวัติ  

📄 **รายงานและวิเคราะห์**  
- 📊 วิเคราะห์การเคลื่อนไหวสินค้าคงคลัง  
- 📈 รายงานยอดขาย, เมนูยอดนิยม, และกำไร  

🎨 **UI/UX Features**  
- 📱 Responsive Design – รองรับทุกขนาดหน้าจอ  
- 🌙 ธีมสีอบอุ่นเหมาะกับร้านกาแฟ  
- 🎭 Smooth Animations  
- 🎯 Intuitive Navigation – ใช้งานง่าย เรียนรู้ได้เร็ว  

---

## 🛠️ เทคโนโลยีที่ใช้

**Frontend Framework**  
- Flutter 3.0+ – UI Framework  

**Programming Language**  
- Dart 3.0+  

**State Management**  
- 🔄 Provider – จัดการ State แบบ Reactive  

**UI Components & Styling**  
- 🎨 Google Fonts – Typography สวยงาม  
- 📊 Charts & Graphs – แสดงข้อมูลเชิงสถิติ  
- 🎭 Custom Widgets – UI Components ที่ออกแบบเอง  

**Network & API**  
- 🌐 HTTP Package – การเชื่อมต่อ REST API  
- 🔌 API Services – จัดการการเรียก Backend  

**Development Tools**  
- 🔧 Analysis Options – ตรวจสอบมาตรฐานโค้ด  
- 🐛 Flutter DevTools – Debugging และ Profiling
## 🗂️ โครงสร้างโปรเจกต์

CafePoInt/
│
├── 📱 android/                    # โปรเจกต์ Android Native
│   ├── app/
│   │   ├── build.gradle.kts
│   │   └── src/
│   │       ├── main/             # AndroidManifest, Resources
│   │       ├── debug/
│   │       └── profile/
│   ├── build.gradle.kts
│   ├── gradle.properties
│   └── settings.gradle.kts
│
├── 🍎 ios/                        # โปรเจกต์ iOS Native
│   ├── Flutter/
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist
│   │   └── Assets.xcassets/
│   ├── Runner.xcodeproj/
│   └── Runner.xcworkspace/
│
├── 🌐 web/                        # ไฟล์สำหรับ Web Platform
│   ├── favicon.png
│   ├── icons/
│   ├── index.html
│   └── manifest.json
│
├── 💻 lib/                        # โค้ดหลักของแอป (Flutter/Dart)
│   ├── 🚀 main.dart              # Entry Point ของแอป
│   │
│   ├── 🌐 api/                   # API Service Layer
│   │   ├── api_service.dart      # Base API Service
│   │   ├── auth_service.dart     # Authentication API
│   │   ├── dashboard_service.dart # Dashboard Data API
│   │   ├── menu_service.dart     # Menu Management API
│   │   └── stock_service.dart    # Stock Management API
│   │
│   ├── 📦 models/                # Data Models (DTO)
│   │   ├── dashboard.dart        # Dashboard Data Model
│   │   ├── menu_item.dart        # Menu Item Model
│   │   ├── stock_transaction.dart # Stock Transaction Model
│   │   └── user.dart             # User Model
│   │
│   ├── 🔄 providers/             # State Management
│   │   ├── auth_provider.dart    # Authentication State
│   │   └── menu_provider.dart    # Menu & Stock State
│   │
│   ├── 📱 screens/               # UI Screens
│   │   ├── dashboard_screen.dart       # หน้าแดชบอร์ด
│   │   ├── login_screen.dart           # หน้าเข้าสู่ระบบ
│   │   ├── register_screen.dart        # หน้าสมัครสมาชิก
│   │   ├── menu_screen.dart            # หน้าจัดการเมนู
│   │   ├── stock_list_screen.dart      # หน้ารายการสต็อก
│   │   └── transaction_history_screen.dart # หน้าประวัติ
│   │
│   ├── 🛠️ utils/                 # Utility Functions
│   │   └── helpers.dart          # Helper Functions
│   │
│   └── 🧩 widgets/               # Reusable Widgets
│       ├── chart_widget.dart     # Chart Components
│       ├── menu_item_card.dart   # Menu Item Widget
│       └── stock_item_card.dart  # Stock Item Widget
│
├── 🎨 assets/                     # Asset Files
│   └── images/
│       └── 1 Login.png
│       └── 2 Register.png
│       └── 3 Dashboard.png
│       └── 4 Menu.png
│       └── 5 Stocks.png
│       └── 6 History.png
│       └── all_CafePoInt.png
│
├── 📄 pubspec.yaml               # Dependencies & Assets Config
├── 🔍 analysis_options.yaml      # Linter Rules
└── 📖 README.md                  # เอกสารโปรเจกต์
## 📚 คำอธิบายโฟลเดอร์สำคัญ

| โฟลเดอร์            | คำอธิบาย |
|--------------------|------------|
| android/           | โปรเจกต์ Android Native (Gradle, Kotlin/Java) |
| ios/               | โปรเจกต์ iOS Native (Xcode, Swift/Objective-C) |
| web/               | ไฟล์สำหรับ Web Platform (HTML, Manifest) |
| lib/               | โค้ด Dart ทั้งหมด (ส่วนหลักของแอป) |
| lib/api/           | Service Layer สำหรับเรียก API |
| lib/models/        | Data Models และ Entity Classes เช่น Menu, Stock, User |
| lib/providers/     | State Management ด้วย Provider Pattern |
| lib/screens/       | หน้าจอ UI ต่างๆ ของแอป เช่น Dashboard, Menu, Stock |
| lib/widgets/       | Custom Widgets ที่ใช้ซ้ำได้ เช่น Card, Chart |
| lib/utils/         | Utility และ Helper Functions |
| assets/            | รูปภาพ, ฟอนต์, และไฟล์ Asset อื่นๆ |
## 🚀 การติดตั้งและใช้งาน

### ✅ ข้อกำหนดเบื้องต้น
ก่อนเริ่มต้น โปรดตรวจสอบว่าคุณได้ติดตั้งเครื่องมือดังต่อไปนี้แล้ว:

✔️ Flutter SDK (v3.0 หรือสูงกว่า) - [ดาวน์โหลด](https://flutter.dev/docs/get-started/install)  
✔️ Dart SDK (v3.0 หรือสูงกว่า) - มาพร้อม Flutter  
✔️ Android Studio หรือ VS Code - IDE สำหรับพัฒนา  
✔️ Android SDK - สำหรับ build Android app  
✔️ Xcode - สำหรับ build iOS app (เฉพาะ macOS)  
✔️ Git - Version control  

---

### 📥 ขั้นตอนการติดตั้ง

1️⃣ Clone โปรเจกต์
```bash
git clone https://github.com/Oatto319/CafePoInt.git
cd CafePoInt
flutter pub get
flutter doctor
flutter run -d android
flutter run -d ios
flutter run -d chrome
flutter run
flutter build apk --release
flutter build appbundle --release
flutter build web --release
class ApiService {
  static const String baseUrl = 'https://cafepoint-backend.vercel.app/api';
  
  // กำหนด endpoints
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String registerEndpoint = '$baseUrl/auth/register';
  static const String dashboardEndpoint = '$baseUrl/dashboard';
  static const String menuEndpoint = '$baseUrl/menu';
  static const String stockEndpoint = '$baseUrl/stocks';
  static const String transactionsEndpoint = '$baseUrl/transactions';
}
| Method | Endpoint       | Description               |
| ------ | -------------- | ------------------------- |
| POST   | /auth/login    | เข้าสู่ระบบผู้ใช้         |
| POST   | /auth/register | สมัครสมาชิกใหม่           |
| GET    | /dashboard     | ข้อมูล Dashboard ร้านกาแฟ |
| GET    | /menu          | รายการเมนูทั้งหมด         |
| POST   | /menu          | เพิ่มเมนูใหม่             |
| PUT    | /menu/:id      | แก้ไขเมนู                 |
| DELETE | /menu/:id      | ลบเมนู                    |
| GET    | /stocks        | รายการวัตถุดิบ/สต็อก      |
| POST   | /stocks        | บันทึกธุรกรรมสต็อก        |
| GET    | /transactions  | ประวัติการทำรายการ        |
## 🏗️ สถาปัตยกรรมแอป

### 🎯 Design Pattern
แอป CafePoInt ใช้ **Provider Pattern** สำหรับการจัดการ State ร่วมกับ **Repository Pattern** สำหรับการจัดการข้อมูลและเชื่อมต่อ API  

โครงสร้างแบบ Layered Architecture:


**คำอธิบายแต่ละ Layer:**

- **UI Layer (Screens & Widgets)**:  
  แสดงผลหน้าจอของผู้ใช้ และจัดการการโต้ตอบ  

- **Provider (State Management)**:  
  จัดการ State ของแอป เช่น ข้อมูลผู้ใช้, เมนู, สต็อก, การแจ้งเตือน  

- **Repository (Data Layer)**:  
  จัดการการดึงข้อมูลจาก API, การแปลง Data Model และ Business Logic  

- **API Service (Network Layer)**:  
  ติดต่อกับ Backend ผ่าน REST API สำหรับ Login, Register, Dashboard, Menu, Stock และ Transactions  
## 📊 Data Flow

กระบวนการไหลของข้อมูลภายในแอป CafePoInt:
UI Layer (Screens & Widgets)
│
▼
Provider (State Management)
│
▼
Repository (Data Layer)
│
▼
API Service (Network Layer)
│
▼
Backend Server
│
▼
Response ส่งกลับ
Repository → Provider → UI


**คำอธิบายลำดับการทำงาน:**

1. **UI** เรียก Method จาก Provider  
2. **Provider** จัดการ State และเรียก Repository เพื่อดึงหรือปรับปรุงข้อมูล  
3. **Repository** จัดการ Business Logic และเรียก API Service  
4. **API Service** ติดต่อ Backend ผ่าน REST API  
5. **Backend** ประมวลผลและส่ง Response กลับ  
6. **Response** ถูกส่งต่อผ่าน Repository → Provider → UI เพื่ออัปเดตหน้าจอผู้ใช้แบบ Real-time  
## 👥 ทีมผู้พัฒนา

- นายธนาพนธ์ แต้มมาก (6612732112)  
- นายปฏิพัทธ์ ศรีบุรินทร์ (6612732117)  
- นายวิมลชัย ด่านประสิทธิ์ผล (6612732126)  
- นางสาวอริยา พงษ์สุวรรณ์ (6612732142)
## 🏛️ สถาบันการศึกษา

**สาขาวิชาวิทยาการคอมพิวเตอร์**  
**คณะวิทยาศาสตร์และเทคโนโลยี**  
🎓 **มหาวิทยาลัยราชภัฏศรีสะเกษ**

**University of Sisaket Rajabhat**
